import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:http/http.dart' as http;

var url = 'https://iomer.loca.lt';

/* Get Sites */
Future<List<Site>> fetchSite() async {
  final response = await http.get(Uri.parse('$url/GetSites'));
  if (response.statusCode == 200) {
    log("111111111111" + response.body);
    List<Site> sites;
    sites = (json.decode(response.body) as List)
        .map((siteJson) => Site.fromJson(siteJson))
        .toList();
    log("2222222222" + sites.toString());
    return sites;
  } else {
    throw Exception('Failed to load site');
  }
}

/* Get Origines */
Future<List<Origine>> fetchOrigines(int id) async {
  final response = await http.get(Uri.parse('$url/GetOrigines/$id'));

  if (response.statusCode == 200) {
    List<Origine> origines;
    origines = (json.decode(response.body) as List)
        .map((origineJson) => Origine.fromJson(origineJson))
        .toList();
    return origines;
  } else {
    throw Exception('Failed to load Origines');
  }
}

/* Get Matricules */
Future<List<Matricule>> fetchMatricules(int id) async {
  final response = await http.get(Uri.parse('$url/GetMatricules/$id'));

  if (response.statusCode == 200) {
    List<Matricule> matricules;
    matricules = (json.decode(response.body) as List)
        .map((matriculeJson) => Matricule.fromJson(matriculeJson))
        .toList();
    return matricules;
  } else {
    throw Exception('Failed to load Matricules');
  }
}

/* Get Equipements */
Future<List<Equipement>> fetchEquipements(int id) async {
  final response = await http.get(Uri.parse('$url/GetEquipements/$id'));

  if (response.statusCode == 200) {
    List<Equipement> equipements;
    equipements = (json.decode(response.body) as List)
        .map((equipementJson) => Equipement.fromJson(equipementJson))
        .toList();
    return equipements;
  } else {
    throw Exception('Failed to load Equipements');
  }
}

/* Get Categories */
Future<List<Categorie>> fetchCategories(int? id) async {
  final response = await http.get(Uri.parse('$url/GetCategories/$id'));

  if (response.statusCode == 200) {
    log("3333333" + response.body.toString());
    List<Categorie> categories;
    categories = (json.decode(response.body) as List)
        .map((categorieJson) => Categorie.fromJson(categorieJson))
        .toList();
    log("444444444" + categories.toString());
    return categories;
  } else {
    throw Exception('Failed to load Categories');
  }
}

/* Get OTs */
Future<List<OtData>> fetchOTs(int idSite, int idOrigine) async {
  final response = await http.get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));

  if (response.statusCode == 200) {
    List<OtData> ots;
    ots = (json.decode(response.body) as List)
        .map((otJson) => OtData.fromJson(otJson))
        .toList();
    return ots;
  } else {
    throw Exception('Failed to load OTs');
  }
}

/* Get OT Taches */
Future<List<Tache>> fetchOTTaches(int idOT) async {
  final response = await http.get(Uri.parse('$url/GETOT_TACHES/$idOT'));

  if (response.statusCode == 200) {
    List<Tache> taches;
    taches = (json.decode(response.body) as List)
        .map((tacheJson) => Tache.fromJson(tacheJson))
        .toList();
    return taches;
  } else {
    throw Exception('Failed to load OT Taches');
  }
}

/* Get Config */
Future<List<ConfigData>> fetchConfig(int idSite, String codePocket) async {
  final response =
      await http.get(Uri.parse('$url/GETCONFIG/$idSite/$codePocket'));

  if (response.statusCode == 200) {
    List<ConfigData> config;
    config = (json.decode(response.body) as List)
        .map((configJson) => ConfigData.fromJson(configJson))
        .toList();
    return config;
  } else {
    throw Exception('Failed to load Config');
  }
}

Future<void> postOt(
    int idOt, String commentOt, double tempsOt, String statutOt) async {
  String newtempsOt = tempsOt.toString();
  newtempsOt = newtempsOt.replaceAll('.', ',');
  print('$url/SetOt/$idOt/$commentOt/$newtempsOt/$statutOt');

  final response = await http
      .get(Uri.parse('$url/SetOt/$idOt/$commentOt/$tempsOt/$statutOt'));
}

Future<void> postOtTache(
    int idTache, String statutTache, String commentTache) async {
  print('$url/SETOT_TACHE/$idTache/$statutTache/$commentTache');

  final response = await http
      .get(Uri.parse('$url/SETOT_TACHE/$idTache/$statutTache/$commentTache'));
}

Future<void> postOtArticle(int idPiece, double qteArticle) async {

  String newQteArticle = qteArticle.toString();
  newQteArticle = newQteArticle.replaceAll('.', ',');

  print('$url/SETOT_ARTICLE/$idPiece/$newQteArticle');
  final response =
      await http.get(Uri.parse('$url/SETOT_ARTICLE/$idPiece/$newQteArticle'));
}

Future<void> postMatricule(int idMatricule, int checked) async {
  print('$url/SETMATRICULE/$idMatricule/$checked');

  final response =
  await http.get(Uri.parse('$url/SETMATRICULE/$idMatricule/$checked'));
}

Future<void> postAttachment(int idOt, String attachment) async {
  print('$url/SETATTACHMENT/$idOt/$attachment');

  final response =
  await http.get(Uri.parse('$url/SETATTACHMENT/$idOt/$attachment'));
}

Future<void> createOtArticle(int idOt,int idArticle,double qteArticle) async {
  String newQteArticle = qteArticle.toString();
  newQteArticle = newQteArticle.replaceAll('.', ',');
  print('$url/CREATEOT_ARTICLE/$idOt/$idArticle/$newQteArticle');

  final response =
  await http.get(Uri.parse('$url/CREATEOT_ARTICLE/$idOt/$idArticle/$newQteArticle'));
}

Future<void> createOt(int idEquipement,int idOrigine, int idCategorie, String libelleOt) async {
  print('$url/CREATEOT/$idEquipement/$idOrigine/$idCategorie/$libelleOt');
  final response =
  await http.get(Uri.parse('$url/CREATEOT/$idEquipement/$idOrigine/$idCategorie/$libelleOt'));
}





