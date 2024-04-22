// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SideContentCard extends StatelessWidget {
  const SideContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(
        top: 100.0,
        bottom: 15.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(20.0),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePhoto(),
          SizedBox(height: 40.0),
          ProfileName(),
          SubTitle(),
          SizedBox(height: 10.0),
          PersonalLinks(),
          SizedBox(height: 40.0),
          DownloadCSVButton(),
          Expanded(
            child: SizedBox(),
          ),
          CopyRight(),
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          color: const Color.fromARGB(255, 216, 216, 216),
          width: 2.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 24, 24, 26),
            offset: Offset(20.0, 15.0),
          ),
        ],
      ),
      child: const ClipOval(
        child: Image(
          image: AssetImage('assets/profile_photo.jpg'),
        ),
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Paul Huang",
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w800,
        color: Color.fromARGB(255, 240, 240, 240),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Full-Stack Engineer",
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 182, 182, 182),
      ),
    );
  }
}

class PersonalLinks extends StatelessWidget {
  const PersonalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri linkedin =
        Uri(scheme: 'https', host: 'www.linkedin.com', path: 'in/bitshets');
    final Uri github =
        Uri(scheme: 'https', host: 'github.com', path: 'bitshets');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await launchUrl(linkedin);
          },
          tooltip: "LinkedIn",
          icon: const Icon(
            FontAwesomeIcons.linkedin,
            size: 18.0,
            color: Color.fromARGB(255, 240, 240, 240),
          ),
        ),
        const SizedBox(width: 10.0),
        IconButton(
          onPressed: () async {
            await launchUrl(github);
          },
          tooltip: "GitHub",
          icon: const Icon(
            FontAwesomeIcons.github,
            size: 18.0,
            color: Color.fromARGB(255, 240, 240, 240),
          ),
        ),
      ],
    );
  }
}

class DownloadCSVButton extends StatefulWidget {
  const DownloadCSVButton({super.key});

  @override
  State<DownloadCSVButton> createState() => _DownloadCSVButtonState();
}

class _DownloadCSVButtonState extends State<DownloadCSVButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _color1 = ColorTween(
      end: const Color.fromARGB(255, 230, 230, 230),
      begin: const Color.fromARGB(255, 128, 128, 128),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _color2 = ColorTween(
      end: const Color.fromARGB(255, 128, 128, 128),
      begin: const Color.fromARGB(255, 230, 230, 230),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: _color1.value,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color.fromARGB(255, 230, 230, 230),
          width: 2.0,
        ),
      ),
      child: GestureDetector(
        onTap: () => downloadResumeFile("assets/assets/Paul_Huang_resume.pdf"),
        child: MouseRegion(
          onEnter: (value) {
            _controller.forward();
          },
          onExit: (value) {
            _controller.reverse();
          },
          cursor: SystemMouseCursors.click,
          child: Center(
            child: Text(
              "Download CV",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: _color2.value,
              ),
            ),
          ),
        ),
      ),
    );
  }

  downloadResumeFile(url) {
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'Paul_Huang_Resume.pdf';
    html.document.body?.children.add(anchor);

    anchor.click();

    html.document.body?.children.remove(anchor);
  }
}

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} All Rights Reserved.",
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12.0,
        color: Color.fromARGB(255, 182, 182, 182),
      ),
    );
  }
}
