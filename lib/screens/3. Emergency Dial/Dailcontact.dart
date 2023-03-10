import 'package:agraja/screens/1.User%20Login/utilis/constants.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/addcontact.dart';
import 'package:flutter/material.dart';

class ContactEmergency extends StatelessWidget {
  const ContactEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: OutlinedButton(
        onPressed: () {
          nextScreen(context, const AddContactsPage());
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/contact.png',
                height: MediaQuery.of(context).size.height * 0.03,
                width: screenSize.width * 0.1,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //SizedBox(
                    //  height: MediaQuery.of(context).size.height * 0.01,
                    //),
                    Text(
                      '             Dail\nEmergency Contact',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
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
