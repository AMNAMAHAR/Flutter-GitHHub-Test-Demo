import 'package:figmmm/pages/login/logi.dart';
import 'package:figmmm/pages/login/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'images/img_5.png',
              fit: BoxFit.cover,
            ),
          ),

          // LogIn Button
          Positioned(
            top: 565,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Login() ,));
                // Add your login button logic here
              },
              child: Container(
                width: 280,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'LogIn',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF113D6D), // Button background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Button border radius
                ),
              ),
            ),
          ),

          // Sign Up Button
          Positioned(
            top: 645,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                // Add your signup button logic here
              },
              child: Container(
                width: 280,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF113D6D), // Button background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Button border radius
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
