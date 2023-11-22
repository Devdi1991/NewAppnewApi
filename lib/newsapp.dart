import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newsapp_with_api_integration/detailspage.dart';
import 'newsmodel.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<NewsModel> fetchNews() async{
    final url="https://newsapi.org/v2/everything?q=tesla&from=2023-10-22&sortBy=publishedAt&apiKey=2f7c8ce5de6446d18337ed4c3b358aca";
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final result= jsonDecode(response.body);
      return NewsModel.fromJson(result);
    }else{
      return NewsModel();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBar(
  title: Text('News App'),
  centerTitle: true,
),
      body: FutureBuilder(future:fetchNews(),  builder: (context,snapshot){
        return ListView.builder(itemCount:snapshot.data!.articles!.length,itemBuilder: (context,index){
          return Card(
            elevation: 0.5,
            child: ListTile(
              onTap: (){
                var data=snapshot.data!.articles![index];
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(imgaddress: data.urlToImage.toString(),
                    title: data.title.toString(), desc: data.description.toString(), authorname: data.author.toString())));
              },
              leading: CircleAvatar(
                backgroundImage:snapshot.data!.articles![index].urlToImage!=null ?
                NetworkImage("${snapshot.data!.articles![index].urlToImage}"):NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgf2YCf86Lvwrk_ZXvOu23zt1KTi0VlkmsZZFgOC4&s")

              ),
              title: snapshot.data!.articles![index].title!=null?Text("${snapshot.data!.articles![index].title}",
                style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),):Text('Data not Found'),

              subtitle:snapshot.data!.articles![index].description!=null?Text("${snapshot.data!.articles![index].description}",
                style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),):Text('Description not found'),


            ),
          );

        });
      }),
    );
  }
}
