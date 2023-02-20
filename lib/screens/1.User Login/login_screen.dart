import 'package:agraja/homepage.dart';
import 'package:agraja/screens/1.User%20Login/helper/helper_function.dart';
import 'package:agraja/screens/1.User%20Login/services/auth_service.dart';
import 'package:agraja/screens/1.User%20Login/services/database_service.dart';
import 'package:agraja/screens/1.User%20Login/sign_up_screen.dart';
import 'package:agraja/screens/1.User%20Login/utilis/color_theme.dart';
import 'package:agraja/screens/1.User%20Login/utilis/constants.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/1.User%20Login/widgets/custom_main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = "";
  String password = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _isLoading ? Center(
        child: CircularProgressIndicator(
          color: colorBorder,),
      ) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 30,
          ),
          child:Column(
            children:<Widget>[
            Image.asset(
              'lib/assets/logo.jpeg',
              height: screenSize.height * 0.2,
              width: screenSize.width * 0.5,
            ),
            Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                                        Text(loginText, style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorBorder,
                      ),
                      ),
                      SizedBox(height: screenSize.height * 0.05,),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: emailText,
                          hintText: hintEmailText,
                          prefixIcon: Icon(Icons.email, color: outlineBorder),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                            print(email);
                          });
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.05,),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: passText,
                          hintText: hintPassText,
                          prefixIcon: Icon(Icons.key, color: outlineBorder),
                        ),
                        validator: (val) {
                          if (val!.length < 6) {
                            return "The password incorrect";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.05,),
                      Center(
                        child: MainButton(
                            child: Text(loginText),
                            color: outlineBorder,
                            isLoading: false,
                            onPressed: () {
                              login();
                            }),
                      ),
                      Text.rich(TextSpan(
                        text: newText,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: registerText,
                            style: const TextStyle(
                                color: spanColor,
                                decoration: TextDecoration.underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, const SignUpScreen());
                              },
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
         ],
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
          await DatabaseService(
              uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);
          //saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(
              snapshot.docs[0]['fullName']);
          nextScreenReplace(context, const HomePage());
        }
        else {
          showSnackBar(context, errorBorder, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
