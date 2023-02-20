import 'package:agraja/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgRaja());
}

class AgRaja extends StatelessWidget {
  const AgRaja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AgRaja- Your Elder Sister",
      debugShowCheckedModeBanner: false,
      //theme:
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.pinkAccent,
            title: Image.asset(
              'lib/assets/logo.jpeg',
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
            )),
        body: HomePage(),
      ),
    );
  }
}
