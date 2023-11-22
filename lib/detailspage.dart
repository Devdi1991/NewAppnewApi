import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String imgaddress;
  String title;
  String desc;
  String authorname;
   DetailsPage({super.key,required this.imgaddress,required this.title,required this.desc,required this.authorname});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.network(widget.imgaddress),
              
            ),
            SizedBox(height: 30,),
            Text('${widget.title}',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text("${widget.desc}",style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(height: 20,),
            Row(mainAxisAlignment:MainAxisAlignment.end,
              children: [
              Text("${widget.authorname}",style: TextStyle(color: Colors.indigo),)
            ],)
            
          ],
        ),
      ),
    );
  }
}
