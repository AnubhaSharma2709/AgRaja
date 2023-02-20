import 'package:agraja/screens/3.%20Emergency%20Dial/Emergency.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/search_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmergencyDail(),
            SearchNear(),
          ],
        ),
      ),
    );
  }
}
