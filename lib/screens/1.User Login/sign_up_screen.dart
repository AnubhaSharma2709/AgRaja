import 'package:agraja/homepage.dart';
import 'package:agraja/screens/1.User%20Login/helper/helper_function.dart';
import 'package:agraja/screens/1.User%20Login/login_screen.dart';
import 'package:agraja/screens/1.User%20Login/services/auth_service.dart';
import 'package:agraja/screens/1.User%20Login/utilis/color_theme.dart';
import 'package:agraja/screens/1.User%20Login/utilis/constants.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/1.User%20Login/widgets/custom_main_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Scaffold(
        backgroundColor: backgroundColor,
        body: _isLoading ? Center(
        child: CircularProgressIndicator(
        color: colorBorder,),
    ):SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'lib/assets/logo.jpeg',
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.5,
                  ),
                  Text( registerText, style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorBorder,
                  ),
                  ),
                  SizedBox(height: screenSize.height * 0.05,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Full Name',
                      hintText: 'Enter your Full Name',
                      prefixIcon: Icon(Icons.person, color: outlineBorder),
                    ),
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                        print(fullName);
                      });
                    },
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
                        child: Text(registerText),
                        color: outlineBorder,
                        isLoading: false,
                        onPressed: () {
                          register();
                        }),
                  ),
                  Text.rich(TextSpan(
                    text: alreadyText2,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: loginText,
                        style: const TextStyle(
                            color: spanColor,
                            decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap= (){
                          nextScreen(context, const SignInScreen());
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
      ),
    ),
    );
  }
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async{
        if(value == true){
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplace(context, const HomePage());
        }
        else{
          showSnackBar(context, errorBorder, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
