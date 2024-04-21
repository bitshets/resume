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
          image: AssetImage('profile_photo.jpg'),
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
            await _launchInBrowser(
              linkedin,
            );
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
            await _launchInBrowser(
              github,
            );
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

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
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
