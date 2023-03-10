import 'package:agraja/screens/3.%20Emergency%20Dial/AmbulanceEmergency.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/Dailcontact.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/PoliceEmergency.dart';
import 'package:flutter/material.dart';

class EmergencyDail extends StatelessWidget {
  const EmergencyDail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          ContactEmergency(),
          PoliceEmergency(),
          AmbulanceEmergency(),
        ],
      ),
    );
  }
}
