import 'package:agraja/screens/1.User%20Login/helper/helper_function.dart';
import 'package:agraja/screens/1.User%20Login/login_screen.dart';
import 'package:agraja/screens/1.User%20Login/services/auth_service.dart';
import 'package:agraja/screens/1.User%20Login/utilis/color_theme.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/Emergency.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/search_widget.dart';
import 'package:agraja/screens/5.Features/RouteAnalysis.dart';
import 'package:agraja/screens/5.Features/sheildMode.dart';
import 'package:agraja/screens/6.Online%20Women%20Commnity/community.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String userName = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }
  Widget build(BuildContext context) {
    Size screenSize = utilis().getscreenSize();
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: outlineBorder,
          size: MediaQuery.of(context).size.width * 0.05),
          backgroundColor: Colors.white,
        title: Image.asset(
            'lib/assets/logo.jpeg',
            alignment: AlignmentDirectional.center,
            height: screenSize.height *0.09,
            width: screenSize.width *0.55,
          ),
        actions: [
          SheildMode(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Text(
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              email,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Text(
                              "No",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const SignInScreen()),
                                      (route) => false);
                            },
                            icon: const Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'lib/assets/girl-icon.png',
                    height: screenSize.height * 0.069,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width* 0.21),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text('Hey',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize:MediaQuery.of(context).size.width * 0.045),),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.009,
                          ),
                          Text(
                            userName,
                            style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize:MediaQuery.of(context).size.width * 0.045),
                          ),

                        ],
                      ),
                      Text('We admire your strong personality',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.037,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

                  SizedBox(height: MediaQuery.of(context).size.height* 0.02),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/assets/contact.jpg',
                        height: MediaQuery.of(context).size.height * 0.039,
                      ),
                      Text('Emergency Contacts',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height* 0.009),
                  EmergencyDail(),
                ],
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/route analysis.png',
                    height: MediaQuery.of(context).size.height * 0.039,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width* 0.009),
                  Text('Route Analysis',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),),
                ],),
              RouteAnalysis(),
            ],
          ),
        ),
            Community(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/assets/nearby-2.png',
                        height: MediaQuery.of(context).size.height * 0.039,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width* 0.02),
                      Text('Places Near You',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                      ),
                    ],
                  ),
                  SearchNear(),
                ],
              ),
            ),

      ],
        ),
    ),
    );

  }
}
