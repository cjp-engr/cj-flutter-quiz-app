import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Raleway',
        backgroundColor: Colors.blueGrey[600],
        // splashColor: Colors.red,
        primaryColor: Colors.amber.shade700,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.red,
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.blueGrey[800],
            ),
            animationDuration: const Duration(milliseconds: 100),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
            ),
            elevation: MaterialStateProperty.all(20),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
