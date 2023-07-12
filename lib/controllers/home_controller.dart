import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';
import 'package:vpn_basic_project/services/vpn_engine.dart';

class HomeController extends GetxController {
  final Rx<VPN?> vpn = VPN.fromJson({}).obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;
  final RxBool startTimer = false.obs;

  Future<void> initializeVPN() async {}

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
