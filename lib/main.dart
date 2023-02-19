import 'package:agraja/screens/3.%20Emergency%20Dial/AmbulanceEmergency.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/Emergency.dart';
import 'package:flutter/material.dart';
void main(){
  runApp( const AgRaja());
}

class AgRaja extends StatelessWidget {
  const AgRaja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"AgRaja- Your Elder Sister",
      debugShowCheckedModeBanner: false,
      //theme:
      theme:ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: EmergencyDail(),
        ),
      ),
    );
  }
}
