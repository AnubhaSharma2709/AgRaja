import 'package:agraja/utilis/color_theme.dart';
import 'package:flutter/material.dart';

class PoliceEmergency extends StatelessWidget {
  const PoliceEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: boxColor,
          ),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Police Emergency Number',
                style: TextStyle(
                  color: textColor,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),),
                Text('Call 1021',
                  style: TextStyle(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),),
                Container(
                  height: 30,
                  width: 80,
                  child: Text('100',
                  style: TextStyle(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.width *
                  ),),
                ),
              ],
            ),
          ),
      ),
      ),
    );
  }
}
