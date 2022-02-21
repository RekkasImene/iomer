import 'package:http/http.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'services_test.mocks.dart';

var url ="https://iomer.loca.lt";

/// Ce Fichier comporte les tests unitaires qui traitent les appels du web Service.
///  Les requetes sont simulées avec Mockito.
///  build_runner générera un fichier avec un nom basé sur le fichier contenant l'annotation @GenerateMocks.
///  Dans notre cas, nous importons la bibliothèque générée sous services_test.mocks.dart.
/// Génerer un MockClient en utilisant le package Mockito.
/// Créer de nouvelles instances de cette classe dans chaque test
@GenerateMocks([Client])
void main() {
  final client = MockClient();
  late Services services;

  setUp(() {
    services = Services(client);
  });

// Test Fetch Sites
  group('Service getSites', () {
    test('Should return a site list when successful', () async {
      // Utiliser Mockito pour renvoyer une réponse réussie lorsqu'il appelle le http.Client fourni
      when(client.get(Uri.parse('$url/GetSites'))).thenAnswer(
          (_) async => Response(
              '[{"CODESITE":"S01","NOMSITE":"Site S01","ADRESSESITE":"Adresse S01","IDSITE":1},{"CODESITE":"S02","NOMSITE":"Site S02","ADRESSESITE":"Adresse S02","IDSITE":2}]',
              200));
      expect(await services.fetchSites(), isA<List<Site>>());
    });
  });

// Test Fetch Origines
  group('Service getOrigines', () {
    test('Should return a origine list when successful', () async {
      when(client.get(Uri.parse('$url/GetOrigines/1')))
          .thenAnswer((_) async => Response(
              '[{"IDSITE":1,"CODEORIGINE":"S01.E01","LIBELLEORIGINE":"Libelle S01.E01","IDORIGINE":11},{"IDSITE":1,"CODEORIGINE":"S01.E02","LIBELLEORIGINE":"Libelle S01.E02","IDORIGINE":12},{"IDSITE":1,"CODEORIGINE":"S01.E03","LIBELLEORIGINE":"Libelle S01.E03","IDORIGINE":13},{"IDSITE":1,"CODEORIGINE":"S01.E04","LIBELLEORIGINE":"Libelle S01.E04","IDORIGINE":14}]',
              200));

      expect(await services.fetchOrigines(1), isA<List<Origine>>());
    });
  });

// Test Fetch Matricules
  group('Service getMatricules', () {
    test('Should return a Matricules list when successful', () async {
      when(client.get(Uri.parse('$url/GetMatricules/14')))
          .thenAnswer((_) async => Response(
              '[{"IDORIGINE":14,"CODEMATRICULE":"S01.E04.M01","NOMMATRICULE":"Nom 07","PRENOMMATRICULE":"Prenom 07","IDMATRICULE":141},{"IDORIGINE":14,"CODEMATRICULE":"S01.E04.M02","NOMMATRICULE":"Nom 08","PRENOMMATRICULE":"Prenom 08","IDMATRICULE":142}]',
              200));

      expect(await services.fetchMatricules(14), isA<List<Matricule>>());
    });
  });

//test Fetch Equipements
  group('Service getEquipements', () {
    test('Should return a Equipements list when successful', () async {
      when(client.get(Uri.parse('$url/GetEquipements/1')))
          .thenAnswer((_) async => Response(
              '[{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0002","LIBELLEEQUIPEMENT":"Libelle S01.EQ0002","IDEQUIPEMENT":101},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0003","LIBELLEEQUIPEMENT":"Libelle S01.EQ0003","IDEQUIPEMENT":102},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0004","LIBELLEEQUIPEMENT":"Libelle S01.EQ0004","IDEQUIPEMENT":103},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0005","LIBELLEEQUIPEMENT":"Libelle S01.EQ0005","IDEQUIPEMENT":104},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0006","LIBELLEEQUIPEMENT":"Libelle S01.EQ0006","IDEQUIPEMENT":105},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0007","LIBELLEEQUIPEMENT":"Libelle S01.EQ0007","IDEQUIPEMENT":106},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0008","LIBELLEEQUIPEMENT":"Libelle S01.EQ0008","IDEQUIPEMENT":107},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0009","LIBELLEEQUIPEMENT":"Libelle S01.EQ0009","IDEQUIPEMENT":108},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0010","LIBELLEEQUIPEMENT":"Libelle S01.EQ0010","IDEQUIPEMENT":109},{"IDSITE":1,"CODEEQUIPEMENT":"S01.EQ0011","LIBELLEEQUIPEMENT":"Libelle S01.EQ0011","IDEQUIPEMENT":110}]',
              200));

      expect(await services.fetchEquipements(1), isA<List<Equipement>>());
    });
  });

// Test fetch Categories
  group('Service getCategories', () {
    test('Should return a Categories list when successful', () async {
      when(client.get(Uri.parse('$url/GetCategories/1')))
          .thenAnswer((_) async => Response(
              '[{"IDSITE":1,"CODECATEGORIE":"S01.MPS","LIBELLECATEGORIE":"Préventif","IDCATEGORIE":11},{"IDSITE":1,"CODECATEGORIE":"S01.MCO","LIBELLECATEGORIE":"Correctif","IDCATEGORIE":12}]',
              200));

      expect(await services.fetchCategories(1), isA<List<Categorie>>());
    });
  });

// Test Fetch Ots
  group('Service getOTs', () {
    test('Should return a OTs list when successful', () async {
      when(client.get(Uri.parse('$url/GetOts/1/12')))
          .thenAnswer((_) async => Response(
              '[{"IDORIGINE":12,"CODEOT":"OT.S01.EQ0005","LIBELLEOT":"Libelle OT.S01.EQ0005","COMMENTOT":"","TEMPSOT":10,"STATUTOT":"1","IDOT":104,"IDEQUIPEMENT":104,"IDCATEGORIE":12},{"IDORIGINE":12,"CODEOT":"OT.S01.EQ0006","LIBELLEOT":"Libelle OT.S01.EQ0006","COMMENTOT":"","TEMPSOT":10,"STATUTOT":"1","IDOT":105,"IDEQUIPEMENT":105,"IDCATEGORIE":11},{"IDORIGINE":12,"CODEOT":"OT.S01.EQ0007","LIBELLEOT":"Libelle OT.S01.EQ0007","COMMENTOT":"","TEMPSOT":10,"STATUTOT":"1","IDOT":106,"IDEQUIPEMENT":106,"IDCATEGORIE":12}]',
              200));

      expect(await services.fetchOTs(1, 12), isA<List<Ot>>());
    });
  });

// Test Fetch OTTaches

  group('Service getOTTaches', () {
    test('Should return a Taches list when successful', () async {
      when(client.get(Uri.parse('$url/GETOT_TACHES/101')))
          .thenAnswer((_) async => Response(
              '[{"IDOT":101,"CODETACHE":"OT.S01.EQ0002\/003","LIBELLETACHE":"Libelle OT.S01.EQ0002\/003","STATUTTACHE":1,"COMMENTTACHE":"debug","IDTACHE":102},{"IDOT":101,"CODETACHE":"OT.S01.EQ0002\/004","LIBELLETACHE":"Libelle OT.S01.EQ0002\/004","STATUTTACHE":1,"COMMENTTACHE":"ttt","IDTACHE":103},{"IDOT":101,"CODETACHE":"OT.S01.EQ0002\/005","LIBELLETACHE":"Libelle OT.S01.EQ0002\/005","STATUTTACHE":0,"COMMENTTACHE":"","IDTACHE":104},{"IDOT":101,"CODETACHE":"OT.S01.EQ0002\/006","LIBELLETACHE":"Libelle OT.S01.EQ0002\/006","STATUTTACHE":0,"COMMENTTACHE":"","IDTACHE":105},{"IDOT":101,"CODETACHE":"OT.S01.EQ0002\/007","LIBELLETACHE":"Libelle OT.S01.EQ0002\/007","STATUTTACHE":0,"COMMENTTACHE":"","IDTACHE":106}]',
              200));

      expect(await services.fetchOTTaches(101), isA<List<Tache>>());
    });
  });

//Test Fetch Configs
  group('Service getConfigs', () {
    test('Should return a Configs list when successful', () async {
      when(client.get(Uri.parse('$url/GETCONFIG/1/P02')))
          .thenAnswer((_) async => Response(
              '[{"IDSITE":1,"CODEPOCKET":"P02","NOMPOCKET":"POCKET MECANIQUE AUTOMOBILE","IDORIGINE":14,"CODEORIGINE":"S01.E04","LIBELLEORIGINE":"Libelle S01.E04"}]',
              200));

      expect(await services.fetchConfigs(1, "P02"), isA<List<Config>>());
    });
  });

// Test Fetch Articles
  group('Service getArticles', () {
    test('Should return a Articles list when successful', () async {
      when(client.get(Uri.parse('$url/GETARTICLE/A00002')))
          .thenAnswer((_) async => Response(
              '[{"CODEARTICLE":"A00002","LIBELLEARTICLE":"Article A00002","QTEARTICLE":11,"IDARTICLE":2}]',
              200));

      expect(await services.fetchArticles("A00002"), isA<List<Article>>());
    });
  });

// Test Fetch Reservations
  group('Service getReservations', () {
    test('Should return a Reservation list when successful', () async {
      when(client.get(Uri.parse('$url/GETOT_ARTICLES/102')))
          .thenAnswer((_) async => Response(
              '[{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00002","QTEARTICLE":0,"IDARTICLE":2,"IDPIECE":1},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00003","QTEARTICLE":1.5,"IDARTICLE":3,"IDPIECE":2},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00004","QTEARTICLE":0,"IDARTICLE":4,"IDPIECE":3},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00005","QTEARTICLE":0,"IDARTICLE":5,"IDPIECE":4},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00006","QTEARTICLE":0,"IDARTICLE":6,"IDPIECE":5},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00007","QTEARTICLE":0,"IDARTICLE":7,"IDPIECE":6},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00008","QTEARTICLE":0,"IDARTICLE":8,"IDPIECE":7},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00009","QTEARTICLE":0,"IDARTICLE":9,"IDPIECE":8},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00010","QTEARTICLE":0,"IDARTICLE":10,"IDPIECE":9},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00011","QTEARTICLE":0,"IDARTICLE":11,"IDPIECE":10},{"IDOT":102,"CODEARTICLE":"OT.S01.EQ0003","LIBELLEARTICLE":"OT.S01.EQ0003 Piece A00012","QTEARTICLE":0,"IDARTICLE":12,"IDPIECE":11}]',
              200));

      expect(await services.fetchReservations(102), isA<List<Reservation>>());
    });
  });
}
