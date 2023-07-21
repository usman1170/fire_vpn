import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/hive_data/hive_data.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';
import 'package:vpn_basic_project/services/vpn_engine.dart';

import '../models/vpn_config.dart';

class HomeController extends GetxController {
  final Rx<VPN?> vpn = HiveData.vpn.obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;
  final RxBool startTimer = false.obs;
  void connectClick() {
    if (vpn.value!.openvpnconfigdatabase64.isEmpty) return;

    if (vpnState.value == VpnEngine.vpnDisconnected) {
      final vpnData =
          Base64Decoder().convert(vpn.value!.openvpnconfigdatabase64);
      final config = Utf8Decoder().convert(vpnData);
      final vpnConfig = VpnConfig(
        country: vpn.value!.countrylong,
        username: "vpn",
        password: "vpn",
        config: config,
      );

      ///Start if stage is disconnected
      VpnEngine.startVpn(vpnConfig);
      Future.delayed(Duration(seconds: 2), () {
        startTimer.value = true;
      });
    } else {
      ///Stop if stage is "not" disconnected
      VpnEngine.stopVpn();
      startTimer.value = false;
    }
  }

  Color get getbuttonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Colors.orange.shade200;
      case VpnEngine.vpnConnected:
        return Colors.green.shade400;
      default:
        return Colors.orange.shade200;
    }
  }
}
