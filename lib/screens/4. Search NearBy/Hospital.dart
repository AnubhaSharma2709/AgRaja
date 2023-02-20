import 'package:flutter/material.dart';

import '../1.User Login/utilis/utilis.dart';

class Hospital extends StatelessWidget {
  final Function? onMapFunction;
  const Hospital({Key? key , this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              onMapFunction!('Hospitals near me');
            },
            child: Image.asset(
              'lib/assets/1.png',
              height: screenSize.height * 0.09,
              width: screenSize.width * 0.09,
            ),
          ),
          Text('Hospitals',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
