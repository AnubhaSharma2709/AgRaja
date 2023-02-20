import 'package:flutter/material.dart';
//Login and Register Text
const loginText = "Login";
const registerText = "Register";
const newText = "New to AgRaja?";
const alreadyText2 = "Already have an account? ";
//textfield
const emailText = "Email";
const passText = "Password";
const passtext1 = "Confirm Password";
const hintEmailText = " Enter your Email Id";
const hintPassText= "Enter your Password";
const hintPassConText = "Enter your Confirmed Password";

//padding
const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;


Color primaryColor = Color(0xfffc3b77);

void goTo(BuildContext context, Widget nextScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ));
}

dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}

Widget progressIndicator(BuildContext context) {
  return Center(
      child: CircularProgressIndicator(
        backgroundColor: primaryColor,
        color: Colors.red,
        strokeWidth: 7,
      ));
}

