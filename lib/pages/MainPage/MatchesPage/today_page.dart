import 'package:flutter/material.dart';
import 'package:savage_football/models/head_to_head_model.dart';
import 'package:savage_football/utils/theme.dart';

class TodayPage extends StatefulWidget {
  final Map<String, List<Response>> leagueMap;
  const TodayPage({
    Key? key,
    required this.leagueMap,
  }) : super(key: key);

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  List isMatches = [false];
  List<String> keys = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.leagueMap.length; i++) {
      isMatches.add(false);
    }
    widget.leagueMap.forEach(
      (key, value) {
        keys.add(key);
      },
    );
    return SingleChildScrollView(
      child: Column(
        children: List.generate(widget.leagueMap.length, (index) {
          return LeagueTile(
            leagueLogo: widget.leagueMap[keys[index]]![0].league!.logo!,
            leagueName: keys[index],
            isMatches: isMatches,
            leagueList: widget.leagueMap[keys[index]],
          );
        }),
      ),
    );
  }
}

// !
// !
// !
class LeagueTile extends StatefulWidget {
  final List<dynamic>? leagueList;
  final List isMatches;
  final String leagueName;
  final String leagueLogo;
  const LeagueTile({
    Key? key,
    required this.isMatches,
    required this.leagueList,
    required this.leagueName, required this.leagueLogo,
  }) : super(key: key);

  @override
  State<LeagueTile> createState() => _LeagueTileState();
}

class _LeagueTileState extends State<LeagueTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whiteClr,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 0.5, offset: Offset(0, 1))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 800),
          elevation: 0,
          children: [
            ExpansionPanel(
                headerBuilder: ((context, isExpanded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 15,
                            child: Image.network(widget.leagueLogo),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.leagueName,
                            style: subHeadingStyle,
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                body: Column(
                  children: List.generate(widget.leagueList!.length, (index) {
                    return index == 0
                        ? Column(
                            children: [
                              Divider(),
                              MatchWidget(
                                data: widget.leagueList![index],
                              )
                            ],
                          )
                        : MatchWidget(
                            data: widget.leagueList![index],
                          );
                  }),
                ),
                isExpanded: widget.isMatches[0])
          ],
          expansionCallback: (i, isOpen) => setState(() {
            widget.isMatches[i] = !isOpen;
          }),
        ),
      ),
    );
  }
}

class MatchWidget extends StatelessWidget {
  final Response data;
  const MatchWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      width: 110,
                      child: Text(
                        data.teams!.home!.name!,
                        overflow: TextOverflow.visible,
                      )),
                  SizedBox(
                    width: 5,
                  )
                ],
              )),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.network(data.teams!.home!.logo!),
                  radius: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${data.goals!.home ?? "#"} - ${data.goals!.away ?? "#"}',
                  style: subHeadingStyle,
                ),
                SizedBox(
                  width: 10,
                ),
               CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.network(data.teams!.away!.logo!),
                  radius: 15,
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 110,
                    child: Text(
                      data.teams!.away!.name!,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
