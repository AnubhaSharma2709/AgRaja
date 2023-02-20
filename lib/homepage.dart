import 'package:agraja/screens/1.User%20Login/helper/helper_function.dart';
import 'package:agraja/screens/1.User%20Login/login_screen.dart';
import 'package:agraja/screens/1.User%20Login/services/auth_service.dart';
import 'package:agraja/screens/1.User%20Login/utilis/color_theme.dart';
import 'package:agraja/screens/1.User%20Login/utilis/utilis.dart';
import 'package:agraja/screens/3.%20Emergency%20Dial/Emergency.dart';
import 'package:agraja/screens/4.%20Search%20NearBy/search_widget.dart';
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
          iconTheme: IconThemeData(color: Colors.pink),
          backgroundColor: Colors.white,
          title: Image.asset(
            'lib/assets/logo.jpeg',
            height: screenSize.height *0.5,
            width: screenSize.width *0.4,
          ),
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 150,
              color: colorBorder,
            ),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmergencyDail(),
            SearchNear(),
          ],
        ),
      ),
    );
  }
}
