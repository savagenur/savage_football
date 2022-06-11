import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:savage_football/apis/head_to_head_api.dart';
import 'package:savage_football/pages/MainPage/MatchesPage/matches_page.dart';
import 'package:savage_football/utils/theme.dart';

import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SavageFB',
          theme: Themes.light,
          home: MainPage(),
        );
      },
    );
  }
}

Future getData()async{

}