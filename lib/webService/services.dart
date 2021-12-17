import 'dart:convert';
import 'dart:developer';
import 'package:iomer/webService/ot_taches.dart';
import 'package:iomer/webService/ots.dart';
import 'package:iomer/webService/sites.dart';
import 'package:http/http.dart' as http;
import 'categories.dart';
import 'equipements.dart';
import 'matricules.dart';
import 'origines.dart';

var url = 'https://red-donkey-69.loca.lt';

/* Get Sites */
Future<Sites> fetchSite() async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetSites'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return Sites.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load site');
  }
}

/* Get Origines */
Future<Origines> fetchOrigines(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetOrigines/$id'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return Origines.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Origines');
  }
}

/* Get Matricules */
Future<Matricules> fetchMatricules(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetMatricules/$id'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return Matricules.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Matricules');
  }
}

/* Get Equipements */
Future<Equipements> fetchEquipements(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetEquipements/$id'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return Equipements.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Equipements');
  }
}

/* Get Categories */
Future<Categories> fetchCategories(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetCategories/$id'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return Categories.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

/* Get OTs */
Future<OTs> fetchOTs(int idSite, int idOrigine) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetOts/$idSite/$idOrigine'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return OTs.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load OTs');
  }
}

/* Get OT Taches */
Future<OTTaches> fetchOTTaches(int idOT) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GETOT_TACHES/$idOT'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return OTTaches.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load OT Taches');
  }
}