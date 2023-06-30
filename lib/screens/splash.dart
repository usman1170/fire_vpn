import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_basic_project/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homeroute, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 254, 168, 38)),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: Image.asset("assets/icon/playstore.png"),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Fire VPN",
              style: TextStyle(
                color: Colors.orange.shade400,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: .5,
              ),
            )
          ],
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
              color: Colors.orange.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
