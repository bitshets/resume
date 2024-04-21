import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/Cards/main_content_card.dart';
import 'package:resume/Cards/side_content_card.dart';
import 'package:resume/NavBar/nav_bar_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paul Huang',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Paul Huang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> title = [
    "Home",
    "Profile",
    "Resume",
    "Works",
  ];

  List<IconData> icon = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidUser,
    FontAwesomeIcons.clipboardList,
    FontAwesomeIcons.suitcase,
  ];

  int _curPage = 0;

  void select(int n) {
    _curPage = n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: SvgPicture.asset(
              'assets/background/rainbow-vortex.svg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(140.0, 40.0, 100.0, 40.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 128, 128, 128),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(144, 0, 0, 0),
                  offset: Offset(-5.0, 5.0),
                  blurRadius: 10,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 101.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 24, 24, 26),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: title
                        .map(
                          (e) => NavBarItem(
                            icon: icon[title.indexOf(e)],
                            title: e,
                            selected: title.indexOf(e) == _curPage,
                            onTap: () {
                              setState(
                                () {
                                  select(title.indexOf(e));
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: MainContentCard(
                    pageSelected: _curPage,
                  ),
                ),
                const SideContentCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
