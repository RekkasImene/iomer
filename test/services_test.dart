

import 'dart:math';

import 'package:http/http.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'services_test.mocks.dart';


@GenerateMocks([Client])
void main() {
  final client = MockClient();
  late Services services;

 setUp(() {
    services = Services(client);
  });

group('Services getSites', () {
  test('Should return a site list when successful', () async {
      when(
        client.get(Uri.parse('https://iomere.loca.lt/GetSites'))
      ).thenAnswer(
        (_) async =>Response(
            '[{"CODESITE":"S01","NOMSITE":"Site S01","ADRESSESITE":"Adresse S01","IDSITE":1},{"CODESITE":"S02","NOMSITE":"Site S02","ADRESSESITE":"Adresse S02","IDSITE":2}]', 200));
      
      expect(await services.fetchSites(), isA<List<Site>>() );
});
});
}