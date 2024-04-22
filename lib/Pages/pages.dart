import 'package:flutter/material.dart';

abstract class Pages {
  String get title;
  IconData get icon;

  Widget get pageView {
    return const Center(
      child: SizedBox(),
    );
  }
}
