import 'package:flutter/material.dart';

class MainContentCard extends StatefulWidget {
  final int pageSelected;

  const MainContentCard({
    super.key,
    required this.pageSelected,
  });

  @override
  State<MainContentCard> createState() => _MainContentCardState();
}

class _MainContentCardState extends State<MainContentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: (MediaQuery.of(context).size.width - 161) / 8 * 5,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(20.0),
        ),
      ),
      child: const SizedBox(),
    );
  }
}
