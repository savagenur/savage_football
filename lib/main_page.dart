import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:savage_football/pages/MainPage/following_page.dart';
import 'package:savage_football/pages/MainPage/leagues_page.dart';
import 'package:savage_football/pages/MainPage/MatchesPage/matches_page.dart';
import 'package:savage_football/pages/MainPage/more_page.dart';
import 'package:savage_football/pages/MainPage/news_page.dart';
import 'package:savage_football/utils/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [
     MatchesPage(),
    const NewsPage(),
    const LeaguesPage(),
    const FollowingPage(),
    const MorePage(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer_outlined),
      label: 'Matches',
      activeIcon: Icon(Icons.sports_soccer)
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper_outlined),
      activeIcon: Icon(Icons.newspaper),
      label: 'News',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svgs/trophy.svg',
        color: greyClr,
        width: 23,
      ),
      activeIcon: SvgPicture.asset(
        'assets/svgs/trophy.svg',
        color: greenClr,
        width: 23,
      ),
      label: 'Leagues',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star_border_outlined),
      label: 'Following',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'More',
    ),
  ];
  int currentIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() {
                currentIndex = value;
              }),
          currentIndex: currentIndex,
          items: items),
    );
  }
}
