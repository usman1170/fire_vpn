import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class CountDownWidget extends StatefulWidget {
  final bool startTimer;
  const CountDownWidget({super.key, required this.startTimer});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  Duration duration = Duration();
  Timer? timer;
  _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        duration = Duration(seconds: duration.inSeconds + 1);
      });
    });
  }

  _stopTimer() {
    timer?.cancel();
    timer = null;
    duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null || !widget.startTimer)
      widget.startTimer ? _startTimer() : _stopTimer();
    String twoDigit(int n) => n.toString().padLeft(2, "0");
    final minuts = twoDigit(duration.inMinutes.remainder(60));
    final hours = twoDigit(duration.inHours.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));
    return Container(
      height: 50,
      child: Text(
        "$hours:$minuts:$seconds",
        style: TextStyle(
          color: Theme.of(context).countDownColor,
          fontWeight: FontWeight.w600,
          fontSize: 30,
        ),
      ),
    );
  }
}
