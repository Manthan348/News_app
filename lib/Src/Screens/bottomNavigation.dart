import 'package:flutter/material.dart';
import 'package:news_app/Src/Screens/main_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 1);
    // TODO: implement initState
    super.initState();
  }

  late PersistentTabController? _controller;
  List<PersistentTabConfig> _pages = [
    PersistentTabConfig(
      screen: MainPage(),
      item: ItemConfig(
        inactiveBackgroundColor: Colors.transparent,
        activeForegroundColor: Color(0xffDEE9FF),
        icon: Icon(
          Icons.trending_up,
          size: 21,
          color: Colors.blue,
        ),
        inactiveIcon: Icon(
          Icons.trending_up,
          size: 21,
          color: Colors.grey,
        ),
        title: 'Home',
      ),
    ),
    PersistentTabConfig(
      screen: MainPage(),
      item: ItemConfig(
        inactiveBackgroundColor: Colors.transparent,
        activeForegroundColor: Color(0xffDEE9FF),
        icon: Icon(
          Icons.home,
          size: 21,
          color: Colors.blue,
        ),
        inactiveIcon: Icon(
          Icons.home,
          size: 21,
          color: Colors.grey,
        ),
        title: 'Home',
      ),
    ),
    PersistentTabConfig(
      screen: MainPage(),
      item: ItemConfig(
        inactiveBackgroundColor: Colors.transparent,
        activeForegroundColor: Color(0xffDEE9FF),
        icon: Icon(
          Icons.person,
          size: 21,
          color: Colors.blue,
        ),
        inactiveIcon: Icon(
          Icons.person,
          size: 21,
          color: Colors.grey,
        ),
        title: 'Home',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(
        body: PersistentTabView(
          // backgroundColor: Colors.grey,
          popAllScreensOnTapOfSelectedTab: true,

          popAllScreensOnTapAnyTabs: true,
          controller: _controller,
          onTabChanged: (value) {
            setState(() {});
          },
          navBarHeight: 55,
          // floatingActionButton: dynamicFloatingActions[0],
          tabs: _pages,
          avoidBottomPadding: true,
          popActionScreens: PopActionScreensType.all,
          stateManagement: false,
          navBarBuilder: (navBarConfig) => Style15BottomNavBar(
            navBarDecoration: NavBarDecoration(
              color:   Color(0xFFF0F5FF).withOpacity(0.8),
              
              padding: EdgeInsets.only(bottom: 5, top: 5),
            ),
            navBarConfig: navBarConfig,
          ),
        ),
      )),
    );
  }
}
