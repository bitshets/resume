import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/Pages/pages.dart';

class LogsPage implements Pages {
  @override
  String get title => 'Logs';
  @override
  IconData get icon => FontAwesomeIcons.fileLines;

  @override
  Widget get pageView {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Logs",
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
