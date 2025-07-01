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
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Container(color: Colors.amber,), flex: 25,),
          Expanded(child: Container(color: Colors.pink,), flex: 25,),
          Expanded(child: Container(color: Colors.lightGreen,), flex: 25,),
          Expanded(child: Container(color: Colors.yellow), flex: 25,),
          Expanded(child: Container(color: Colors.lightGreenAccent,), flex: 20,)
        ],
      ),

    );
  }
}
