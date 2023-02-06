import 'package:agraja/widget/homeWidgets/AmbulanceEmergency.dart';
import 'package:agraja/widget/homeWidgets/PoliceEmergency.dart';
import 'package:flutter/material.dart';
class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          //AutoMechanic(),
          //SafeHome(),
          //ContactEmergency(),
          //FireEmergency(),

        ],
      ),
    );
  }
}
