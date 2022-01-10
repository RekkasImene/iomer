import 'dart:convert';
import 'dart:developer';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:http/http.dart' as http;

var url = 'https://dangerous-eagle-94.loca.lt';

/* Get Sites */
Future<List<Site>> fetchSite() async {
  final response = await http.get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetSites'));
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
Future<List<Origine>> fetchOrigines(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetOrigines/$id'));

  if (response.statusCode == 200) {
    List<Origine> origines;
    origines=(json.decode(response.body) as List)
        .map((origineJson) => Origine.fromJson(origineJson))
        .toList();
    return origines;
  } else {
    throw Exception('Failed to load Origines');
  }
}

/* Get Matricules */
Future<List<Matricule>> fetchMatricules(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetMatricules/$id'));

  if (response.statusCode == 200) {
    List<Matricule> matricules;
    matricules=(json.decode(response.body) as List)
        .map((matriculeJson) => Matricule.fromJson(matriculeJson))
        .toList();
    return matricules;
  } else {
    throw Exception('Failed to load Matricules');
  }
}

/* Get Equipements */
Future<List<Equipement>> fetchEquipements(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetEquipements/$id'));

  if (response.statusCode == 200) {
    List<Equipement> equipements;
    equipements=(json.decode(response.body) as List)
        .map((equipementJson) => Equipement.fromJson(equipementJson))
        .toList();
    return equipements;
  } else {
    throw Exception('Failed to load Equipements');
  }
}

/* Get Categories */
Future<List<Categorie>> fetchCategories(int id) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetCategories/$id'));

  if (response.statusCode == 200) {
    List<Categorie> categories;
    categories=(json.decode(response.body) as List)
        .map((categorieJson) => Categorie.fromJson(categorieJson))
        .toList();
    return categories;
  } else {
    throw Exception('Failed to load Categories');
  }
}

/* Get OTs */
Future<List<OtData>> fetchOTs(int idSite, int idOrigine) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GetOts/$idSite/$idOrigine'));

  if (response.statusCode == 200) {
    List<OtData> ots;
    ots=(json.decode(response.body) as List)
        .map((otJson) => OtData.fromJson(otJson))
        .toList();
    return ots;
  } else {
    throw Exception('Failed to load OTs');
  }
}

/* Get OT Taches */
Future<List<Tache>> fetchOTTaches(int idOT) async {
  final response = await http
      .get(Uri.parse('$url/datasnap/rest/TServerMethodsIOmere/GETOT_TACHES/$idOT'));

  if (response.statusCode == 200) {
    List<Tache> taches;
    taches=(json.decode(response.body) as List)
        .map((tacheJson) => Tache.fromJson(tacheJson))
        .toList();
    return taches;
  } else {
    throw Exception('Failed to load OT Taches');
  }
}