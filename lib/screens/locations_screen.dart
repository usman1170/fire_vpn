import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/services/apis.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  void initState() {
    Apis.getVPNServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: mq.height * .14,
            decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.orange.shade800,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Servers",
                      style: TextStyle(
                        color: Colors.grey.shade100,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.brightness_medium_sharp,
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, bottom: 10),
            child: Row(
              children: [
                Text(
                  "Select Server",
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.orange.shade800,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12, left: 4, right: 8),
                  child: Semantics(
                    button: true,
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                      ),
                      title: const Text("Country"),
                      subtitle: const Text("tap to select the country"),
                      trailing: Icon(Icons.done),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
