import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/hive_data/hive_data.dart';
import 'package:vpn_basic_project/routes/routes.dart';
import 'package:vpn_basic_project/screens/splash.dart';
import 'screens/home_screen.dart';

late Size mq;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveData.initialize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
    return GetMaterialApp(
      title: 'Fire Vpn',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
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

extension appTheme on ThemeData {
  Color get lightColor => Get.isDarkMode ? Colors.white70 : Colors.black87;

  Color get bgColor =>
      Get.isDarkMode ? Color.fromARGB(255, 42, 43, 43) : Colors.grey.shade200;
  Color get countDownColor =>
      Get.isDarkMode ? Colors.white : Colors.orange.shade800;
  Color get mainColor => Get.isDarkMode
      ? Colors.orange.shade400.withOpacity(.4)
      : Colors.orange.shade400;
  Color get btnColor => Get.isDarkMode ? Colors.orange : Colors.orange.shade400;
}
