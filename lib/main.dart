import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:resume/NavBar/nav_bar_item.dart';

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

  List<bool> selected = [true, false, false, false];

  void select(int n) {
    for (int i = 0; i < 4; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 216, 216, 216),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(30.0),
                height: MediaQuery.of(context).size.height,
                width: 101.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 24, 24, 26),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0),
                  ),
                ),
                child:
                    const SizedBox(), /*Positioned(
                  top: 10.0,
                  child: Column(
                    children: title
                        .map(
                          (e) => NavBarItem(
                            icon: icon[title.indexOf(e)],
                            title: e,
                            selected: selected[title.indexOf(e)],
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
                ),*/
              ),
            ],
          ),
        ],
      ),
    );
  }
}
