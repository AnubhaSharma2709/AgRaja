import 'package:flutter/material.dart';

import '../1.User Login/utilis/utilis.dart';

class PetrolPump extends StatelessWidget {
  final Function? onMapFunction;
  const PetrolPump({Key? key , this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              onMapFunction!('Petrol Pump near me');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: Colors.white),
            ),
            child: Image.asset(
              'lib/assets/petrol.png',
              height: screenSize.height * 0.09,
              width: screenSize.width * 0.09,
            ),
          ),
          Text('Petrol\nPump',
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
