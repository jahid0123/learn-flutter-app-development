import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Card(
          color: Colors.lightGreen,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
          elevation: 100,
          child: SizedBox(
            height: 300,
            width: 300,
            child: Center(
              child: Text("This is the card", style: TextStyle(fontSize: 30),),
            ),
          ),
        ),
      ),
    );
  }


}
