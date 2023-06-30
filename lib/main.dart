import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_basic_project/routes/routes.dart';
import 'package:vpn_basic_project/screens/splash.dart';
import 'screens/home_screen.dart';

// for size of device
late Size mq;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Vpn',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      routes: {homeroute: (context) => HomeScreen()},
      home: SplashScreen(),
    );
  }
}
