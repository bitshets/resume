import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/Pages/pages.dart';

class HomePage implements Pages {
  @override
  String get title => 'Home';
  @override
  IconData get icon => FontAwesomeIcons.house;

  @override
  Widget get pageView {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Paul Huang",
            style: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 24, 24, 26),
            ),
          ),
          Text(
            "Full-Stack Engineer",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 128, 128, 128),
            ),
          ),
        ],
      ),
    );
  }
}
