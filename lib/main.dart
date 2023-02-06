import 'package:agraja/screens/homeScreen.dart';
import 'package:agraja/screens/sign_in_screen.dart';
import 'package:agraja/utilis/color_theme.dart';
import 'package:flutter/material.dart';
void main(){
  runApp( const AgRaja());
}

class AgRaja extends StatelessWidget {
  const AgRaja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"AgRaja- Your Elder Sister",
      debugShowCheckedModeBanner: false,
      //theme:
      theme:ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
