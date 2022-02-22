import 'dart:io';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../iomer_database.dart';

@injectable
IomerDatabase constructDb() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
  return IomerDatabase(db);
}
