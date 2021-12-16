import 'dart:convert';
import 'dart:developer';

import 'package:iomer/webService/site.dart';
import 'package:http/http.dart' as http;

var url = 'https://silent-fireant-91.loca.lt/datasnap/rest/TServerMethodsIOmere/GetSites';

Future<Site> fetchSite() async {
  final response = await http.get(Uri.parse(url));

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