import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/models/bdd/database/shared.dart';
import 'package:iomere/models/bdd/iomer_database.dart';

@module
abstract class RegisterModule {

  @singleton
  IomerDatabase get iomerDatabase => constructDb();
  //LazyDatabase(() async {
  //   // put the database file, called db.sqlite here, into the documents folder
  //   // for your app.
  //   final dbFolder = await getApplicationDocumentsDirectory();
  //   final file = File(p.join(dbFolder.path, 'db.sqlite'));
  //   return NativeDatabase(file);
  // });

  @singleton
  Client get client => Client();

}
