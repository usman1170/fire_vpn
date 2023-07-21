import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/hive_data/hive_data.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';
import 'package:vpn_basic_project/services/vpn_engine.dart';

class VPNCard extends StatelessWidget {
  const VPNCard({super.key, required this.vpn});
  final VPN vpn;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          controller.vpn.value = vpn;
          HiveData.vpn = vpn;
          Get.back();
          if (controller.vpnState.value == VpnEngine.vpnConnected) {
            VpnEngine.stopVpn();
            Future.delayed(Duration(seconds: 2), () {
              controller.connectClick();
            });
          } else {
            controller.connectClick();
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.only(left: 4, right: 4),
              height: 54,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).btnColor,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                    "assets/flags/${vpn.countryshort.toLowerCase()}.png"),
              ),
            ),
            title: Text(
              vpn.countrylong,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Theme.of(context).lightColor),
            ),
            subtitle: Text(
              formatBytes(vpn.speed),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Theme.of(context).lightColor),
            ),
            trailing: Text(
              "${vpn.numvpnsessions.toString()} Persons",
              style: TextStyle(color: Theme.of(context).lightColor),
            ),
          ),
        ),
      ),
    );
  }

  String formatBytes(int bytes) {
    const suffixes = [
      'Bps',
      'KBps',
      'MBps',
      'GBps',
      'TBps',
      'PBps',
      'EBps',
      'ZBps',
      'YBps',
    ];

    if (bytes == 0) return '0 B';

    final double bytesDouble = bytes.toDouble();
    final int suffixIndex = (log(bytesDouble) / log(1024)).floor();
    final double value = bytesDouble / pow(1024, suffixIndex);

    return '${value.toStringAsFixed(2)} ${suffixes[suffixIndex]}';
  }
}
