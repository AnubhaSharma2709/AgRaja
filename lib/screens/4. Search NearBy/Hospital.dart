import 'package:flutter/material.dart';

import '../1.User Login/utilis/utilis.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({Key? key , this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              onMapFunction!('Hospitals near me');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: Colors.white),
            ),
            child: Image.asset(
              'lib/assets/hospital-location.png',
              height: screenSize.height * 0.09,
              width: screenSize.width * 0.09,
            ),
          ),
          Text('Hospitals',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
