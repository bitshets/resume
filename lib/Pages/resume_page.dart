import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/Pages/pages.dart';

class ResumePage implements Pages {
  @override
  String get title => 'Resume';
  @override
  IconData get icon => FontAwesomeIcons.solidIdCard;

  @override
  Widget get pageView {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Resume",
            style: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 24, 24, 26),
            ),
          ),
        ],
      ),
    );
  }
}
