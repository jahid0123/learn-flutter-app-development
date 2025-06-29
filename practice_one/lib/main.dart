import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeActivity(),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      theme: ThemeData(primarySwatch: Colors.blue),
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First Flutter App"),
        backgroundColor: Colors.green,
        toolbarOpacity: 1,
        actions: [
          IconButton(onPressed: () {
            MySnackBar("Comments", context);
          }, icon: Icon(Icons.comment)),
          IconButton(onPressed: () {
            MySnackBar("Search", context);
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: () {
            MySnackBar("Settings", context);
          }, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {
            MySnackBar("Email", context);
          }, icon: Icon(Icons.email))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          MySnackBar("Floating Action Button", context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar("Home bottom menu", context);
          }
          if (index == 1) {
            MySnackBar("Contact bottom menu", context);
          }
          if (index == 2) {
            MySnackBar("Profile bottom menu", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightGreen),
                accountName: Text("Jahid Ahmed"),
                accountEmail: Text("ajahid97@gmail.com"),
                currentAccountPicture: Image.network("https://picsum.photos/200/300"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                MySnackBar("Home bottom menu", context);
              },
            ),
            ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.message),
              onTap: () {
                MySnackBar("Contact bottom menu", context);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.browse_gallery),
              onTap: () {
                MySnackBar("Gallery bottom menu", context);
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                MySnackBar("Settings bottom menu", context);
              },
            ),
            ListTile(
              title: Text("Feedback"),
              leading: Icon(Icons.feedback),
              onTap: () {
                MySnackBar("Feedback bottom menu", context);
              },
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {
                MySnackBar("Logout bottom menu", context);
              },
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text("Jahid Ahmed", style: TextStyle(fontSize: 10),),
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.lightGreen, width: 6)
            ),
          ),
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text("Jahid Ahmed", style: TextStyle(fontSize: 10),),
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.lightGreen, width: 6)
            ),
          ),
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(5),
            child: Text("Jahid Ahmed", style: TextStyle(fontSize: 10),),
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.lightGreen, width: 6)
            ),
          ),

        ],
      )
    );
  }
}
