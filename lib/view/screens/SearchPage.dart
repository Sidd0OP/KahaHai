import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/container/TrainSmall.dart';
import 'package:app/view/components/train/container/TransportOption.dart';
import 'package:app/view/components/train/pill/Pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/train/cards/Search.dart';

class SearchPage extends StatelessWidget{


  const SearchPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      appBar: AppBar(
        backgroundColor: context.primary,
        elevation: 0,
        title: Text("KahaHai", style: context.titleLarge,),
        centerTitle: true,


        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: context.onSurface,
            ),
          ),
        ],
      ),
      body: SafeArea(
          top: true,
          left: false,
          right: false,
          minimum: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TrainSmall(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                //buttons
               TransportOption(),
                //search bar
                Expanded(child: Search())
              ],
            ),
          )
      )
    );
  }

}