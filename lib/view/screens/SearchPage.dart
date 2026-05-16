import 'package:app/view/AppTheme.dart';
import 'package:app/view/components/train/cards/Floater.dart';
import 'package:app/view/components/train/container/SearchResult.dart';
import 'package:app/view/components/train/container/TransportOption.dart';
import 'package:app/view/components/train/pill/Pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/train/cards/Search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      appBar: AppBar(
        backgroundColor: context.primary,
        elevation: 0,
        title: Text("KahaHai", style: context.titleLarge),
        centerTitle: true,
        automaticallyImplyLeading: false,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(radius: 18, backgroundColor: context.onSurface),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        minimum: EdgeInsets.fromLTRB(10, 10, 10, 0),
        
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            
            //Search Area
            Floater(
              color: context.tertiary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  //buttons
                  TransportOption(),
                  NotificationListener<SearchSubmitNotifier>(
                    child: Search(),
                    onNotification: (notification) {
                      Navigator.pushNamed(context, "/TrackingPage");
                      return true;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("Recent", style: context.headlineLarge?.copyWith(fontSize: 32,fontWeight: FontWeight.w900)),
            SizedBox(height: 8),

            //Recommendations
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                SearchResult(),
                SearchResult(),
                SearchResult()
              ],
            )

          ],
        )


      ),
    );
  }
}
