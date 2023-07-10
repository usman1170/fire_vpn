import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/screens/locations_screen.dart';
import 'package:vpn_basic_project/utils/countdown.dart';
import 'package:vpn_basic_project/utils/home_widgets.dart';

import '../models/vpn_config.dart';
import '../models/vpn_status.dart';
import '../services/vpn_engine.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _vpnState = VpnEngine.vpnDisconnected;
  List<VpnConfig> _listVpn = [];
  VpnConfig? _selectedVpn;
  bool isDark = false;
  final RxBool _startTimer = false.obs;

  @override
  void initState() {
    super.initState();

    ///Add listener to update vpn state
    VpnEngine.vpnStageSnapshot().listen((event) {
      setState(() => _vpnState = event);
    });

    initVpn();
  }

  void initVpn() async {
    //sample vpn config file (you can get more from https://www.vpngate.net/)
    _listVpn.add(VpnConfig(
        config: await rootBundle.loadString('assets/vpn/japan.ovpn'),
        country: 'Japan',
        username: 'vpn',
        password: 'vpn'));

    _listVpn.add(VpnConfig(
        config: await rootBundle.loadString('assets/vpn/thailand.ovpn'),
        country: 'Thailand',
        username: 'vpn',
        password: 'vpn'));

    SchedulerBinding.instance.addPostFrameCallback(
        (t) => setState(() => _selectedVpn = _listVpn.first));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        // appBar: AppBar(title: Text('OpenVPN Demo')),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.all(16),
            height: mq.height * .45,
            width: mq.width,
            decoration: BoxDecoration(
              color: isDark ? Colors.black87 : Colors.orange.shade400,
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
                        onPressed: () {},
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
                      backgroundColor: Colors.grey.shade100,
                      padding: EdgeInsets.symmetric(horizontal: 16)),
                  child: Text(
                    _vpnState == VpnEngine.vpnDisconnected
                        ? 'Connect VPN'
                        : _vpnState.replaceAll("_", " ").toUpperCase(),
                    style: TextStyle(
                      color: Colors.orange.shade600,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          SizedBox(
            height: 18,
          ),
          Obx(
            () => CountDownWidget(
              startTimer: _startTimer.value,
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
                    HomeWidgets(
                      size: 40,
                      title: "Server",
                      subtitle: "USA",
                      icon: Icon(
                        Icons.vpn_lock_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      iconColor: Colors.orange.shade400.withOpacity(.4),
                    ),
                    HomeWidgets(
                      size: 40,
                      title: "PING",
                      subtitle: "10 ms",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeWidgets(
                      size: 32,
                      title: "Downloading",
                      subtitle: "8 Mbps",
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                        size: 22,
                      ),
                      iconColor: Color.fromARGB(255, 91, 190, 94),
                    ),
                    HomeWidgets(
                      size: 32,
                      title: "Uploading",
                      subtitle: "5 Mbps",
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 22,
                      ),
                      iconColor: Color.fromARGB(255, 237, 98, 96),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // StreamBuilder<VpnStatus?>(
          //   initialData: VpnStatus(),
          //   stream: VpnEngine.vpnStatusSnapshot(),
          //   builder: (context, snapshot) => Text(
          //     "${snapshot.data?.byteIn ?? ""}, ${snapshot.data?.byteOut ?? ""}",
          //     textAlign: TextAlign.center,
          //   ),
          // ),

          // //sample vpn list
          // Column(
          //     children: _listVpn
          //         .map(
          //           (e) => ListTile(
          //             title: Text(e.country),
          //             leading: SizedBox(
          //               height: 20,
          //               width: 20,
          //               child: Center(
          //                   child: _selectedVpn == e
          //                       ? CircleAvatar(backgroundColor: Colors.green)
          //                       : CircleAvatar(backgroundColor: Colors.grey)),
          //             ),
          //             onTap: () {
          //               log("${e.country} is selected");
          //               setState(() => _selectedVpn = e);
          //             },
          //           ),
          //         )
          //         .toList())
        ]),
        bottomNavigationBar: _bottomSheet());
  }

  void _connectClick() {
    ///Stop right here if user not select a vpn
    if (_selectedVpn == null) return;

    if (_vpnState == VpnEngine.vpnDisconnected) {
      ///Start if stage is disconnected
      VpnEngine.startVpn(_selectedVpn!);
    } else {
      ///Stop if stage is "not" disconnected
      VpnEngine.stopVpn();
    }
  }

  Widget _vpnButton() => Semantics(
        button: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            _startTimer.value = !_startTimer.value;
          },
          child: InkWell(
            onTap: _connectClick,
            child: Container(
              padding: EdgeInsets.all(14.5),
              decoration: BoxDecoration(
                color: Colors.orange.shade200.withOpacity(.6),
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
              color: isDark ? Colors.black87 : Colors.orange.shade400,
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
