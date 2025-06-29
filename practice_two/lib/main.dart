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
      home: const HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert"),
                content: Text("Do you want to delete!"),
                actions: [
                  TextButton(onPressed: (){MySnackBar("Delete Successfully.", context);}, child: Text("Yes")),
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
                ],
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))
      )

    );

    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        actions: [
          IconButton(onPressed: (){},  icon: Icon(Icons.comment),),
          IconButton(onPressed: (){},  icon: Icon(Icons.email),),
          IconButton(onPressed: (){},  icon: Icon(Icons.search),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Mail"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                accountName: Text("Jahid Ahmed"),
                accountEmail: Text("ajahid97@gmail.com"),
                currentAccountPicture: Image.network("https://picsum.photos/200/300"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          TextButton(onPressed: (){MySnackBar('This is Text Button', context);}, child: Text("Text Button")),
          ElevatedButton(onPressed: (){MyAlertDialog(context);}, child: Text("Elevated Button"), style: buttonStyle),
          OutlinedButton(onPressed: (){MySnackBar('This is Outline Button', context);}, child: Text("Outline Button"), style: buttonStyle,),

        ],
      ),
    );
  }

}
