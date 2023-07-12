class VPN {
  late final String hostname;
  late final String ip;
  late final int ping;
  late final int speed;
  late final String countrylong;
  late final String countryshort;
  late final int numvpnsessions;
  late final String message;
  late final String openvpnconfigdatabase64;
  VPN({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countrylong,
    required this.countryshort,
    required this.numvpnsessions,
    required this.message,
    required this.openvpnconfigdatabase64,
  });

  VPN.fromJson(Map<String, dynamic> json) {
    hostname = json['HostName'] ?? "";
    ip = json['IP'] ?? "";
    ping = json['Ping'] ?? 0;
    speed = json['Speed'] ?? 0;
    countrylong = json['CountryLong'] ?? "";
    countryshort = json['CountryShort'] ?? "";
    numvpnsessions = json['NumVpnSessions'] ?? 0;
    message = json['Message'] ?? "";
    openvpnconfigdatabase64 = json['OpenVPN_ConfigData_Base64'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['HostName'] = hostname;
    data['IP'] = ip;
    data['Ping'] = ping;
    data['Speed'] = speed;
    data['CountryLong'] = countrylong;
    data['CountryShort'] = countryshort;
    data['NumVpnSessions'] = numvpnsessions;
    data['Message'] = message;
    data['OpenVPN_ConfigData_Base64'] = openvpnconfigdatabase64;
    return data;
  }
}
