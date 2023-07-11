import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vpn_basic_project/models/vpn_model.dart';

class VPNCard extends StatelessWidget {
  const VPNCard({super.key, required this.vpn});
  final VPN vpn;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
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
                  color: Colors.black45,
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
            ),
            subtitle: Text(
              formatBytes(vpn.speed),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: Text("${vpn.numvpnsessions.toString()} Persons"),
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
