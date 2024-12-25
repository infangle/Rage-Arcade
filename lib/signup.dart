// signup.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart'; // Import HomeScreen

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      // For example, you can print the values or send them to a backend
      print('Username: $_username');
      print('Password: $_password');
      print('Confirm Password: $_confirmPassword');

      // Save the signup status
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isSignedUp', true);

      // Navigate to HomeScreen after signup
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Let's get started!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                        return 'Username must consist of alphabets only';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters long';
                      }
                      if (value.length > 15) {
                        return 'Username must be at most 15 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _username = value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        )),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      if (value.length > 15) {
                        return 'Password must be at most 15 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        )),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (_password != _confirmPassword) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _confirmPassword = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                      selectionColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      // Add a button to navigate to the login page
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 16),
                          selectionColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Add some spacing below the buttons
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
