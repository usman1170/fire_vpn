import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_basic_project/models/vpn_model.dart';

class Apis {
  static Future<List<VPN>> getVPNServices() async {
    final List<VPN> vpnList = [];
    try {
      final result = await http.get(
        Uri.parse("http://www.vpngate.net/api/iphone/"),
      );
      final csvString = result.body.split("#")[1].replaceAll("*", " ");
      List<List<dynamic>> listofValues =
          const CsvToListConverter().convert(csvString);
      final header = listofValues[0];

      for (int i = 1; i < listofValues.length - 1; i++) {
        Map<String, dynamic> jsonData = {};
        if (listofValues[i].isNotEmpty) {
          for (int j = 0; j < header.length; j++) {
            jsonData.addAll({header[j]: listofValues[i][j]});
          }
          vpnList.add(VPN.fromJson(jsonData));
        }
        // jsonData.addAll({header[i]: listofValues[1][i]});
      }
    } catch (e) {
      log("Error is = $e");
    }
    // log("${vpnList.length}");
    vpnList.shuffle();
    return vpnList;
  }
}
