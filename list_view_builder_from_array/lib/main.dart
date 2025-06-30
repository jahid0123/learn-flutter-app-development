import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List view builder from array',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
   MyHomePage({super.key});

  var MyItems=[
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"},
    {"img": "https://picsum.photos/seed/picsum/200/300", "title": "Jahid"}
  ];
  
  mySnackBar(context, msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Builder From Array"),
        backgroundColor: Colors.grey,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          childAspectRatio: 1.2
        ),
        itemCount: MyItems.length,
        itemBuilder: (context, index){
          return GestureDetector(

            onTap: (){mySnackBar(context, MyItems[index]["title"]);},
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill,),
            ),
          );
        },
      ),


    );
  }


}