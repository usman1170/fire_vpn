class VPN {
  VPN({
    required this.hostname,
    required this.ip,
    required this.score,
    required this.ping,
    required this.speed,
    required this.countrylong,
    required this.countryshort,
    required this.numvpnsessions,
    required this.uptime,
    required this.totalusers,
    required this.totaltraffic,
    required this.logtype,
    required this.operator,
    required this.message,
    required this.openvpnconfigdatabase64,
  });
  late final String hostname;
  late final String ip;
  late final int score;
  late final int ping;
  late final int speed;
  late final String countrylong;
  late final String countryshort;
  late final int numvpnsessions;
  late final int uptime;
  late final int totalusers;
  late final int totaltraffic;
  late final String logtype;
  late final String operator;
  late final String message;
  late final String openvpnconfigdatabase64;

  VPN.fromJson(Map<String, dynamic> json) {
    hostname = json['HostName'] ?? "";
    ip = json['IP'] ?? "";
    score = json['Score'] ?? "";
    ping = json['Ping'] ?? "";
    speed = json['Speed'] ?? "";
    countrylong = json['CountryLong'] ?? "";
    countryshort = json['CountryShort'] ?? "";
    numvpnsessions = json['NumVpnSessions'] ?? "";
    uptime = json['Uptime'] ?? "";
    totalusers = json['TotalUsers'] ?? "";
    totaltraffic = json['TotalTraffic'] ?? "";
    logtype = json['LogType'] ?? "";
    operator = json['Operator'] ?? "";
    message = json['Message'] ?? "";
    openvpnconfigdatabase64 = json['OpenVPN_ConfigData_Base64'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['HostName'] = hostname;
    _data['IP'] = ip;
    _data['Score'] = score;
    _data['Ping'] = ping;
    _data['Speed'] = speed;
    _data['CountryLong'] = countrylong;
    _data['CountryShort'] = countryshort;
    _data['NumVpnSessions'] = numvpnsessions;
    _data['Uptime'] = uptime;
    _data['TotalUsers'] = totalusers;
    _data['TotalTraffic'] = totaltraffic;
    _data['LogType'] = logtype;
    _data['Operator'] = operator;
    _data['Message'] = message;
    _data['OpenVPN_ConfigData_Base64'] = openvpnconfigdatabase64;
    return _data;
  }
}
