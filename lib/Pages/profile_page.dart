import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/Pages/pages.dart';

class ProfilePage implements Pages {
  @override
  String get title => 'Profile';
  @override
  IconData get icon => FontAwesomeIcons.solidUser;

  @override
  Widget get pageView {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Profile",
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
