import 'dart:convert';
import 'dart:developer';

import 'package:iomer/webService/site.dart';
import 'package:http/http.dart' as http;

var url = 'https://40f4-193-52-159-57.ngrok.io';

Future<Site> fetchSite() async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetSites'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body.toString());
    return Site.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load site');
  }
}