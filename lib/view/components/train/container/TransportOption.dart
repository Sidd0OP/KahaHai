import 'package:flutter/cupertino.dart';

import '../cards/Search.dart';
import '../pill/Pill.dart';

class TransportOption extends StatefulWidget{

  const TransportOption({super.key});

  @override
  State<TransportOption> createState() => _TransportOptionState();
}


class _TransportOptionState extends State<TransportOption>{

  String currentTransportState = "Train";

  void changeTransportState(String transport)
  {

    setState(() {
      currentTransportState = transport;
    });

    print(currentTransportState);
  }

  @override
  Widget build(BuildContext context) {

    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6,
        children: [
          Expanded(child: Pill(
              text: "Train",
              selected: currentTransportState == "Train",
              onTapCallback: () => changeTransportState("Train"))
          ),

          Expanded(child: Pill(
            text: "Flight",
              selected: currentTransportState == "Flight",
            onTapCallback: () => changeTransportState("Flight"))
          ),

          Expanded(child: Pill(
            text: "Bus",
              selected: currentTransportState == "Bus",
            onTapCallback: () => changeTransportState("Bus"))
          )
        ]
    );

  }

}