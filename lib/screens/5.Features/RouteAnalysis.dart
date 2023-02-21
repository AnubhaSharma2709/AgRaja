import 'package:agraja/screens/1.User%20Login/utilis/constants.dart';
import 'package:flutter/material.dart';
import '../1.User Login/utilis/color_theme.dart';

class RouteAnalysis extends StatelessWidget {
  const RouteAnalysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        decoration:InputDecoration(
                          label: Text('From',
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.035
                                ),
                          ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: outlineBorder,
                width: 1,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:errorBorder,
                width: 1,
              ),
            ),
    ),
                        ),
                    ),
                Icon(Icons.arrow_right_alt_rounded),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.055,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    decoration:InputDecoration(
                      label: Text('To',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.035),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: outlineBorder,
                          width: 1,
                        ),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorBorder,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:errorBorder,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                  ],
                ),
           OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: primaryColor,
            side: BorderSide(width: 1.0, color: primaryColor),
          ), child: Text('Find the best route',
           style: TextStyle(
             color: Colors.black,

           ),),
           ),
      ],
          ),
      ),
    );
  }
}
