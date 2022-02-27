import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:http/http.dart';

/// La classe Services contient toutes les interactions avec le WebService
/// Necessite une connexion Internet
/// URL à modifier par l'adresse réelle du WebService

//var url = 'https://iomere.loca.lt';
//var url = 'http://10.0.2.2:8080'; //Adresse locale android
var url = 'http://localhost:8080';

@Environment(Env.prod)
@singleton
@injectable
class Services {
  final Client client;

  Services(Client httpClient) : client = httpClient;

  /// Recupérer une liste de [Site] via le WebService
  Future<List<Site>> fetchSites() async {
    try {
      final response = await client.get(Uri.parse('$url/GetSites'));
      log("la réponse est " + response.toString());

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Sites.

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Sites.
      List<Site> sites;
      sites = (json.decode(response.body) as List)
          .map((siteJson) => Site.fromJson(siteJson))
          .toList();
      return sites;
    } catch (error) {
      throw Exception('Failed to load site');
    }
  }

  /// Récupérer une liste de [Origine] via le WebService en passant en paramètre "idSite"
  Future<List<Origine>> fetchOrigines(int id) async {
    try {
      final response = await client.get(Uri.parse('$url/GetOrigines/$id'));

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Origines.

      List<Origine> origines;
      origines = (json.decode(response.body) as List)
          .map((origineJson) => Origine.fromJson(origineJson))
          .toList();
      return origines;
    } catch (error) {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Origines');
    }
  }

  /// Récupérer une liste de [Matricule] via le WebService en passant en paramètre "idOrigine"
  Future<List<Matricule>> fetchMatricules(int? id) async {
    try {
      final response = await client.get(Uri.parse('$url/GetMatricules/$id'));

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Matricules.

      List<Matricule> matricules;
      matricules = (json.decode(response.body) as List)
          .map((matriculeJson) => Matricule.fromJson(matriculeJson))
          .toList();
      return matricules;
    } catch (error) {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Matricules');
    }
  }

  /// Récupérer une liste d'[Equipement] via le WebService en passant en paramètre "idSite"
  Future<List<Equipement>> fetchEquipements(int id) async {
    try {
      final response = await client.get(Uri.parse('$url/GetEquipements/$id'));

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste d'Equipements'.

      List<Equipement> equipements;
      equipements = (json.decode(response.body) as List)
          .map((equipementJson) => Equipement.fromJson(equipementJson))
          .toList();
      return equipements;
    } catch (error) {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Equipements');
    }
  }

  /// Récupérer une liste de [Categorie] via le WebService en passant en paramètre "idSite"
  Future<List<Categorie>> fetchCategories(int id) async {
    try {
      final response = await client.get(Uri.parse('$url/GetCategories/$id'));

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste de Categories'.

      List<Categorie> categories;
      categories = (json.decode(response.body) as List)
          .map((categorieJson) => Categorie.fromJson(categorieJson))
          .toList();
      return categories;
    } catch (error) {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Categories');
    }
  }

  /// Récupérer une liste d'[Ot] via le WebService en passant en paramètre "idSite" et "idOrigine"
  Future<List<Ot>> fetchOTs(int idSite, int idOrigine) async {
    List<Ot> ots = [];
    try {
      final response =
          await client.get(Uri.parse('$url/GetOts/$idSite/$idOrigine'));

      ///Si le serveur renvoie une réponse 200 OK,
      /// puis convertir la réponse JSON en une Liste d'Ots'.

      ots = (json.decode(response.body) as List)
          .map((otJson) => Ot.fromJson(otJson))
          .toList();
    } catch (_) {
      throw Exception('Failed to load Config');
    }
    return ots;

    ///Si le serveur ne renvoie pas une réponse 200 OK,
    /// Alors une exception est levée.
  }

