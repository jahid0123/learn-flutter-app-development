import 'package:flutter/material.dart';
import 'package:tab_bar_activity_fragment/Fragment/AlarmFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/BalanceFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/ContactFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/EmailFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/HomeFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/PersonFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/SearchFragment.dart';
import 'package:tab_bar_activity_fragment/Fragment/SettingsFragment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "HOME",),
              Tab(icon: Icon(Icons.search), text: "Search",),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.email), text: "Email"),
              Tab(icon: Icon(Icons.contact_mail), text: "Contact"),
              Tab(icon: Icon(Icons.person), text: "Person"),
              Tab(icon: Icon(Icons.access_alarm), text: "Alarm"),
              Tab(icon: Icon(Icons.account_balance), text: "Balance")
            ],
          ),
        ),
        body: TabBarView(
            children: [
              HomeFragment(),
              SearchFragment(),
              SettingsFragment(),
              EmailFragment(),
              ContactFragment(),
              PersonFragment(),
              AlarmFragment(),
              BalanceFragment()
            ],
        ),
      ),
    );
  }

}