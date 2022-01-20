import 'dart:convert';
import 'dart:developer';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:http/http.dart' as http;

var url = 'https://iomer.loca.lt/';

/* Get Sites */
Future<List<Site>> fetchSite() async {
  final response = await http.get(Uri.parse('$url/GetSites'));
  
  if (response.statusCode == 200) {
   log("sites recuperé : ${response.body}");
    List<Site> sites;
    sites=(json.decode(response.body) as List)
        .map((siteJson) => Site.fromJson(siteJson))
        .toList();
    log(" Liste de site : "+ sites.toString());
    return sites;
        } else {
    throw Exception('Failed to load site');
  }
}

/* Get Origines */
Future<List<Origine>> fetchOrigines(int id) async {
  final response = await http
      .get(Uri.parse('$url/GetOrigines/$id'));

  if (response.statusCode == 200) {
    log("origine recuperé : ${response.body}");
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
      .get(Uri.parse('$url/GetMatricules/$id'));

  if (response.statusCode == 200) {
    log("matricules recuperé : ${response.body}");
    List<Matricule> matricules;
    matricules=(json.decode(response.body) as List)
        .map((matriculeJson) => Matricule.fromJson(matriculeJson))
        .toList();
     log(" Liste de matricule : "+ matricules.toString());
    return matricules;
  } else {
    throw Exception('Failed to load Matricules');
  }
}

/* Get Equipements */
Future<List<Equipement>> fetchEquipements(int id) async {
  final response = await http
      .get(Uri.parse('$url/GetEquipements/$id'));

  if (response.statusCode == 200) {
   log("equipements recuperé : ${response.body}");
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
      .get(Uri.parse('$url/GetCategories/$id'));

  if (response.statusCode == 200) {
   log("categorie recuperé : ${response.body}");
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
      .get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));

  if (response.statusCode == 200) {
  log("ots recuperé : ${response.body}");
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
      .get(Uri.parse('$url/GETOT_TACHES/$idOT'));

  if (response.statusCode == 200) {
    log("tache recuperé : ${response.body}");
    List<Tache> taches;
    taches=(json.decode(response.body) as List)
        .map((tacheJson) => Tache.fromJson(tacheJson))
        .toList();
     
    return taches;
  } else {
    throw Exception('Failed to load OT Taches');
  }
}

/* Get Config */
Future<List<ConfigData>> fetchConfig(int idSite, String codePocket) async {
  final response = await http
      .get(Uri.parse('$url/GETCONFIG/$idSite/$codePocket'));

  if (response.statusCode == 200) {
    log("config recuperé : ${response.body}");
    
    List<ConfigData> config;
    config=(json.decode(response.body) as List)
        .map((configJson) => ConfigData.fromJson(configJson))
        .toList();
    
    return config;
  } else {
    throw Exception('Failed to load Config');
  }
}

/*/ Get Article */
Future<List<Article>> fetchArticle( String codeArticle) async {
  final response = await http
  .get(Uri.parse('$url/GETARTICLE/$codeArticle'));

  if (response.statusCode ==200){
    log("article recuperé : ${response.body}");
    
    List<Article> article;
    article=(json.decode(response.body) as List)
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    
    return article;
  } else {
    throw Exception('Failed to load Config');
  }
  
  }

  /* get Reservation (GETOT_ARTICLE)*/

Future<List<Reservation>>fetchReservations(int idOt) async{
  final response = await http
  .get(Uri.parse('$url/GETOT_ARTICLE/$idOt'));

  if (response.statusCode ==200){
    log("reservation recuperé : ${response.body}");
    
    List<Reservation> reservation;
    reservation=(json.decode(response.body) as List)
        .map((reservationJson) => Reservation.fromJson(reservationJson))
        .toList();
    
    return reservation;
  } else {
    throw Exception('Failed to load Config');
  }
 
}


