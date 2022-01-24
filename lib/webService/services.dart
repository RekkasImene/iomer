import 'dart:convert';
import 'dart:developer';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:http/http.dart' as http;

var url = 'https://iomere.loca.lt/';

/* Get Sites */
Future<List<Site>> fetchSites() async {
  final response = await http.get(Uri.parse('$url/GetSites'));
  if (response.statusCode == 200) {
    List<Site> sites;
    sites = (json.decode(response.body) as List)
        .map((siteJson) => Site.fromJson(siteJson))
        .toList();
    return sites;
  } else {
    throw Exception('Failed to load site');
  }
}

/* Get Origines */
Future<List<Origine>> fetchOrigines(int id) async {
  final response = await http.get(Uri.parse('$url/GetOrigines/$id'));
  log(response.body.toString());
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
  log(response.body.toString());
  if (response.statusCode == 200) {
    List<Matricule> matricules;
    matricules = (json.decode(response.body) as List)
        .map((matriculeJson) => Matricule.fromJson(matriculeJson))
        .toList();
    log(matricules.toString());
    return matricules;
  } else {
    log('Failed to load Matricules'+response.statusCode.toString());
    throw Exception('Failed to load Matricules');
  }
}

/* Get Equipements */
Future<List<Equipement>> fetchEquipements(int id) async {
  final response = await http.get(Uri.parse('$url/GetEquipements/$id'));
  log(response.body.toString());
  if (response.statusCode == 200) {
    List<Equipement> equipements;
    equipements = (json.decode(response.body) as List)
        .map((equipementJson) => Equipement.fromJson(equipementJson))
        .toList();
    log(equipements.toString());
    return equipements;
  } else {
    log('Failed to load Equipements'+response.statusCode.toString());
    throw Exception('Failed to load Equipements');
  }
}

/* Get Categories */
Future<List<Categorie>> fetchCategories(int id) async {
  final response = await http.get(Uri.parse('$url/GetCategories/$id'));
  log(response.body.toString());
  if (response.statusCode == 200) {
    List<Categorie> categories;
    categories = (json.decode(response.body) as List)
        .map((categorieJson) => Categorie.fromJson(categorieJson))
        .toList();
    log(categories.toString());
    return categories;
  } else {
    log('Failed to load categories'+response.statusCode.toString());
    throw Exception('Failed to load Categories');
  }
}

/* Get OTs */
Future<List<OtData>> fetchOTs(int idSite, int idOrigine) async {
  final response = await http.get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));
  log(response.body.toString());
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
  log(response.body.toString());
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
Future<List<ConfigData>> fetchConfigs(int idSite, String codePocket) async {
  final response = await http.get(Uri.parse('$url/GETCONFIG/$idSite/$codePocket'));

  if (response.statusCode == 200) {
    log(response.body.toString());
    List<ConfigData> configs;
    configs = (json.decode(response.body) as List)
        .map((configJson) => ConfigData.fromJson(configJson))
        .toList();
    log(configs.toString());
    return configs;
  } else {
    log('Failed to load Config'+response.statusCode.toString());
    throw Exception('Failed to load Config');
  }
}

Future<List<Article>> fetchArticles(String codeArticle) async {
  final response = await http.get(Uri.parse('$url/GETARTICLE/$codeArticle'));
  log(response.body.toString());
  if (response.statusCode == 200) {
    List<Article> articles;
    articles = (json.decode(response.body) as List)
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    return articles;
  } else {
    throw Exception('Failed to load Config');
  }
}

/* get Reservation (GETOT_ARTICLE)*/

Future<List<Reservation>> fetchReservations(int idOt) async {
  final response = await http.get(Uri.parse('$url/GETOT_ARTICLES/$idOt'));
  if (response.statusCode == 200) {
    List<Reservation> reservations;
    reservations = (json.decode(response.body) as List)
        .map((reservationJson) => Reservation.fromJson(reservationJson))
        .toList();
    return reservations;
  } else {
    throw Exception('Failed to load Config');
  }

}

Future<void> postOt(int idOt, String commentOt, double tempsOt, String statutOt) async {
  String newTempsOt = tempsOt.toString();
  newTempsOt = newTempsOt.replaceAll('.', ',');

  final response = await http
      .get(Uri.parse('$url/SetOt/$idOt/$commentOt/$newTempsOt/$statutOt'));
}

Future<void> postOtTache(int idTache, String statutTache, String commentTache) async {
  final response = await http
      .get(Uri.parse('$url/SETOT_TACHE/$idTache/$statutTache/$commentTache'));
}

Future<void> postOtArticle(int idPiece, double qteArticle) async {
  String newQteArticle = qteArticle.toString();
  newQteArticle = newQteArticle.replaceAll('.', ',');

  final response =
      await http.get(Uri.parse('$url/SETOT_ARTICLE/$idPiece/$newQteArticle'));
}

Future<void> postMatricule(int idMatricule, int checked) async {
  final response =
      await http.get(Uri.parse('$url/SETMATRICULE/$idMatricule/$checked'));
}

Future<void> postAttachment(int idOt, String attachment) async {
  final response =
      await http.get(Uri.parse('$url/SETATTACHMENT/$idOt/$attachment'));
}

Future<void> createOtArticle(int idOt, int idArticle, double qteArticle) async {
  String newQteArticle = qteArticle.toString();
  newQteArticle = newQteArticle.replaceAll('.', ',');

  final response = await http
      .get(Uri.parse('$url/CREATEOT_ARTICLE/$idOt/$idArticle/$newQteArticle'));
}

Future<void> createOt(int idEquipement, int idOrigine, int idCategorie, String libelleOt) async {
  final response = await http.get(Uri.parse(
      '$url/CREATEOT/$idEquipement/$idOrigine/$idCategorie/$libelleOt'));
}
