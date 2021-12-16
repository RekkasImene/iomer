import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:iomer/webService/origines.dart';

var url = 'https://silent-fireant-91.loca.lt';

Future<Origines> fetchOrigines(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetOrigines/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body.toString());
    return Origines.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Origines');
  }
}