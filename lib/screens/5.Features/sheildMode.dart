import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/contactsm.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/EmergencyContact/db_service.dart';
import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../1.User Login/utilis/utilis.dart';

class SheildMode extends StatefulWidget {
  const SheildMode({Key? key}) : super(key: key);

  @override
  State<SheildMode> createState() => _SheildModeState();
}

class _SheildModeState extends State<SheildMode> {
  Position? _curentPosition;
  String? _curentAddress;
  LocationPermission? permission;
  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;
  _sendSms(String phoneNumber, String message, {int? simSlot}) async {
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumber, message: message, simSlot: 1);
    if (result == SmsStatus.sent) {
      print("Sent");
      Fluttertoast.showToast(msg: "send");
    } else {
      Fluttertoast.showToast(msg: "failed");
    }
  }

  _getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "Location permissions are  denind");
      if (permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
        Fluttertoast.showToast(
            msg: "Location permissions are permanently denind");
      }
    }
    else {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _curentPosition = position;
        print(_curentPosition!.latitude);
        _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
    }
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _curentAddress =
        "${place.locality},${place.postalCode},${place.street},";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getPermission();
    _getCurrentLocation();
  }

  SafeHome(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.4,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SEND YOUR CUURENT LOCATION IMMEDIATELY TO YOU EMERGENCY CONTACTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                if (_curentPosition != null) Text(_curentAddress!),
                ElevatedButton(
                  child: Text('Get Location'),
                    onPressed: () {
                      _getCurrentLocation();
                    }),
                SizedBox(height: 10),
                OutlinedButton(
                  child: Text('Get Alert'),
                    onPressed: () async {
                      String recipients = "";
                      List<TContact> contactList =
                      await DatabaseHelper().getContactList();

                      String messageBody =
                          "https://www.google.com/maps/search/?api=1&query=33%2C33";
                      if (await _isPermissionGranted()) {
                        contactList.forEach((element) {
                          _sendSms("${element.number}",
                              "i am in trouble $messageBody");
                        });
                      } else {
                        Fluttertoast.showToast(msg: "something wrong");
                      }
                    }),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5),
      child:OutlinedButton(
        onPressed: () => SafeHome(context),
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.pink),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/assets/sheild-mode.jpg',
                height: MediaQuery.of(context).size.height * 0.15,
                width: screenSize.width * 0.25,
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
