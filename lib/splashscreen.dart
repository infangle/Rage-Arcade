// splashscreen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart'; // Import HomeScreen
import 'signup.dart'; // Import SignUpPage
import 'login.dart'; // Import LoginPage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUser(); // Call the corrected function
  }

  Future<void> _checkUser() async {
    // Corrected function name
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isSignedUp = prefs.getBool('isSignedUp') ?? false;

    // Navigate to the appropriate page after a delay
    Timer(Duration(seconds: 2), () {
      if (isLoggedIn) {
        // User is logged in, navigate to HomeScreen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (isSignedUp) {
        // User has signed up but not logged in, navigate to LoginPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // User is a first-time user, navigate to SignUpPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan, // Set the background color to cyan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png'), // Your logo image
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
