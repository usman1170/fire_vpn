import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/controllers/location_controller.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/utils/vpncard.dart';

class LocationsScreen extends StatelessWidget {
  LocationsScreen({super.key});

  final _controller = LocationController();
  // final a = 0;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    if (_controller.list.isEmpty) _controller.getVpnData();
    return Obx(
      () => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 12),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).btnColor,
            onPressed: () {
              _controller.getVpnData();
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              height: mq.height * .14,
              decoration: BoxDecoration(
                color: Theme.of(context).mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.orange.shade800,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Servers  (${_controller.list.length})",
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Semantics(
                        button: true,
                        child: InkWell(
                          onTap: () {
                            Get.changeThemeMode(
                              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                            );
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.brightness_medium_sharp,
                                color: Colors.grey.shade100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _controller.isLoading.value
                  ? _loadingAnimation()
                  : _controller.list.isEmpty
                      ? _noVpnfound()
                      : _vpnData(),
            ),
          ],
        ),
      ),
    );
  }

  _vpnData() => Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _controller.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: VPNCard(
                vpn: _controller.list[index],
              ),
            );
          },
        ),
      );

  _noVpnfound() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No VPN found!",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .5),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );

  _loadingAnimation() => Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/lottie/loading3.json",
              width: mq.width * .25,
              frameRate: FrameRate.composition,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Loading VPN Servers...",
              style: TextStyle(
                color: Colors.orange.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );
}
