import 'package:flutter/material.dart';

import '../1.User Login/utilis/utilis.dart';

class SheildMode extends StatelessWidget {
  const SheildMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child:OutlinedButton(
        onPressed:null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.pink),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/assets/police.png',
                height: MediaQuery.of(context).size.height * 0.25,
                width: screenSize.width * 0.4,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Sheild Mode On',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
