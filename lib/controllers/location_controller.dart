import 'dart:ffi';

import 'package:get/get.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';
import 'package:vpn_basic_project/services/apis.dart';

class LocationController extends GetxController {
  List<VPN> list = [];
  final RxBool isLoading = false.obs;
  Future<void> getVpnData() async {
    isLoading.value = true;
    list = await Apis.getVPNServices();
    isLoading.value = false;
  }
}
