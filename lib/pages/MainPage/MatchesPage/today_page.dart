import 'package:flutter/material.dart';
import 'package:savage_football/utils/theme.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  bool isMatch = true;
  List isMatches = [true];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LeagueTile(isMatches: isMatches),
        ],
      ),
    );
  }
}

class LeagueTile extends StatefulWidget {
  const LeagueTile({
    Key? key,
    required this.isMatches,
  }) : super(key: key);

  final List isMatches;

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
                            radius: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'UEFA Nations League A',
                            style: subHeadingStyle,
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                body: Column(
                  children: [
                    Divider(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                    MatchWidget(),
                  ],
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
  const MatchWidget({
    Key? key,
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
                        'Portugal',
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
                  radius: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2 - 0',
                  style: subHeadingStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
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
                      'Czech Republic',
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
