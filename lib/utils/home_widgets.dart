import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class LowerWidgets extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;
  final double size;
  final Color iconColor;
  const LowerWidgets(
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
      width: 150,
      decoration: BoxDecoration(
          color: Colors.orange.shade400.withOpacity(.4),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: size,
                width: size,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: iconColor),
                child: icon,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightColor),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).lightColor,
            ),
          ),
        ],
      ),
    );
  }
}

class UpperWidgets extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;
  final double size;
  final Color iconColor;
  const UpperWidgets(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightColor),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 75,
                child: Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).lightColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
