import 'package:app/view/components/train/container/TrainLarge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget{

  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Scaffold(

      backgroundColor: color.secondary,
      body: Align(alignment: Alignment.bottomCenter,child: TrainLarge())
    );
  }



}