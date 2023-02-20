import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AmbulanceEmergency extends StatelessWidget {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  const AmbulanceEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child:OutlinedButton(
        onPressed: () => _callNumber('9958510119'),
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.pink),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/assets/ambulance.png',
                height: MediaQuery.of(context).size.height * 0.13,
                width: screenSize.width * 0.3,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    Text(
                      'Ambulance',
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
