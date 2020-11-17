import 'package:experimental_basics/bottom_navigation_example.dart';
import 'package:experimental_basics/screens/bottom_tabbar_example.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experimental Basics'),
        //leading: Icon(Icons.build),
      ),
      body: BottomTabbarExample(),
    );
  }
}
