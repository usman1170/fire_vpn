import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class Apis {
  static Future<void> getVPNServices() async {
    final result = await http.get(
      Uri.parse("http://www.vpngate.net/api/iphone/"),
    );
    final csvString = result.body.split("#")[1].replaceAll("*", " ");
    List<List<dynamic>> listofValues =
        const CsvToListConverter().convert(csvString);
    final header = listofValues[0];
    final jsonData = {};
    for (int i = 0; i < header.length; i++) {
      jsonData.addAll({header[i]: listofValues[1][i]});
    }
    log(jsonEncode(jsonData));
    // print(listofValues);
  }
}
