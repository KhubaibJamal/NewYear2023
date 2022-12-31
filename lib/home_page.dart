import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerRight;
  bool _visible = false;

  @override
  void initState() {
    _confettiControllerLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiControllerRight =
        ConfettiController(duration: const Duration(seconds: 10));
    showBanner();
    // super.initState();
  }

  @override
  void dispose() {
    _confettiControllerLeft.dispose();
    _confettiControllerRight.dispose();
    super.dispose();
  }

  showBanner() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _visible = true;
        _confettiControllerLeft.play();
        _confettiControllerRight.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          AnimatedScale(
            scale: _visible ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 150),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "HAPPY NEW YEAR \n",
                      style: GoogleFonts.jua(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "2023",
                      style: GoogleFonts.jua(
                        fontSize: 125,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _confettiControllerLeft,
              blastDirection: -pi / 3,
              emissionFrequency: 0.01,
              numberOfParticles: 15,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _confettiControllerRight,
              blastDirection: -3 * pi / 4,
              emissionFrequency: 0.01,
              numberOfParticles: 15,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          ),
          AnimatedScale(
            scale: _visible ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.only(top: 675),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "< KJ />",
                      style: GoogleFonts.jua(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
