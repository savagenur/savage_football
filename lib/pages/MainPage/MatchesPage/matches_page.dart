import 'package:flutter/gestures.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:savage_football/apis/head_to_head_api.dart';
import 'package:savage_football/main.dart';
import 'package:savage_football/models/head_to_head_model.dart';
import 'package:savage_football/pages/MainPage/MatchesPage/today_page.dart';
import 'package:savage_football/pages/MainPage/MatchesPage/tomorrow_page.dart';
import 'package:savage_football/pages/MainPage/MatchesPage/yerterday_page.dart';
import 'package:savage_football/utils/theme.dart';

class MatchesPage extends StatefulWidget {
  final HTHModel data;
  const MatchesPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with SingleTickerProviderStateMixin {
  Map<String, List<Response>> sortedByLeague = {};

  int currentIndex = 1;

  List<Widget> tabs = [
    Tab(
      text: 'Yesterday',
    ),
    Tab(
      text: 'Today',
    ),
    Tab(
      text: 'Tomorrow',
    ),
  ];
  late TabController tabController;

  @override
  void initState() {
    createList(widget.data);
    addList(widget.data);
    print(sortedByLeague);
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      YesterdayPage(),
      TodayPage(
        leagueMap: sortedByLeague,
      ),
      TomorrowPage(),
    ];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [_appBar()];
            }),
            body: TabBarView(controller: tabController, children: pages)),
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
        elevation: 1,
        expandedHeight: 100,
        pinned: true,
        floating: true,
        title: Text(
          "SavageFB",
          style: TextStyle(letterSpacing: 0.8),
        ),
        actions: [
          SizedBox(
            width: 30,
          ),
          Icon(Icons.access_time_sharp),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.calendar_today),
          SizedBox(
            width: 30,
          ),
          GestureDetector(onTap: () async {}, child: Icon(Icons.search)),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.more_vert_outlined),
          SizedBox(
            width: 10,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
              onTap: (value) => setState(() {
                    currentIndex = value;
                  }),
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              indicatorColor: greenClr,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.zero,
              automaticIndicatorColorAdjustment: false,
              controller: tabController,
              tabs: tabs),
        ));
  }

  void createList(HTHModel data) {
    for (var i = 0; i < data.response!.length; i++) {
        if (!sortedByLeague.containsKey(data.response![i].league!.name!)) {
          sortedByLeague.addAll({data.response![i].league!.name!: []});
        } else {}
      }
  }

  void addList(HTHModel data) {
    for (var i = 0; i < data.response!.length; i++) {
        sortedByLeague[data.response![i].league!.name!]?.add(data.response![i]);
      }
  }
}
