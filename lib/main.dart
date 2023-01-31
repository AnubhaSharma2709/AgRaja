import 'package:flutter/material.dart';
void main(){
  runApp( const AgRaja());
}

class AgRaja extends StatelessWidget {
  const AgRaja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title:"AgRaja- Your Elder Sister",
      debugShowCheckedModeBanner: false,
      home: Center(child: Text("Hello World")),

    );
  }
}
