import 'package:flutter/material.dart';
import 'package:kundali_gpt/module/homepage/homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  final _buildBody = const <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            useLegacyColorScheme: false,
            type: BottomNavigationBarType.shifting,
            showUnselectedLabels: true,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_add_rounded), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }
}
