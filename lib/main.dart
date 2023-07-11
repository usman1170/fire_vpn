import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vpn_basic_project/routes/routes.dart';
import 'package:vpn_basic_project/screens/splash.dart';
import 'screens/home_screen.dart';

// for size of device
late Size mq;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // for full screen of splash screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  // to set oreantations of device
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Vpn',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        homeroute: (context) => HomeScreen(),
      },
      home: SplashScreen(),
    );
  }
}
