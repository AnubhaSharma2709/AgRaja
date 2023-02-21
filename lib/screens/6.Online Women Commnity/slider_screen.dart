import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.19,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
         Image.asset('lib/assets/women.png',
         //width: MediaQuery.of(context).size.width,
         //height: MediaQuery.of(context).size.height * 0.5
        ),
          Image.asset('lib/assets/women-1.jpg',
              //width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          Image.asset('lib/assets/women-2.png',
              //width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}

