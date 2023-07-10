import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class HomeWidgets extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;
  final double size;
  final Color iconColor;
  const HomeWidgets(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.iconColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      height: mq.height * .12,
      width: mq.width * .42,
      decoration: BoxDecoration(
          color: Colors.orange.shade400.withOpacity(.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
            child: icon,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }
}
