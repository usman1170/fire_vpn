// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_config.dart';
import 'package:vpn_basic_project/screens/locations_screen.dart';
import 'package:vpn_basic_project/utils/countdown.dart';
import 'package:vpn_basic_project/utils/home_widgets.dart';

import '../models/vpn_status.dart';
import '../services/vpn_engine.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    ///Add listener to update vpn state
    VpnEngine.vpnStageSnapshot().listen((event) {
      setState(() => _controller.vpnState.value = event);
    });
    return Obx(
      () => Scaffold(
          backgroundColor: Theme.of(context).bgColor,
          body: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: EdgeInsets.all(16),
              height: mq.height * .45,
              width: mq.width,
              decoration: BoxDecoration(
                color: Theme.of(context).mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(170),
                  bottomRight: Radius.circular(170),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade100,
                            size: 26,
                          ),
                        ),
                        Text(
                          "Fire VPN",
                          style: TextStyle(
                            color: Colors.grey.shade100,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .6,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.changeThemeMode(
                              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                            );
                          },
                          icon: Icon(
                            Icons.brightness_medium_outlined,
                            color: Colors.grey.shade100,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  _vpnButton(),
                  SizedBox(
                    height: 18,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            _controller.vpnState.value == VpnEngine.vpnConnected
                                ? Colors.green.shade400.withOpacity(.8)
                                : Colors.grey.shade100,
                        padding: EdgeInsets.symmetric(horizontal: 16)),
                    child: Text(
                      _controller.vpnState.value == VpnEngine.vpnDisconnected
                          ? 'Connect VPN'
                          : _controller.vpnState.value
                              .replaceAll("_", " ")
                              .toUpperCase(),
                      style: TextStyle(
                        color:
                            _controller.vpnState.value == VpnEngine.vpnConnected
                                ? Colors.white
                                : Colors.orange.shade600,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_controller.vpnState.value == VpnEngine.vpnConnected)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 40,
                        width: 40,
                        child: LottieBuilder.asset(
                          "assets/lottie/fire.json",
                          frameRate: FrameRate.max,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: CountDownWidget(
                        startTimer: _controller.vpnState.value ==
                            VpnEngine.vpnConnected,
                      ),
                    ),
                    if (_controller.vpnState.value == VpnEngine.vpnConnected)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 40,
                        width: 40,
                        child: LottieBuilder.asset(
                          "assets/lottie/fire.json",
                          frameRate: FrameRate.max,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UpperWidgets(
                        size: 40,
                        title: "Server",
                        subtitle: _controller.vpn.value!.countrylong.isEmpty
                            ? "Country"
                            : _controller.vpn.value!.countrylong,
                        icon: Icon(
                          Icons.vpn_lock_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                        iconColor: Colors.orange.shade400.withOpacity(.4),
                      ),
                      UpperWidgets(
                        size: 40,
                        title: "PING",
                        subtitle: _controller.vpn.value!.ping == null
                            ? "Country"
                            : "${_controller.vpn.value!.ping} ms",
                        icon: Icon(
                          Icons.equalizer_rounded,
                          color: Colors.white,
                        ),
                        iconColor: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<VpnStatus?>(
                    initialData: VpnStatus(),
                    stream: VpnEngine.vpnStatusSnapshot(),
                    builder: (context, snapshot) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LowerWidgets(
                          size: 30,
                          title: "Downloading",
                          subtitle: "${snapshot.data?.byteIn ?? "0.0 Mbps"}",
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: 22,
                          ),
                          iconColor: Color.fromARGB(255, 91, 190, 94),
                        ),
                        LowerWidgets(
                          size: 30,
                          title: "Uploading",
                          subtitle: "${snapshot.data?.byteOut ?? "0.0 Mbps"}",
                          icon: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 22,
                          ),
                          iconColor: Color.fromARGB(255, 237, 98, 96),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
          bottomNavigationBar: _bottomSheet()),
    );
  }

  Widget _vpnButton() => Obx(
        () => Semantics(
          button: true,
          child: InkWell(
            onTap: () {
              _controller.connectClick();
            },
            child: Container(
              padding: EdgeInsets.all(14.5),
              decoration: BoxDecoration(
                color: _controller.getbuttonColor.withOpacity(.6),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.orange.shade200.withOpacity(.9),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: mq.height * .13,
                  width: mq.height * .13,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade500,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.power,
                      color: Colors.grey.shade200,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  Widget _bottomSheet() => Semantics(
        button: true,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationsScreen(),
                ));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            padding: EdgeInsets.all(12),
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).mainColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.globe,
                          color: Colors.grey.shade200,
                          size: 34,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Chnage Location",
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange.shade600,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
