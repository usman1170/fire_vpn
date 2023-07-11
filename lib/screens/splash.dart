import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homeroute, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange.shade600),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: LottieBuilder.asset(
                      "assets/lottie/fire.json",
                      frameRate: FrameRate.composition,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Fire VPN",
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .5,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 90,
                width: 90,
                child: LottieBuilder.asset(
                  "assets/lottie/loading3.json",
                  frameRate: FrameRate.composition,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 40),
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.orange.shade100.withOpacity(.6),
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            "Powered by Usman Ghani",
            style: TextStyle(
              color: Colors.orange.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
