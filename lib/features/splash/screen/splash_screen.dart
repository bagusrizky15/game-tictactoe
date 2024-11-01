import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/features/home/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                'Tic Tac Toe',
                style: GoogleFonts.pressStart2p(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Image.asset('assets/images/t3logo.png', width: 150, fit: BoxFit.scaleDown, color: Colors.white),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
            top: 120,
            left: 40,
            right: 40,
            bottom: 60,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.all(30),
                color: Colors.white,
                child: Center(
                  child: Text(
                    'PLAY GAME',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ),
        )
      ]),
    );
  }
}
