import 'package:flutter/material.dart';

class MainContentCard extends StatefulWidget {
  final int currentPage;
  final Widget content;

  const MainContentCard(
      {super.key, required this.currentPage, required this.content});

  @override
  State<MainContentCard> createState() => _MainContentCardState();
}

class _MainContentCardState extends State<MainContentCard> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(20.0),
        ),
      ),
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            var tween = Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            );
            return MySlideTransition(
              position: tween.animate(animation),
              child: child,
            );
          },
          child: Container(
            key: ValueKey<int>(widget.currentPage),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    super.key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
