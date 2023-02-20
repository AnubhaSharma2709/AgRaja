import 'package:agraja/homepage.dart';
import 'package:agraja/screens/1.User%20Login/helper/helper_function.dart';
import 'package:agraja/screens/1.User%20Login/login_screen.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AgRaja());
}


class AgRaja extends StatefulWidget {
  const AgRaja({Key? key}) : super(key: key);

  @override
  State<AgRaja> createState() => _AgRajaState();
}

class _AgRajaState extends State<AgRaja> {
  bool _isSignedIn = false;
  @override
  void initState(){
    super.initState();
    getUserLoggedInStatus();
  }
  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  Widget build(BuildContext context) {
        return MaterialApp(
      title: "AgRaja- Your Elder Sister",
      debugShowCheckedModeBanner: false,
      //theme:
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(

        body: _isSignedIn? const HomePage() : const SignInScreen(),
      ),
    );
  }
}
