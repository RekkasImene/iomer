import 'dart:convert';
import 'dart:developer';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/ot_taches.dart';
import 'package:iomer/webService/ots.dart';
import 'package:http/http.dart' as http;
import 'categories.dart';
import 'equipements.dart';
import 'matricules.dart';
import 'origines.dart';

var url = 'https://hungry-rattlesnake-85.loca.lt';

/* Get Sites */
Future<List<Site>> fetchSite() async {
  final response = await http.get(Uri.parse('$url/GetSites'));
  if (response.statusCode == 200) {
    List<Site> sites;
    sites=(json.decode(response.body) as List)
        .map((siteJson) => Site.fromJson(siteJson))
        .toList();
    return sites;
        } else {
    throw Exception('Failed to load site');
  }
}

/* Get Origines */
Future<Origines> fetchOrigines(int id) async {
  final response = await http
      .get(Uri.parse('$url/GetOrigines/$id'));

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
      .get(Uri.parse('$url/GetMatricules/$id'));

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
      .get(Uri.parse('$url/GetEquipements/$id'));

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
      .get(Uri.parse('$url/GetCategories/$id'));

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
      .get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));

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
      .get(Uri.parse('$url/GETOT_TACHES/$idOT'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    return OTTaches.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load OT Taches');
  }
}