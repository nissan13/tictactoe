import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle:
        const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                "TIC TAC TOE",
                style: myNewFontWhite.copyWith(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.none,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Container(
                  child: Image.asset(
                    "assets/images/logo.png",
                    // color: Colors.white,
                    fit: BoxFit.fill,
                  ),
                ),
                radius: 80.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 50),
            child: Container(
              child: Text(
                "@NISHAN",
                style: myNewFontWhite.copyWith(fontSize: 15),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Play Now",
                    style: myNewFontWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
