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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Center(child: Text('This is the center of page')),
      ),
    );
  }
}
