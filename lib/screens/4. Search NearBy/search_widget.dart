import 'package:agraja/screens/4.%20Search%20NearBy/BusStand.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/Hospital.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/Pharmacy.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/PoliceStation.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../1.User Login/utilis/utilis.dart';

class SearchNear extends StatelessWidget {
  const SearchNear({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Container(
      height: screenSize.height * 0.5,
      width: MediaQuery.of(context).size.width ,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children:  [
         Hospital(onMapFunction: openMap),
          PoliceStation(onMapFunction: openMap),
          Pharmacy(onMapFunction: openMap),
          BusStand(onMapFunction: openMap),
        ],
      ),
    );
  }
}
