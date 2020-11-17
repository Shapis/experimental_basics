import 'package:experimental_basics/screens/home_screen.dart';
import 'package:experimental_basics/provider_data/single_input_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleInputData>(
            create: (context) => SingleInputData()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(fontFamily: 'SourceSansPro'),
      ),
    );
  }
}
