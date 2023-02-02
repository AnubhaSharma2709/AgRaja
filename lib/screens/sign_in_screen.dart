import 'package:agraja/utilis/color_theme.dart';
import 'package:agraja/utilis/constants.dart';
import 'package:agraja/utilis/utilis.dart';
import 'package:agraja/widget/text_feild_widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/logo.jpeg',
                      height: screenSize.height * 0.25,
                      width: screenSize.width * 0.70,
                    ),
                    Container(
                      height: screenSize.height * 0.5,
                      width: screenSize.height * 0.5,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: outColor,
                          width: 2.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                            title: emailText,
                            controller: emailController,
                            obscureText: false,
                            hintText: HintText1,
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          TextFieldWidget(
                            title: passText,
                            controller: emailController,
                            obscureText: false,
                            hintText: HintText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
