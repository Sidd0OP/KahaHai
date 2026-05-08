import 'package:app/view/components/train/cards/LargeContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.secondary,
      body: Container(
          alignment: Alignment.bottomCenter,
          child: LargeContainer()
      )
    );
  }



}