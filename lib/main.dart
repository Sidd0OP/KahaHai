import 'package:app/view/appTheme.dart';
import 'package:app/view/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {

  //constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //root of ui
    return MaterialApp(
      title: 'Kaha Hai',
      theme: AppTheme.appTheme,
      home: const Home()
    );
  }
}

