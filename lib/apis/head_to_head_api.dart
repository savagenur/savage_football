import 'dart:convert';

import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:savage_football/models/head_to_head_model.dart';

class HTHApi {
  String season = DateFormat.y().format(DateTime.now());
  String date = DateFormat('y-MM-d').format(DateTime.now());
  Future getData() async {
    String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    final String baseUrl =
        "https://v3.football.api-sports.io/fixtures/?timezone=$timeZone&date=$date&season=$season";

    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      'X-RapidAPI-Key': '7a1ce1b30069d3578151921a489ae95f',
      'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      HTHModel hthModel = HTHModel.fromJson(body);
      print('Got data!');
      return hthModel;
    } else {
      print('Error!');
    }
  }
}
