import 'dart:convert';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:http/http.dart';

/// La classe Services contient toutes les interactions avec le WebService
/// Necessite une connexion Internet
/// URL à modifier par l'adresse réelle du WebService

var url = 'https://iomer.loca.lt';

@Environment(Env.prod)
@singleton
@injectable
class Services {
  final Client client;

  Services(Client httpClient) : client = httpClient;

  /// Recupérer une liste de [Site] via le WebService
  Future<List<Site>> fetchSites() async {
    final response = await client.get(Uri.parse('$url/GetSites'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Sites.
    if (response.statusCode == 200) {
      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Sites.
      List<Site> sites;
      sites = (json.decode(response.body) as List)
          .map((siteJson) => Site.fromJson(siteJson))
          .toList();
      return sites;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load site');
    }
  }

  /// Récupérer une liste de [Origine] via le WebService en passant en paramètre "idSite"
  Future<List<Origine>> fetchOrigines(int id) async {
    final response = await client.get(Uri.parse('$url/GetOrigines/$id'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Origines.
    if (response.statusCode == 200) {
      List<Origine> origines;
      origines = (json.decode(response.body) as List)
          .map((origineJson) => Origine.fromJson(origineJson))
          .toList();
      return origines;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Origines');
    }
  }

  /// Récupérer une liste de [Matricule] via le WebService en passant en paramètre "idOrigine"
  Future<List<Matricule>> fetchMatricules(int? id) async {
    final response = await client.get(Uri.parse('$url/GetMatricules/$id'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Matricules.
    if (response.statusCode == 200) {
      List<Matricule> matricules;
      matricules = (json.decode(response.body) as List)
          .map((matriculeJson) => Matricule.fromJson(matriculeJson))
          .toList();
      return matricules;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Matricules');
    }
  }

  /// Récupérer une liste d'[Equipement] via le WebService en passant en paramètre "idSite"
  Future<List<Equipement>> fetchEquipements(int id) async {
    final response = await client.get(Uri.parse('$url/GetEquipements/$id'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste d'Equipements'.
    if (response.statusCode == 200) {
      List<Equipement> equipements;
      equipements = (json.decode(response.body) as List)
          .map((equipementJson) => Equipement.fromJson(equipementJson))
          .toList();
      return equipements;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Equipements');
    }
  }

  /// Récupérer une liste de [Categorie] via le WebService en passant en paramètre "idSite"
  Future<List<Categorie>> fetchCategories(int id) async {
    final response = await client.get(Uri.parse('$url/GetCategories/$id'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Categories'.
    if (response.statusCode == 200) {
      List<Categorie> categories;
      categories = (json.decode(response.body) as List)
          .map((categorieJson) => Categorie.fromJson(categorieJson))
          .toList();
      return categories;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Categories');
    }
  }

  /// Récupérer une liste d'[Ot] via le WebService en passant en paramètre "idSite" et "idOrigine"
  Future<List<Ot>> fetchOTs(int idSite, int idOrigine) async {
    final response =
        await client.get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste d'Ots'.
    if (response.statusCode == 200) {
      List<Ot> ots;
      ots = (json.decode(response.body) as List)
          .map((otJson) => Ot.fromJson(otJson))
          .toList();
      return ots;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Config');
    }
  }

  /// Récupérer une liste de [Tache] via le WebService en passant en paramètre "idOT"
  Future<List<Tache>> fetchOTTaches(int idOT) async {
    final response = await client.get(Uri.parse('$url/GETOT_TACHES/$idOT'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Taches'.
    if (response.statusCode == 200) {
      List<Tache> taches;
      taches = (json.decode(response.body) as List)
          .map((tacheJson) => Tache.fromJson(tacheJson))
          .toList();
      return taches;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load OT Taches');
    }
  }

  /// Récupérer une liste de [Config] via le WebService en passant en paramètre "idSite" et "codePocket"
  Future<List<Config>> fetchConfigs(int idSite, String codePocket) async {
    final response =
        await client.get(Uri.parse('$url/GETCONFIG/$idSite/$codePocket'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Configs'
    if (response.statusCode == 200) {
      List<Config> configs;
      configs = (json.decode(response.body) as List)
          .map((configJson) => Config.fromJson(configJson))
          .toList();
      return configs;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Config');
    }
  }

  /// Récupérer une liste d'[Article] via le WebService en passant en paramètre "codeArticles"
  Future<List<Article>> fetchArticles(String codeArticle) async {
    final response =
        await client.get(Uri.parse('$url/GETARTICLE/$codeArticle'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste d'Articles'
    if (response.statusCode == 200) {
      List<Article> articles;
      articles = (json.decode(response.body) as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();
      return articles;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Config');
    }
  }



  /// Récupérer une liste de [Reservation] ( GETOT_ARTICLE) via le WebService en passant en paramètre "idOT"

  Future<List<Reservation>> fetchReservations(int idOt) async {
    final response = await client.get(Uri.parse('$url/GETOT_ARTICLES/$idOt'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Réservations'
    if (response.statusCode == 200) {
      List<Reservation> reservations;
      reservations = (json.decode(response.body) as List)
          .map((reservationJson) => Reservation.fromJson(reservationJson))
          .toList();
      return reservations;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Config');
    }
  }

  /// Envoyer la liste des [Ot] dans le WebService
  Future<void> postOt(
      int idOt, String commentOt, double tempsOt, String statutOt) async {
    String newTempsOt = tempsOt.toString();
    newTempsOt = newTempsOt.replaceAll('.', ',');
    final response = await client
        .get(Uri.parse('$url/SetOt/$idOt/$commentOt/$newTempsOt/$statutOt'));
  }
  /// Envoyer la liste des [Tache] dans le WebService
  Future<void> postOtTache(
      int idTache, String statutTache, String commentTache) async {
    final response = await client
        .get(Uri.parse('$url/SETOT_TACHE/$idTache/$statutTache/$commentTache'));
  }
  /// Envoyer la liste des [Article] dans le WebService
  Future<void> postOtArticle(int idPiece, double qteArticle) async {
    String newQteArticle = qteArticle.toString();
    newQteArticle = newQteArticle.replaceAll('.', ',');
    final response = await client
        .get(Uri.parse('$url/SETOT_ARTICLE/$idPiece/$newQteArticle'));
  }
  /// Envoyer la liste des [Matricule] dans le WebService
  Future<void> postMatricule(int idMatricule, int checked) async {
    final response =
        await client.get(Uri.parse('$url/SETMATRICULE/$idMatricule/$checked'));
  }
  /// Envoyer la liste des [Document] dans le WebService
  Future<void> postAttachment(int idOt, String attachment) async {
    final response =
        await client.get(Uri.parse('$url/SETATTACHMENT/$idOt/$attachment'));
  }
  /// Envoyer la liste des [Article] dans le WebService
  Future<void> createOtArticle(
      int idOt, int idArticle, double qteArticle) async {
    String newQteArticle = qteArticle.toString();
    newQteArticle = newQteArticle.replaceAll('.', ',');
    final response = await client.get(
        Uri.parse('$url/CREATEOT_ARTICLE/$idOt/$idArticle/$newQteArticle'));
  }
  /// Créer une nouvelle [Ot]
  Future<void> createOt(int idEquipement, int idOrigine, int idCategorie,
      String libelleOt) async {
    final response = await client.get(Uri.parse(
        '$url/CREATEOT/$idEquipement/$idOrigine/$idCategorie/$libelleOt'));
  }
}
