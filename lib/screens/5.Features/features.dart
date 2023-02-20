import 'package:agraja/screens/5.Features/route%20analysis.dart';
import 'package:agraja/screens/5.Features/sheildMode.dart';
import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
         RouteAnalysis(),
          SheildMode(),
        ],
      ),
    );
  }
}
