import 'package:agraja/screens/1.User%20Login/utilis/constants.dart';
import 'package:agraja/screens/6.Online%20Women%20Commnity/slider_screen.dart';
import 'package:flutter/material.dart';

import '../1.User Login/utilis/utilis.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.white),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'lib/assets/community.png',
                  height: MediaQuery.of(context).size.height * 0.039,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(
                  'Join Women Community',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                Icon(Icons.arrow_right_alt_rounded,
                color: primaryColor,),
              ],
            ),
            SliderScreen(),
          ],
        ),
      ),
    );
  }
}
