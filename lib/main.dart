import 'package:flutter/material.dart';
import 'package:fonibotask/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
