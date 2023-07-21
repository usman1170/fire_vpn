import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';

class HiveData {
  static late Box box;
  static Future<void> initialize() async {
    await Hive.initFlutter();
    box = await Hive.openBox("data");
  }

  static VPN get vpn => VPN.fromJson(
        jsonDecode(
          box.get("vpn") ?? "{}",
        ),
      );

  static set vpn(VPN v) => box.put(
        "vpn",
        jsonEncode(v),
      );
  static List<VPN> get vpnList {
    List<VPN> temp = [];
    final data = jsonDecode(box.get("vpnList") ?? "[]");
    for (var i in data) temp.add(VPN.fromJson(i));
    return temp;
  }

  static set vpnList(List<VPN> v) => box.put(
        "vpnList",
        jsonEncode(v),
      );
}
