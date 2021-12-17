import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'matricules.dart';


var url = 'https://328c-46-193-65-137.ngrok.io';

Future<Matricules> fetchMatricules(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetMatricules/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body.toString());
    return Matricules.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Matricules');
  }
}