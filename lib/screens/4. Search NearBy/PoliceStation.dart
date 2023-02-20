import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:flutter/material.dart';

class PoliceStation extends StatelessWidget {
  final Function? onMapFunction;
  const PoliceStation({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              onMapFunction!('Police Station near me');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: Colors.white),
            ),
            child: Image.asset(
              'lib/assets/1.png',
             height: screenSize.height * 0.09,
              width: screenSize.width * 0.09,
            ),
          ),
          Text('Police\n Station',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
              ),
        ],
      ),
    );
  }
}