  /// Récupérer une liste de [Tache] via le WebService en passant en paramètre "idOT"
  Future<List<Tache>> fetchOTTaches(int idOT) async {
    final response = await client.get(Uri.parse('$url/GETOT_TACHES/$idOT$url/GETOT_TACHES/$idOT'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Taches'.
    if (response.statusCode == 200) {
      List<Tache> taches;
      try {
        taches = (json.decode(response.body) as List)
            .map((tacheJson) => Tache.fromJson(tacheJson))
            .toList();
      } catch (error) {
        throw const FormatException('Failed to load OT Taches');
      }

      return taches;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load OT Taches');
    }
  }

  /// Récupérer une liste de [Config] via le WebService en passant en paramètre "idSite" et "codePocket"
  Future<List<Config>> fetchConfigs(int idSite, String codePocket) async {
    List<Config> configs;

    try {
      final response =
          await client.get(Uri.parse('$url/GETCONFIG/$idSite/$codePocket'));
      configs = (json.decode(response.body) as List)
          .map((configJson) => Config.fromJson(configJson))
          .toList();
    } catch (error) {
      throw Exception('Failed to load Config');
    }

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Configs'

    return configs;
  }

  /// Récupérer une liste d'[Article] via le WebService en passant en paramètre "codeArticles"
  Future<List<Article>> fetchArticles(String codeArticle) async {
    final response =
        await client.get(Uri.parse('$url/GETARTICLE/$codeArticle'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste d'Articles'
    if (response.statusCode == 200) {
      List<Article> articles;
      try {
        articles = (json.decode(response.body) as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
      } catch (error) {
        throw const FormatException('Failed to load Article');
      }
      return articles;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Article');
    }
  }

  /// Récupérer une liste de [Reservation] ( GETOT_ARTICLE) via le WebService en passant en paramètre "idOT"

  Future<List<Reservation>> fetchReservations(int idOt) async {
    final response = await client.get(Uri.parse('$url/GETOT_ARTICLES/$idOt'));

    ///Si le serveur renvoie une réponse 200 OK,
    /// puis convertir la réponse JSON en une Liste de Réservations'
    if (response.statusCode == 200) {
      List<Reservation> reservations;
      try {
        reservations = (json.decode(response.body) as List)
            .map((reservationJson) => Reservation.fromJson(reservationJson))
            .toList();
      } catch (error) {
        throw const FormatException('Failed to load Reservation');
      }
      return reservations;
    } else {
      ///Si le serveur ne renvoie pas une réponse 200 OK,
      /// Alors une exception est levée.
      throw Exception('Failed to load Reservation');
    }

    ///Si le serveur ne renvoie pas une réponse 200 OK,
    /// Alors une exception est levée.
  }

  /// Synchroniser [Ot] avec le WebService
  Future<void> postOt(
      int idOt, String commentOt, double tempsOt, String statutOt) async {
    try {
      String newTempsOt = tempsOt.toString();
      newTempsOt = newTempsOt.replaceAll('.', ',');
      final response = await client
          .get(Uri.parse('$url/SetOt/$idOt/$commentOt/$newTempsOt/$statutOt'));
      List<Ot> ots = (json.decode(response.body) as List)
          .map((otJson) => Ot.fromJson(otJson))
          .toList();
      log("OTS push :"+ots.toString());
    } catch (e) {
      rethrow;
      //throw Exception('error or exception in postOt: ' + e.toString());
    }
  }
  /// Synchroniser [Tache] comprenant un idTache, statutTache, commentTache avec le WebService
  Future<void> postOtTache(
      int idTache, String statutTache, String commentTache) async {
    try {
      final response = await client.get(
          Uri.parse('$url/SETOT_TACHE/$idTache/$statutTache/$commentTache'));
        log(response.body);
      List<Tache> taches = (json.decode(response.body) as List)
          .map((tacheJson) => Tache.fromJson(tacheJson))
          .toList();
      log("Tache push :"+taches.toString());
    } catch (e) {
      throw Exception('error or exception in postOtTache: ' + e.toString());
    }
  }
  /// Synchroniser une [Reservation] comprenant un idPiece et une qteArticle avec le WebService
  Future<void> postOtArticle(int idPiece, double qteArticle) async {
    try {
      String newQteArticle = qteArticle.toString();
      newQteArticle = newQteArticle.replaceAll('.', ',');
      final response = await client
          .get(Uri.parse('$url/SETOT_ARTICLE/$idPiece/$newQteArticle'));
      List<Reservation> reservations = (json.decode(response.body) as List)
          .map((reservationJson) => Reservation.fromJson(reservationJson))
          .toList();
    } catch (e) {
      throw Exception('error or exception in postOtArticle: ' + e.toString());
    }
  }
  /// Synchroniser [Matricule] comprenant un idMatricule et checked avec le WebService
  Future<void> postMatricule(int idMatricule, int checked) async {
    try {
      final response = await client.get(Uri.parse('$url/SETMATRICULE/$idMatricule/$checked'));
      log("response matricule"+ response.body.toString());

      List<Matricule> matricules = (json.decode(response.body) as List)
          .map((matriculeJson) => Matricule.fromJson(matriculeJson))
          .toList();
    } catch (e) {
      log("Je suis avant : Exception");
      //throw Exception('error or exception in postMatricule: ' + e.toString());
      rethrow;
    }
  }
  /// Synchroniser [Document] comprenant un idOt et attachement avec le WebService
  Future<void> postAttachment(int idOt, String attachment) async {
    try {
      final response =
          await client.get(Uri.parse('$url/SETATTACHMENT/$idOt/$attachment'));
    } catch (e) {
      throw Exception('error or exception in postAttachement: ' + e.toString());
    }
  }
  /// Créer un nouvel [Article] et l'envoyer dans le WebService
  Future<void> createOtArticle(
      int idOt, int idArticle, double qteArticle) async {
    try {
      String newQteArticle = qteArticle.toString();
      newQteArticle = newQteArticle.replaceAll('.', ',');
      final response = await client.get(
          Uri.parse('$url/CREATEOT_ARTICLE/$idOt/$idArticle/$newQteArticle'));
      List<Reservation> reservations = (json.decode(response.body) as List)
          .map((reservationJson) => Reservation.fromJson(reservationJson))
          .toList();
    } catch (e) {
      throw Exception('error or exception in create otArticle: ' + e.toString());
    }
  }
  /// Créer une nouvelle [Ot] et l'envoyer dans le WebService
  Future<void> createOt(int idEquipement, int idOrigine, int idCategorie,
      String libelleOt) async {
    try {
      final response = await client.get(Uri.parse(
          '$url/CREATEOT/$idEquipement/$idOrigine/$idCategorie/$libelleOt'));
      List<Ot> ots = (json.decode(response.body) as List)
          .map((otJson) => Ot.fromJson(otJson))
          .toList();
    } catch (e) {
      throw Exception('error or exception in createOt: ' + e.toString());
    }
  }
}
