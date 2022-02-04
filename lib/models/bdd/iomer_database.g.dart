// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iomer_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Article extends DataClass implements Insertable<Article> {
  final int IDARTICLE;
  final String CODEARTICLE;
  final String LIBELLEARTICLE;
  final int QTEARTICLE;
  Article(
      {required this.IDARTICLE,
      required this.CODEARTICLE,
      required this.LIBELLEARTICLE,
      required this.QTEARTICLE});
  factory Article.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Article(
      IDARTICLE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idarticle'])!,
      CODEARTICLE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codearticle'])!,
      LIBELLEARTICLE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libellearticle'])!,
      QTEARTICLE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qtearticle'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idarticle'] = Variable<int>(IDARTICLE);
    map['codearticle'] = Variable<String>(CODEARTICLE);
    map['libellearticle'] = Variable<String>(LIBELLEARTICLE);
    map['qtearticle'] = Variable<int>(QTEARTICLE);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      IDARTICLE: Value(IDARTICLE),
      CODEARTICLE: Value(CODEARTICLE),
      LIBELLEARTICLE: Value(LIBELLEARTICLE),
      QTEARTICLE: Value(QTEARTICLE),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      IDARTICLE: serializer.fromJson<int>(json['IDARTICLE']),
      CODEARTICLE: serializer.fromJson<String>(json['CODEARTICLE']),
      LIBELLEARTICLE: serializer.fromJson<String>(json['LIBELLEARTICLE']),
      QTEARTICLE: serializer.fromJson<int>(json['QTEARTICLE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDARTICLE': serializer.toJson<int>(IDARTICLE),
      'CODEARTICLE': serializer.toJson<String>(CODEARTICLE),
      'LIBELLEARTICLE': serializer.toJson<String>(LIBELLEARTICLE),
      'QTEARTICLE': serializer.toJson<int>(QTEARTICLE),
    };
  }

  Article copyWith(
          {int? IDARTICLE,
          String? CODEARTICLE,
          String? LIBELLEARTICLE,
          int? QTEARTICLE}) =>
      Article(
        IDARTICLE: IDARTICLE ?? this.IDARTICLE,
        CODEARTICLE: CODEARTICLE ?? this.CODEARTICLE,
        LIBELLEARTICLE: LIBELLEARTICLE ?? this.LIBELLEARTICLE,
        QTEARTICLE: QTEARTICLE ?? this.QTEARTICLE,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('IDARTICLE: $IDARTICLE, ')
          ..write('CODEARTICLE: $CODEARTICLE, ')
          ..write('LIBELLEARTICLE: $LIBELLEARTICLE, ')
          ..write('QTEARTICLE: $QTEARTICLE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(IDARTICLE, CODEARTICLE, LIBELLEARTICLE, QTEARTICLE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.IDARTICLE == this.IDARTICLE &&
          other.CODEARTICLE == this.CODEARTICLE &&
          other.LIBELLEARTICLE == this.LIBELLEARTICLE &&
          other.QTEARTICLE == this.QTEARTICLE);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> IDARTICLE;
  final Value<String> CODEARTICLE;
  final Value<String> LIBELLEARTICLE;
  final Value<int> QTEARTICLE;
  const ArticlesCompanion({
    this.IDARTICLE = const Value.absent(),
    this.CODEARTICLE = const Value.absent(),
    this.LIBELLEARTICLE = const Value.absent(),
    this.QTEARTICLE = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required int IDARTICLE,
    required String CODEARTICLE,
    required String LIBELLEARTICLE,
    required int QTEARTICLE,
  })  : IDARTICLE = Value(IDARTICLE),
        CODEARTICLE = Value(CODEARTICLE),
        LIBELLEARTICLE = Value(LIBELLEARTICLE),
        QTEARTICLE = Value(QTEARTICLE);
  static Insertable<Article> custom({
    Expression<int>? IDARTICLE,
    Expression<String>? CODEARTICLE,
    Expression<String>? LIBELLEARTICLE,
    Expression<int>? QTEARTICLE,
  }) {
    return RawValuesInsertable({
      if (IDARTICLE != null) 'idarticle': IDARTICLE,
      if (CODEARTICLE != null) 'codearticle': CODEARTICLE,
      if (LIBELLEARTICLE != null) 'libellearticle': LIBELLEARTICLE,
      if (QTEARTICLE != null) 'qtearticle': QTEARTICLE,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? IDARTICLE,
      Value<String>? CODEARTICLE,
      Value<String>? LIBELLEARTICLE,
      Value<int>? QTEARTICLE}) {
    return ArticlesCompanion(
      IDARTICLE: IDARTICLE ?? this.IDARTICLE,
      CODEARTICLE: CODEARTICLE ?? this.CODEARTICLE,
      LIBELLEARTICLE: LIBELLEARTICLE ?? this.LIBELLEARTICLE,
      QTEARTICLE: QTEARTICLE ?? this.QTEARTICLE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDARTICLE.present) {
      map['idarticle'] = Variable<int>(IDARTICLE.value);
    }
    if (CODEARTICLE.present) {
      map['codearticle'] = Variable<String>(CODEARTICLE.value);
    }
    if (LIBELLEARTICLE.present) {
      map['libellearticle'] = Variable<String>(LIBELLEARTICLE.value);
    }
    if (QTEARTICLE.present) {
      map['qtearticle'] = Variable<int>(QTEARTICLE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('IDARTICLE: $IDARTICLE, ')
          ..write('CODEARTICLE: $CODEARTICLE, ')
          ..write('LIBELLEARTICLE: $LIBELLEARTICLE, ')
          ..write('QTEARTICLE: $QTEARTICLE')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArticlesTable(this._db, [this._alias]);
  final VerificationMeta _IDARTICLEMeta = const VerificationMeta('IDARTICLE');
  @override
  late final GeneratedColumn<int?> IDARTICLE = GeneratedColumn<int?>(
      'idarticle', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _CODEARTICLEMeta =
      const VerificationMeta('CODEARTICLE');
  @override
  late final GeneratedColumn<String?> CODEARTICLE = GeneratedColumn<String?>(
      'codearticle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLEARTICLEMeta =
      const VerificationMeta('LIBELLEARTICLE');
  @override
  late final GeneratedColumn<String?> LIBELLEARTICLE = GeneratedColumn<String?>(
      'libellearticle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _QTEARTICLEMeta = const VerificationMeta('QTEARTICLE');
  @override
  late final GeneratedColumn<int?> QTEARTICLE = GeneratedColumn<int?>(
      'qtearticle', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDARTICLE, CODEARTICLE, LIBELLEARTICLE, QTEARTICLE];
  @override
  String get aliasedName => _alias ?? 'articles';
  @override
  String get actualTableName => 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idarticle')) {
      context.handle(_IDARTICLEMeta,
          IDARTICLE.isAcceptableOrUnknown(data['idarticle']!, _IDARTICLEMeta));
    } else if (isInserting) {
      context.missing(_IDARTICLEMeta);
    }
    if (data.containsKey('codearticle')) {
      context.handle(
          _CODEARTICLEMeta,
          CODEARTICLE.isAcceptableOrUnknown(
              data['codearticle']!, _CODEARTICLEMeta));
    } else if (isInserting) {
      context.missing(_CODEARTICLEMeta);
    }
    if (data.containsKey('libellearticle')) {
      context.handle(
          _LIBELLEARTICLEMeta,
          LIBELLEARTICLE.isAcceptableOrUnknown(
              data['libellearticle']!, _LIBELLEARTICLEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEARTICLEMeta);
    }
    if (data.containsKey('qtearticle')) {
      context.handle(
          _QTEARTICLEMeta,
          QTEARTICLE.isAcceptableOrUnknown(
              data['qtearticle']!, _QTEARTICLEMeta));
    } else if (isInserting) {
      context.missing(_QTEARTICLEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDARTICLE, CODEARTICLE};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Article.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(_db, alias);
  }
}

class Categorie extends DataClass implements Insertable<Categorie> {
  final int IDCATEGORIE;
  final int? IDSITE;
  final String CODECATEGORIE;
  final String LIBELLECATEGORIE;
  Categorie(
      {required this.IDCATEGORIE,
      this.IDSITE,
      required this.CODECATEGORIE,
      required this.LIBELLECATEGORIE});
  factory Categorie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Categorie(
      IDCATEGORIE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idcategorie'])!,
      IDSITE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idsite']),
      CODECATEGORIE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codecategorie'])!,
      LIBELLECATEGORIE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libellecategorie'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idcategorie'] = Variable<int>(IDCATEGORIE);
    if (!nullToAbsent || IDSITE != null) {
      map['idsite'] = Variable<int?>(IDSITE);
    }
    map['codecategorie'] = Variable<String>(CODECATEGORIE);
    map['libellecategorie'] = Variable<String>(LIBELLECATEGORIE);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      IDCATEGORIE: Value(IDCATEGORIE),
      IDSITE:
          IDSITE == null && nullToAbsent ? const Value.absent() : Value(IDSITE),
      CODECATEGORIE: Value(CODECATEGORIE),
      LIBELLECATEGORIE: Value(LIBELLECATEGORIE),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categorie(
      IDCATEGORIE: serializer.fromJson<int>(json['IDCATEGORIE']),
      IDSITE: serializer.fromJson<int?>(json['IDSITE']),
      CODECATEGORIE: serializer.fromJson<String>(json['CODECATEGORIE']),
      LIBELLECATEGORIE: serializer.fromJson<String>(json['LIBELLECATEGORIE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDCATEGORIE': serializer.toJson<int>(IDCATEGORIE),
      'IDSITE': serializer.toJson<int?>(IDSITE),
      'CODECATEGORIE': serializer.toJson<String>(CODECATEGORIE),
      'LIBELLECATEGORIE': serializer.toJson<String>(LIBELLECATEGORIE),
    };
  }

  Categorie copyWith(
          {int? IDCATEGORIE,
          int? IDSITE,
          String? CODECATEGORIE,
          String? LIBELLECATEGORIE}) =>
      Categorie(
        IDCATEGORIE: IDCATEGORIE ?? this.IDCATEGORIE,
        IDSITE: IDSITE ?? this.IDSITE,
        CODECATEGORIE: CODECATEGORIE ?? this.CODECATEGORIE,
        LIBELLECATEGORIE: LIBELLECATEGORIE ?? this.LIBELLECATEGORIE,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('IDCATEGORIE: $IDCATEGORIE, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODECATEGORIE: $CODECATEGORIE, ')
          ..write('LIBELLECATEGORIE: $LIBELLECATEGORIE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(IDCATEGORIE, IDSITE, CODECATEGORIE, LIBELLECATEGORIE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.IDCATEGORIE == this.IDCATEGORIE &&
          other.IDSITE == this.IDSITE &&
          other.CODECATEGORIE == this.CODECATEGORIE &&
          other.LIBELLECATEGORIE == this.LIBELLECATEGORIE);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> IDCATEGORIE;
  final Value<int?> IDSITE;
  final Value<String> CODECATEGORIE;
  final Value<String> LIBELLECATEGORIE;
  const CategoriesCompanion({
    this.IDCATEGORIE = const Value.absent(),
    this.IDSITE = const Value.absent(),
    this.CODECATEGORIE = const Value.absent(),
    this.LIBELLECATEGORIE = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.IDCATEGORIE = const Value.absent(),
    this.IDSITE = const Value.absent(),
    required String CODECATEGORIE,
    required String LIBELLECATEGORIE,
  })  : CODECATEGORIE = Value(CODECATEGORIE),
        LIBELLECATEGORIE = Value(LIBELLECATEGORIE);
  static Insertable<Categorie> custom({
    Expression<int>? IDCATEGORIE,
    Expression<int?>? IDSITE,
    Expression<String>? CODECATEGORIE,
    Expression<String>? LIBELLECATEGORIE,
  }) {
    return RawValuesInsertable({
      if (IDCATEGORIE != null) 'idcategorie': IDCATEGORIE,
      if (IDSITE != null) 'idsite': IDSITE,
      if (CODECATEGORIE != null) 'codecategorie': CODECATEGORIE,
      if (LIBELLECATEGORIE != null) 'libellecategorie': LIBELLECATEGORIE,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? IDCATEGORIE,
      Value<int?>? IDSITE,
      Value<String>? CODECATEGORIE,
      Value<String>? LIBELLECATEGORIE}) {
    return CategoriesCompanion(
      IDCATEGORIE: IDCATEGORIE ?? this.IDCATEGORIE,
      IDSITE: IDSITE ?? this.IDSITE,
      CODECATEGORIE: CODECATEGORIE ?? this.CODECATEGORIE,
      LIBELLECATEGORIE: LIBELLECATEGORIE ?? this.LIBELLECATEGORIE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDCATEGORIE.present) {
      map['idcategorie'] = Variable<int>(IDCATEGORIE.value);
    }
    if (IDSITE.present) {
      map['idsite'] = Variable<int?>(IDSITE.value);
    }
    if (CODECATEGORIE.present) {
      map['codecategorie'] = Variable<String>(CODECATEGORIE.value);
    }
    if (LIBELLECATEGORIE.present) {
      map['libellecategorie'] = Variable<String>(LIBELLECATEGORIE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('IDCATEGORIE: $IDCATEGORIE, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODECATEGORIE: $CODECATEGORIE, ')
          ..write('LIBELLECATEGORIE: $LIBELLECATEGORIE')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _IDCATEGORIEMeta =
      const VerificationMeta('IDCATEGORIE');
  @override
  late final GeneratedColumn<int?> IDCATEGORIE = GeneratedColumn<int?>(
      'idcategorie', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDSITEMeta = const VerificationMeta('IDSITE');
  @override
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(IDSITE)');
  final VerificationMeta _CODECATEGORIEMeta =
      const VerificationMeta('CODECATEGORIE');
  @override
  late final GeneratedColumn<String?> CODECATEGORIE = GeneratedColumn<String?>(
      'codecategorie', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLECATEGORIEMeta =
      const VerificationMeta('LIBELLECATEGORIE');
  @override
  late final GeneratedColumn<String?> LIBELLECATEGORIE =
      GeneratedColumn<String?>('libellecategorie', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          type: const StringType(),
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDCATEGORIE, IDSITE, CODECATEGORIE, LIBELLECATEGORIE];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idcategorie')) {
      context.handle(
          _IDCATEGORIEMeta,
          IDCATEGORIE.isAcceptableOrUnknown(
              data['idcategorie']!, _IDCATEGORIEMeta));
    }
    if (data.containsKey('idsite')) {
      context.handle(_IDSITEMeta,
          IDSITE.isAcceptableOrUnknown(data['idsite']!, _IDSITEMeta));
    }
    if (data.containsKey('codecategorie')) {
      context.handle(
          _CODECATEGORIEMeta,
          CODECATEGORIE.isAcceptableOrUnknown(
              data['codecategorie']!, _CODECATEGORIEMeta));
    } else if (isInserting) {
      context.missing(_CODECATEGORIEMeta);
    }
    if (data.containsKey('libellecategorie')) {
      context.handle(
          _LIBELLECATEGORIEMeta,
          LIBELLECATEGORIE.isAcceptableOrUnknown(
              data['libellecategorie']!, _LIBELLECATEGORIEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLECATEGORIEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDCATEGORIE};
  @override
  Categorie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Categorie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int IDATTACHEMENT;
  final int? IDOT;
  final Uint8List ATTACHEMENT;
  Document({required this.IDATTACHEMENT, this.IDOT, required this.ATTACHEMENT});
  factory Document.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Document(
      IDATTACHEMENT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idattachement'])!,
      IDOT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idot']),
      ATTACHEMENT: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attachement'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idattachement'] = Variable<int>(IDATTACHEMENT);
    if (!nullToAbsent || IDOT != null) {
      map['idot'] = Variable<int?>(IDOT);
    }
    map['attachement'] = Variable<Uint8List>(ATTACHEMENT);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      IDATTACHEMENT: Value(IDATTACHEMENT),
      IDOT: IDOT == null && nullToAbsent ? const Value.absent() : Value(IDOT),
      ATTACHEMENT: Value(ATTACHEMENT),
    );
  }

  factory Document.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      IDATTACHEMENT: serializer.fromJson<int>(json['IDATTACHEMENT']),
      IDOT: serializer.fromJson<int?>(json['IDOT']),
      ATTACHEMENT: serializer.fromJson<Uint8List>(json['ATTACHEMENT']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDATTACHEMENT': serializer.toJson<int>(IDATTACHEMENT),
      'IDOT': serializer.toJson<int?>(IDOT),
      'ATTACHEMENT': serializer.toJson<Uint8List>(ATTACHEMENT),
    };
  }

  Document copyWith({int? IDATTACHEMENT, int? IDOT, Uint8List? ATTACHEMENT}) =>
      Document(
        IDATTACHEMENT: IDATTACHEMENT ?? this.IDATTACHEMENT,
        IDOT: IDOT ?? this.IDOT,
        ATTACHEMENT: ATTACHEMENT ?? this.ATTACHEMENT,
      );
  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('IDATTACHEMENT: $IDATTACHEMENT, ')
          ..write('IDOT: $IDOT, ')
          ..write('ATTACHEMENT: $ATTACHEMENT')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(IDATTACHEMENT, IDOT, ATTACHEMENT);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.IDATTACHEMENT == this.IDATTACHEMENT &&
          other.IDOT == this.IDOT &&
          other.ATTACHEMENT == this.ATTACHEMENT);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> IDATTACHEMENT;
  final Value<int?> IDOT;
  final Value<Uint8List> ATTACHEMENT;
  const DocumentsCompanion({
    this.IDATTACHEMENT = const Value.absent(),
    this.IDOT = const Value.absent(),
    this.ATTACHEMENT = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.IDATTACHEMENT = const Value.absent(),
    this.IDOT = const Value.absent(),
    required Uint8List ATTACHEMENT,
  }) : ATTACHEMENT = Value(ATTACHEMENT);
  static Insertable<Document> custom({
    Expression<int>? IDATTACHEMENT,
    Expression<int?>? IDOT,
    Expression<Uint8List>? ATTACHEMENT,
  }) {
    return RawValuesInsertable({
      if (IDATTACHEMENT != null) 'idattachement': IDATTACHEMENT,
      if (IDOT != null) 'idot': IDOT,
      if (ATTACHEMENT != null) 'attachement': ATTACHEMENT,
    });
  }

  DocumentsCompanion copyWith(
      {Value<int>? IDATTACHEMENT,
      Value<int?>? IDOT,
      Value<Uint8List>? ATTACHEMENT}) {
    return DocumentsCompanion(
      IDATTACHEMENT: IDATTACHEMENT ?? this.IDATTACHEMENT,
      IDOT: IDOT ?? this.IDOT,
      ATTACHEMENT: ATTACHEMENT ?? this.ATTACHEMENT,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDATTACHEMENT.present) {
      map['idattachement'] = Variable<int>(IDATTACHEMENT.value);
    }
    if (IDOT.present) {
      map['idot'] = Variable<int?>(IDOT.value);
    }
    if (ATTACHEMENT.present) {
      map['attachement'] = Variable<Uint8List>(ATTACHEMENT.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('IDATTACHEMENT: $IDATTACHEMENT, ')
          ..write('IDOT: $IDOT, ')
          ..write('ATTACHEMENT: $ATTACHEMENT')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DocumentsTable(this._db, [this._alias]);
  final VerificationMeta _IDATTACHEMENTMeta =
      const VerificationMeta('IDATTACHEMENT');
  @override
  late final GeneratedColumn<int?> IDATTACHEMENT = GeneratedColumn<int?>(
      'idattachement', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _IDOTMeta = const VerificationMeta('IDOT');
  @override
  late final GeneratedColumn<int?> IDOT = GeneratedColumn<int?>(
      'idot', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(IDOT)');
  final VerificationMeta _ATTACHEMENTMeta =
      const VerificationMeta('ATTACHEMENT');
  @override
  late final GeneratedColumn<Uint8List?> ATTACHEMENT =
      GeneratedColumn<Uint8List?>('attachement', aliasedName, false,
          type: const BlobType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [IDATTACHEMENT, IDOT, ATTACHEMENT];
  @override
  String get aliasedName => _alias ?? 'documents';
  @override
  String get actualTableName => 'documents';
  @override
  VerificationContext validateIntegrity(Insertable<Document> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idattachement')) {
      context.handle(
          _IDATTACHEMENTMeta,
          IDATTACHEMENT.isAcceptableOrUnknown(
              data['idattachement']!, _IDATTACHEMENTMeta));
    }
    if (data.containsKey('idot')) {
      context.handle(
          _IDOTMeta, IDOT.isAcceptableOrUnknown(data['idot']!, _IDOTMeta));
    }
    if (data.containsKey('attachement')) {
      context.handle(
          _ATTACHEMENTMeta,
          ATTACHEMENT.isAcceptableOrUnknown(
              data['attachement']!, _ATTACHEMENTMeta));
    } else if (isInserting) {
      context.missing(_ATTACHEMENTMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDATTACHEMENT};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Document.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(_db, alias);
  }
}

class Equipement extends DataClass implements Insertable<Equipement> {
  final int IDEQUIPEMENT;
  final int? IDSITE;
  final String CODEEQUIPEMENT;
  final String LIBELLEEQUIPEMENT;
  Equipement(
      {required this.IDEQUIPEMENT,
      this.IDSITE,
      required this.CODEEQUIPEMENT,
      required this.LIBELLEEQUIPEMENT});
  factory Equipement.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Equipement(
      IDEQUIPEMENT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idequipement'])!,
      IDSITE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idsite']),
      CODEEQUIPEMENT: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codeequipement'])!,
      LIBELLEEQUIPEMENT: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}libelleequipement'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idequipement'] = Variable<int>(IDEQUIPEMENT);
    if (!nullToAbsent || IDSITE != null) {
      map['idsite'] = Variable<int?>(IDSITE);
    }
    map['codeequipement'] = Variable<String>(CODEEQUIPEMENT);
    map['libelleequipement'] = Variable<String>(LIBELLEEQUIPEMENT);
    return map;
  }

  EquipementsCompanion toCompanion(bool nullToAbsent) {
    return EquipementsCompanion(
      IDEQUIPEMENT: Value(IDEQUIPEMENT),
      IDSITE:
          IDSITE == null && nullToAbsent ? const Value.absent() : Value(IDSITE),
      CODEEQUIPEMENT: Value(CODEEQUIPEMENT),
      LIBELLEEQUIPEMENT: Value(LIBELLEEQUIPEMENT),
    );
  }

  factory Equipement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Equipement(
      IDEQUIPEMENT: serializer.fromJson<int>(json['IDEQUIPEMENT']),
      IDSITE: serializer.fromJson<int?>(json['IDSITE']),
      CODEEQUIPEMENT: serializer.fromJson<String>(json['CODEEQUIPEMENT']),
      LIBELLEEQUIPEMENT: serializer.fromJson<String>(json['LIBELLEEQUIPEMENT']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDEQUIPEMENT': serializer.toJson<int>(IDEQUIPEMENT),
      'IDSITE': serializer.toJson<int?>(IDSITE),
      'CODEEQUIPEMENT': serializer.toJson<String>(CODEEQUIPEMENT),
      'LIBELLEEQUIPEMENT': serializer.toJson<String>(LIBELLEEQUIPEMENT),
    };
  }

  Equipement copyWith(
          {int? IDEQUIPEMENT,
          int? IDSITE,
          String? CODEEQUIPEMENT,
          String? LIBELLEEQUIPEMENT}) =>
      Equipement(
        IDEQUIPEMENT: IDEQUIPEMENT ?? this.IDEQUIPEMENT,
        IDSITE: IDSITE ?? this.IDSITE,
        CODEEQUIPEMENT: CODEEQUIPEMENT ?? this.CODEEQUIPEMENT,
        LIBELLEEQUIPEMENT: LIBELLEEQUIPEMENT ?? this.LIBELLEEQUIPEMENT,
      );
  @override
  String toString() {
    return (StringBuffer('Equipement(')
          ..write('IDEQUIPEMENT: $IDEQUIPEMENT, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEEQUIPEMENT: $CODEEQUIPEMENT, ')
          ..write('LIBELLEEQUIPEMENT: $LIBELLEEQUIPEMENT')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(IDEQUIPEMENT, IDSITE, CODEEQUIPEMENT, LIBELLEEQUIPEMENT);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Equipement &&
          other.IDEQUIPEMENT == this.IDEQUIPEMENT &&
          other.IDSITE == this.IDSITE &&
          other.CODEEQUIPEMENT == this.CODEEQUIPEMENT &&
          other.LIBELLEEQUIPEMENT == this.LIBELLEEQUIPEMENT);
}

class EquipementsCompanion extends UpdateCompanion<Equipement> {
  final Value<int> IDEQUIPEMENT;
  final Value<int?> IDSITE;
  final Value<String> CODEEQUIPEMENT;
  final Value<String> LIBELLEEQUIPEMENT;
  const EquipementsCompanion({
    this.IDEQUIPEMENT = const Value.absent(),
    this.IDSITE = const Value.absent(),
    this.CODEEQUIPEMENT = const Value.absent(),
    this.LIBELLEEQUIPEMENT = const Value.absent(),
  });
  EquipementsCompanion.insert({
    this.IDEQUIPEMENT = const Value.absent(),
    this.IDSITE = const Value.absent(),
    required String CODEEQUIPEMENT,
    required String LIBELLEEQUIPEMENT,
  })  : CODEEQUIPEMENT = Value(CODEEQUIPEMENT),
        LIBELLEEQUIPEMENT = Value(LIBELLEEQUIPEMENT);
  static Insertable<Equipement> custom({
    Expression<int>? IDEQUIPEMENT,
    Expression<int?>? IDSITE,
    Expression<String>? CODEEQUIPEMENT,
    Expression<String>? LIBELLEEQUIPEMENT,
  }) {
    return RawValuesInsertable({
      if (IDEQUIPEMENT != null) 'idequipement': IDEQUIPEMENT,
      if (IDSITE != null) 'idsite': IDSITE,
      if (CODEEQUIPEMENT != null) 'codeequipement': CODEEQUIPEMENT,
      if (LIBELLEEQUIPEMENT != null) 'libelleequipement': LIBELLEEQUIPEMENT,
    });
  }

  EquipementsCompanion copyWith(
      {Value<int>? IDEQUIPEMENT,
      Value<int?>? IDSITE,
      Value<String>? CODEEQUIPEMENT,
      Value<String>? LIBELLEEQUIPEMENT}) {
    return EquipementsCompanion(
      IDEQUIPEMENT: IDEQUIPEMENT ?? this.IDEQUIPEMENT,
      IDSITE: IDSITE ?? this.IDSITE,
      CODEEQUIPEMENT: CODEEQUIPEMENT ?? this.CODEEQUIPEMENT,
      LIBELLEEQUIPEMENT: LIBELLEEQUIPEMENT ?? this.LIBELLEEQUIPEMENT,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDEQUIPEMENT.present) {
      map['idequipement'] = Variable<int>(IDEQUIPEMENT.value);
    }
    if (IDSITE.present) {
      map['idsite'] = Variable<int?>(IDSITE.value);
    }
    if (CODEEQUIPEMENT.present) {
      map['codeequipement'] = Variable<String>(CODEEQUIPEMENT.value);
    }
    if (LIBELLEEQUIPEMENT.present) {
      map['libelleequipement'] = Variable<String>(LIBELLEEQUIPEMENT.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipementsCompanion(')
          ..write('IDEQUIPEMENT: $IDEQUIPEMENT, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEEQUIPEMENT: $CODEEQUIPEMENT, ')
          ..write('LIBELLEEQUIPEMENT: $LIBELLEEQUIPEMENT')
          ..write(')'))
        .toString();
  }
}

class $EquipementsTable extends Equipements
    with TableInfo<$EquipementsTable, Equipement> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EquipementsTable(this._db, [this._alias]);
  final VerificationMeta _IDEQUIPEMENTMeta =
      const VerificationMeta('IDEQUIPEMENT');
  @override
  late final GeneratedColumn<int?> IDEQUIPEMENT = GeneratedColumn<int?>(
      'idequipement', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDSITEMeta = const VerificationMeta('IDSITE');
  @override
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(IDSITE)');
  final VerificationMeta _CODEEQUIPEMENTMeta =
      const VerificationMeta('CODEEQUIPEMENT');
  @override
  late final GeneratedColumn<String?> CODEEQUIPEMENT = GeneratedColumn<String?>(
      'codeequipement', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLEEQUIPEMENTMeta =
      const VerificationMeta('LIBELLEEQUIPEMENT');
  @override
  late final GeneratedColumn<String?> LIBELLEEQUIPEMENT =
      GeneratedColumn<String?>('libelleequipement', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          type: const StringType(),
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDEQUIPEMENT, IDSITE, CODEEQUIPEMENT, LIBELLEEQUIPEMENT];
  @override
  String get aliasedName => _alias ?? 'equipements';
  @override
  String get actualTableName => 'equipements';
  @override
  VerificationContext validateIntegrity(Insertable<Equipement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idequipement')) {
      context.handle(
          _IDEQUIPEMENTMeta,
          IDEQUIPEMENT.isAcceptableOrUnknown(
              data['idequipement']!, _IDEQUIPEMENTMeta));
    }
    if (data.containsKey('idsite')) {
      context.handle(_IDSITEMeta,
          IDSITE.isAcceptableOrUnknown(data['idsite']!, _IDSITEMeta));
    }
    if (data.containsKey('codeequipement')) {
      context.handle(
          _CODEEQUIPEMENTMeta,
          CODEEQUIPEMENT.isAcceptableOrUnknown(
              data['codeequipement']!, _CODEEQUIPEMENTMeta));
    } else if (isInserting) {
      context.missing(_CODEEQUIPEMENTMeta);
    }
    if (data.containsKey('libelleequipement')) {
      context.handle(
          _LIBELLEEQUIPEMENTMeta,
          LIBELLEEQUIPEMENT.isAcceptableOrUnknown(
              data['libelleequipement']!, _LIBELLEEQUIPEMENTMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEEQUIPEMENTMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDEQUIPEMENT};
  @override
  Equipement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Equipement.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EquipementsTable createAlias(String alias) {
    return $EquipementsTable(_db, alias);
  }
}

class Matricule extends DataClass implements Insertable<Matricule> {
  final int IDMATRICULE;
  final int? IDORIGINE;
  final String CODEMATRICULE;
  final String NOMMATRICULE;
  final String PRENOMMATRICULE;
  final bool? CHECKED;
  Matricule(
      {required this.IDMATRICULE,
      this.IDORIGINE,
      required this.CODEMATRICULE,
      required this.NOMMATRICULE,
      required this.PRENOMMATRICULE,
      this.CHECKED});
  factory Matricule.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Matricule(
      IDMATRICULE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idmatricule'])!,
      IDORIGINE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idorigine']),
      CODEMATRICULE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codematricule'])!,
      NOMMATRICULE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nommatricule'])!,
      PRENOMMATRICULE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenommatricule'])!,
      CHECKED: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}checked']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idmatricule'] = Variable<int>(IDMATRICULE);
    if (!nullToAbsent || IDORIGINE != null) {
      map['idorigine'] = Variable<int?>(IDORIGINE);
    }
    map['codematricule'] = Variable<String>(CODEMATRICULE);
    map['nommatricule'] = Variable<String>(NOMMATRICULE);
    map['prenommatricule'] = Variable<String>(PRENOMMATRICULE);
    if (!nullToAbsent || CHECKED != null) {
      map['checked'] = Variable<bool?>(CHECKED);
    }
    return map;
  }

  MatriculesCompanion toCompanion(bool nullToAbsent) {
    return MatriculesCompanion(
      IDMATRICULE: Value(IDMATRICULE),
      IDORIGINE: IDORIGINE == null && nullToAbsent
          ? const Value.absent()
          : Value(IDORIGINE),
      CODEMATRICULE: Value(CODEMATRICULE),
      NOMMATRICULE: Value(NOMMATRICULE),
      PRENOMMATRICULE: Value(PRENOMMATRICULE),
      CHECKED: CHECKED == null && nullToAbsent
          ? const Value.absent()
          : Value(CHECKED),
    );
  }

  factory Matricule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matricule(
      IDMATRICULE: serializer.fromJson<int>(json['IDMATRICULE']),
      IDORIGINE: serializer.fromJson<int?>(json['IDORIGINE']),
      CODEMATRICULE: serializer.fromJson<String>(json['CODEMATRICULE']),
      NOMMATRICULE: serializer.fromJson<String>(json['NOMMATRICULE']),
      PRENOMMATRICULE: serializer.fromJson<String>(json['PRENOMMATRICULE']),
      CHECKED: serializer.fromJson<bool?>(json['CHECKED']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDMATRICULE': serializer.toJson<int>(IDMATRICULE),
      'IDORIGINE': serializer.toJson<int?>(IDORIGINE),
      'CODEMATRICULE': serializer.toJson<String>(CODEMATRICULE),
      'NOMMATRICULE': serializer.toJson<String>(NOMMATRICULE),
      'PRENOMMATRICULE': serializer.toJson<String>(PRENOMMATRICULE),
      'CHECKED': serializer.toJson<bool?>(CHECKED),
    };
  }

  Matricule copyWith(
          {int? IDMATRICULE,
          int? IDORIGINE,
          String? CODEMATRICULE,
          String? NOMMATRICULE,
          String? PRENOMMATRICULE,
          bool? CHECKED}) =>
      Matricule(
        IDMATRICULE: IDMATRICULE ?? this.IDMATRICULE,
        IDORIGINE: IDORIGINE ?? this.IDORIGINE,
        CODEMATRICULE: CODEMATRICULE ?? this.CODEMATRICULE,
        NOMMATRICULE: NOMMATRICULE ?? this.NOMMATRICULE,
        PRENOMMATRICULE: PRENOMMATRICULE ?? this.PRENOMMATRICULE,
        CHECKED: CHECKED ?? this.CHECKED,
      );
  @override
  String toString() {
    return (StringBuffer('Matricule(')
          ..write('IDMATRICULE: $IDMATRICULE, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('CODEMATRICULE: $CODEMATRICULE, ')
          ..write('NOMMATRICULE: $NOMMATRICULE, ')
          ..write('PRENOMMATRICULE: $PRENOMMATRICULE, ')
          ..write('CHECKED: $CHECKED')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(IDMATRICULE, IDORIGINE, CODEMATRICULE,
      NOMMATRICULE, PRENOMMATRICULE, CHECKED);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matricule &&
          other.IDMATRICULE == this.IDMATRICULE &&
          other.IDORIGINE == this.IDORIGINE &&
          other.CODEMATRICULE == this.CODEMATRICULE &&
          other.NOMMATRICULE == this.NOMMATRICULE &&
          other.PRENOMMATRICULE == this.PRENOMMATRICULE &&
          other.CHECKED == this.CHECKED);
}

class MatriculesCompanion extends UpdateCompanion<Matricule> {
  final Value<int> IDMATRICULE;
  final Value<int?> IDORIGINE;
  final Value<String> CODEMATRICULE;
  final Value<String> NOMMATRICULE;
  final Value<String> PRENOMMATRICULE;
  final Value<bool?> CHECKED;
  const MatriculesCompanion({
    this.IDMATRICULE = const Value.absent(),
    this.IDORIGINE = const Value.absent(),
    this.CODEMATRICULE = const Value.absent(),
    this.NOMMATRICULE = const Value.absent(),
    this.PRENOMMATRICULE = const Value.absent(),
    this.CHECKED = const Value.absent(),
  });
  MatriculesCompanion.insert({
    this.IDMATRICULE = const Value.absent(),
    this.IDORIGINE = const Value.absent(),
    required String CODEMATRICULE,
    required String NOMMATRICULE,
    required String PRENOMMATRICULE,
    this.CHECKED = const Value.absent(),
  })  : CODEMATRICULE = Value(CODEMATRICULE),
        NOMMATRICULE = Value(NOMMATRICULE),
        PRENOMMATRICULE = Value(PRENOMMATRICULE);
  static Insertable<Matricule> custom({
    Expression<int>? IDMATRICULE,
    Expression<int?>? IDORIGINE,
    Expression<String>? CODEMATRICULE,
    Expression<String>? NOMMATRICULE,
    Expression<String>? PRENOMMATRICULE,
    Expression<bool?>? CHECKED,
  }) {
    return RawValuesInsertable({
      if (IDMATRICULE != null) 'idmatricule': IDMATRICULE,
      if (IDORIGINE != null) 'idorigine': IDORIGINE,
      if (CODEMATRICULE != null) 'codematricule': CODEMATRICULE,
      if (NOMMATRICULE != null) 'nommatricule': NOMMATRICULE,
      if (PRENOMMATRICULE != null) 'prenommatricule': PRENOMMATRICULE,
      if (CHECKED != null) 'checked': CHECKED,
    });
  }

  MatriculesCompanion copyWith(
      {Value<int>? IDMATRICULE,
      Value<int?>? IDORIGINE,
      Value<String>? CODEMATRICULE,
      Value<String>? NOMMATRICULE,
      Value<String>? PRENOMMATRICULE,
      Value<bool?>? CHECKED}) {
    return MatriculesCompanion(
      IDMATRICULE: IDMATRICULE ?? this.IDMATRICULE,
      IDORIGINE: IDORIGINE ?? this.IDORIGINE,
      CODEMATRICULE: CODEMATRICULE ?? this.CODEMATRICULE,
      NOMMATRICULE: NOMMATRICULE ?? this.NOMMATRICULE,
      PRENOMMATRICULE: PRENOMMATRICULE ?? this.PRENOMMATRICULE,
      CHECKED: CHECKED ?? this.CHECKED,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDMATRICULE.present) {
      map['idmatricule'] = Variable<int>(IDMATRICULE.value);
    }
    if (IDORIGINE.present) {
      map['idorigine'] = Variable<int?>(IDORIGINE.value);
    }
    if (CODEMATRICULE.present) {
      map['codematricule'] = Variable<String>(CODEMATRICULE.value);
    }
    if (NOMMATRICULE.present) {
      map['nommatricule'] = Variable<String>(NOMMATRICULE.value);
    }
    if (PRENOMMATRICULE.present) {
      map['prenommatricule'] = Variable<String>(PRENOMMATRICULE.value);
    }
    if (CHECKED.present) {
      map['checked'] = Variable<bool?>(CHECKED.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatriculesCompanion(')
          ..write('IDMATRICULE: $IDMATRICULE, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('CODEMATRICULE: $CODEMATRICULE, ')
          ..write('NOMMATRICULE: $NOMMATRICULE, ')
          ..write('PRENOMMATRICULE: $PRENOMMATRICULE, ')
          ..write('CHECKED: $CHECKED')
          ..write(')'))
        .toString();
  }
}

class $MatriculesTable extends Matricules
    with TableInfo<$MatriculesTable, Matricule> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MatriculesTable(this._db, [this._alias]);
  final VerificationMeta _IDMATRICULEMeta =
      const VerificationMeta('IDMATRICULE');
  @override
  late final GeneratedColumn<int?> IDMATRICULE = GeneratedColumn<int?>(
      'idmatricule', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDORIGINEMeta = const VerificationMeta('IDORIGINE');
  @override
  late final GeneratedColumn<int?> IDORIGINE = GeneratedColumn<int?>(
      'idorigine', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Origines(IDORIGINE)');
  final VerificationMeta _CODEMATRICULEMeta =
      const VerificationMeta('CODEMATRICULE');
  @override
  late final GeneratedColumn<String?> CODEMATRICULE = GeneratedColumn<String?>(
      'codematricule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _NOMMATRICULEMeta =
      const VerificationMeta('NOMMATRICULE');
  @override
  late final GeneratedColumn<String?> NOMMATRICULE = GeneratedColumn<String?>(
      'nommatricule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _PRENOMMATRICULEMeta =
      const VerificationMeta('PRENOMMATRICULE');
  @override
  late final GeneratedColumn<String?> PRENOMMATRICULE =
      GeneratedColumn<String?>('prenommatricule', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _CHECKEDMeta = const VerificationMeta('CHECKED');
  @override
  late final GeneratedColumn<bool?> CHECKED = GeneratedColumn<bool?>(
      'checked', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (checked IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        IDMATRICULE,
        IDORIGINE,
        CODEMATRICULE,
        NOMMATRICULE,
        PRENOMMATRICULE,
        CHECKED
      ];
  @override
  String get aliasedName => _alias ?? 'matricules';
  @override
  String get actualTableName => 'matricules';
  @override
  VerificationContext validateIntegrity(Insertable<Matricule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idmatricule')) {
      context.handle(
          _IDMATRICULEMeta,
          IDMATRICULE.isAcceptableOrUnknown(
              data['idmatricule']!, _IDMATRICULEMeta));
    }
    if (data.containsKey('idorigine')) {
      context.handle(_IDORIGINEMeta,
          IDORIGINE.isAcceptableOrUnknown(data['idorigine']!, _IDORIGINEMeta));
    }
    if (data.containsKey('codematricule')) {
      context.handle(
          _CODEMATRICULEMeta,
          CODEMATRICULE.isAcceptableOrUnknown(
              data['codematricule']!, _CODEMATRICULEMeta));
    } else if (isInserting) {
      context.missing(_CODEMATRICULEMeta);
    }
    if (data.containsKey('nommatricule')) {
      context.handle(
          _NOMMATRICULEMeta,
          NOMMATRICULE.isAcceptableOrUnknown(
              data['nommatricule']!, _NOMMATRICULEMeta));
    } else if (isInserting) {
      context.missing(_NOMMATRICULEMeta);
    }
    if (data.containsKey('prenommatricule')) {
      context.handle(
          _PRENOMMATRICULEMeta,
          PRENOMMATRICULE.isAcceptableOrUnknown(
              data['prenommatricule']!, _PRENOMMATRICULEMeta));
    } else if (isInserting) {
      context.missing(_PRENOMMATRICULEMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(_CHECKEDMeta,
          CHECKED.isAcceptableOrUnknown(data['checked']!, _CHECKEDMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDMATRICULE};
  @override
  Matricule map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Matricule.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MatriculesTable createAlias(String alias) {
    return $MatriculesTable(_db, alias);
  }
}

class Origine extends DataClass implements Insertable<Origine> {
  final int IDORIGINE;
  final int? IDSITE;
  final String CODEORIGINE;
  final String LIBELLEORIGINE;
  Origine(
      {required this.IDORIGINE,
      this.IDSITE,
      required this.CODEORIGINE,
      required this.LIBELLEORIGINE});
  factory Origine.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Origine(
      IDORIGINE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idorigine'])!,
      IDSITE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idsite']),
      CODEORIGINE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codeorigine'])!,
      LIBELLEORIGINE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelleorigine'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idorigine'] = Variable<int>(IDORIGINE);
    if (!nullToAbsent || IDSITE != null) {
      map['idsite'] = Variable<int?>(IDSITE);
    }
    map['codeorigine'] = Variable<String>(CODEORIGINE);
    map['libelleorigine'] = Variable<String>(LIBELLEORIGINE);
    return map;
  }

  OriginesCompanion toCompanion(bool nullToAbsent) {
    return OriginesCompanion(
      IDORIGINE: Value(IDORIGINE),
      IDSITE:
          IDSITE == null && nullToAbsent ? const Value.absent() : Value(IDSITE),
      CODEORIGINE: Value(CODEORIGINE),
      LIBELLEORIGINE: Value(LIBELLEORIGINE),
    );
  }

  factory Origine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Origine(
      IDORIGINE: serializer.fromJson<int>(json['IDORIGINE']),
      IDSITE: serializer.fromJson<int?>(json['IDSITE']),
      CODEORIGINE: serializer.fromJson<String>(json['CODEORIGINE']),
      LIBELLEORIGINE: serializer.fromJson<String>(json['LIBELLEORIGINE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDORIGINE': serializer.toJson<int>(IDORIGINE),
      'IDSITE': serializer.toJson<int?>(IDSITE),
      'CODEORIGINE': serializer.toJson<String>(CODEORIGINE),
      'LIBELLEORIGINE': serializer.toJson<String>(LIBELLEORIGINE),
    };
  }

  Origine copyWith(
          {int? IDORIGINE,
          int? IDSITE,
          String? CODEORIGINE,
          String? LIBELLEORIGINE}) =>
      Origine(
        IDORIGINE: IDORIGINE ?? this.IDORIGINE,
        IDSITE: IDSITE ?? this.IDSITE,
        CODEORIGINE: CODEORIGINE ?? this.CODEORIGINE,
        LIBELLEORIGINE: LIBELLEORIGINE ?? this.LIBELLEORIGINE,
      );
  @override
  String toString() {
    return (StringBuffer('Origine(')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEORIGINE: $CODEORIGINE, ')
          ..write('LIBELLEORIGINE: $LIBELLEORIGINE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(IDORIGINE, IDSITE, CODEORIGINE, LIBELLEORIGINE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Origine &&
          other.IDORIGINE == this.IDORIGINE &&
          other.IDSITE == this.IDSITE &&
          other.CODEORIGINE == this.CODEORIGINE &&
          other.LIBELLEORIGINE == this.LIBELLEORIGINE);
}

class OriginesCompanion extends UpdateCompanion<Origine> {
  final Value<int> IDORIGINE;
  final Value<int?> IDSITE;
  final Value<String> CODEORIGINE;
  final Value<String> LIBELLEORIGINE;
  const OriginesCompanion({
    this.IDORIGINE = const Value.absent(),
    this.IDSITE = const Value.absent(),
    this.CODEORIGINE = const Value.absent(),
    this.LIBELLEORIGINE = const Value.absent(),
  });
  OriginesCompanion.insert({
    this.IDORIGINE = const Value.absent(),
    this.IDSITE = const Value.absent(),
    required String CODEORIGINE,
    required String LIBELLEORIGINE,
  })  : CODEORIGINE = Value(CODEORIGINE),
        LIBELLEORIGINE = Value(LIBELLEORIGINE);
  static Insertable<Origine> custom({
    Expression<int>? IDORIGINE,
    Expression<int?>? IDSITE,
    Expression<String>? CODEORIGINE,
    Expression<String>? LIBELLEORIGINE,
  }) {
    return RawValuesInsertable({
      if (IDORIGINE != null) 'idorigine': IDORIGINE,
      if (IDSITE != null) 'idsite': IDSITE,
      if (CODEORIGINE != null) 'codeorigine': CODEORIGINE,
      if (LIBELLEORIGINE != null) 'libelleorigine': LIBELLEORIGINE,
    });
  }

  OriginesCompanion copyWith(
      {Value<int>? IDORIGINE,
      Value<int?>? IDSITE,
      Value<String>? CODEORIGINE,
      Value<String>? LIBELLEORIGINE}) {
    return OriginesCompanion(
      IDORIGINE: IDORIGINE ?? this.IDORIGINE,
      IDSITE: IDSITE ?? this.IDSITE,
      CODEORIGINE: CODEORIGINE ?? this.CODEORIGINE,
      LIBELLEORIGINE: LIBELLEORIGINE ?? this.LIBELLEORIGINE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDORIGINE.present) {
      map['idorigine'] = Variable<int>(IDORIGINE.value);
    }
    if (IDSITE.present) {
      map['idsite'] = Variable<int?>(IDSITE.value);
    }
    if (CODEORIGINE.present) {
      map['codeorigine'] = Variable<String>(CODEORIGINE.value);
    }
    if (LIBELLEORIGINE.present) {
      map['libelleorigine'] = Variable<String>(LIBELLEORIGINE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OriginesCompanion(')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEORIGINE: $CODEORIGINE, ')
          ..write('LIBELLEORIGINE: $LIBELLEORIGINE')
          ..write(')'))
        .toString();
  }
}

class $OriginesTable extends Origines with TableInfo<$OriginesTable, Origine> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OriginesTable(this._db, [this._alias]);
  final VerificationMeta _IDORIGINEMeta = const VerificationMeta('IDORIGINE');
  @override
  late final GeneratedColumn<int?> IDORIGINE = GeneratedColumn<int?>(
      'idorigine', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDSITEMeta = const VerificationMeta('IDSITE');
  @override
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(IDSITE)');
  final VerificationMeta _CODEORIGINEMeta =
      const VerificationMeta('CODEORIGINE');
  @override
  late final GeneratedColumn<String?> CODEORIGINE = GeneratedColumn<String?>(
      'codeorigine', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLEORIGINEMeta =
      const VerificationMeta('LIBELLEORIGINE');
  @override
  late final GeneratedColumn<String?> LIBELLEORIGINE = GeneratedColumn<String?>(
      'libelleorigine', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDORIGINE, IDSITE, CODEORIGINE, LIBELLEORIGINE];
  @override
  String get aliasedName => _alias ?? 'origines';
  @override
  String get actualTableName => 'origines';
  @override
  VerificationContext validateIntegrity(Insertable<Origine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idorigine')) {
      context.handle(_IDORIGINEMeta,
          IDORIGINE.isAcceptableOrUnknown(data['idorigine']!, _IDORIGINEMeta));
    }
    if (data.containsKey('idsite')) {
      context.handle(_IDSITEMeta,
          IDSITE.isAcceptableOrUnknown(data['idsite']!, _IDSITEMeta));
    }
    if (data.containsKey('codeorigine')) {
      context.handle(
          _CODEORIGINEMeta,
          CODEORIGINE.isAcceptableOrUnknown(
              data['codeorigine']!, _CODEORIGINEMeta));
    } else if (isInserting) {
      context.missing(_CODEORIGINEMeta);
    }
    if (data.containsKey('libelleorigine')) {
      context.handle(
          _LIBELLEORIGINEMeta,
          LIBELLEORIGINE.isAcceptableOrUnknown(
              data['libelleorigine']!, _LIBELLEORIGINEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEORIGINEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDORIGINE};
  @override
  Origine map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Origine.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OriginesTable createAlias(String alias) {
    return $OriginesTable(_db, alias);
  }
}

class Ot extends DataClass implements Insertable<Ot> {
  final int IDOT;
  final int? IDORIGINE;
  final int? IDCATEGORIE;
  final int? IDEQUIPEMENT;
  final String CODEOT;
  final String LIBELLEOT;
  final String? COMMENTOT;
  final double? TEMPSOT;
  final String? STATUTOT;
  final DateTime? DTOPENOT;
  final DateTime? DTEXECOT;
  final DateTime? DTWAITOT;
  final DateTime? DTCANCOT;
  final DateTime? DTCLOSOT;
  Ot(
      {required this.IDOT,
      this.IDORIGINE,
      this.IDCATEGORIE,
      this.IDEQUIPEMENT,
      required this.CODEOT,
      required this.LIBELLEOT,
      this.COMMENTOT,
      this.TEMPSOT,
      this.STATUTOT,
      this.DTOPENOT,
      this.DTEXECOT,
      this.DTWAITOT,
      this.DTCANCOT,
      this.DTCLOSOT});
  factory Ot.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Ot(
      IDOT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idot'])!,
      IDORIGINE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idorigine']),
      IDCATEGORIE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idcategorie']),
      IDEQUIPEMENT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idequipement']),
      CODEOT: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codeot'])!,
      LIBELLEOT: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelleot'])!,
      COMMENTOT: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}commentot']),
      TEMPSOT: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tempsot']),
      STATUTOT: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statutot']),
      DTOPENOT: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dtopenot']),
      DTEXECOT: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dtexecot']),
      DTWAITOT: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dtwaitot']),
      DTCANCOT: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dtcancot']),
      DTCLOSOT: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dtclosot']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idot'] = Variable<int>(IDOT);
    if (!nullToAbsent || IDORIGINE != null) {
      map['idorigine'] = Variable<int?>(IDORIGINE);
    }
    if (!nullToAbsent || IDCATEGORIE != null) {
      map['idcategorie'] = Variable<int?>(IDCATEGORIE);
    }
    if (!nullToAbsent || IDEQUIPEMENT != null) {
      map['idequipement'] = Variable<int?>(IDEQUIPEMENT);
    }
    map['codeot'] = Variable<String>(CODEOT);
    map['libelleot'] = Variable<String>(LIBELLEOT);
    if (!nullToAbsent || COMMENTOT != null) {
      map['commentot'] = Variable<String?>(COMMENTOT);
    }
    if (!nullToAbsent || TEMPSOT != null) {
      map['tempsot'] = Variable<double?>(TEMPSOT);
    }
    if (!nullToAbsent || STATUTOT != null) {
      map['statutot'] = Variable<String?>(STATUTOT);
    }
    if (!nullToAbsent || DTOPENOT != null) {
      map['dtopenot'] = Variable<DateTime?>(DTOPENOT);
    }
    if (!nullToAbsent || DTEXECOT != null) {
      map['dtexecot'] = Variable<DateTime?>(DTEXECOT);
    }
    if (!nullToAbsent || DTWAITOT != null) {
      map['dtwaitot'] = Variable<DateTime?>(DTWAITOT);
    }
    if (!nullToAbsent || DTCANCOT != null) {
      map['dtcancot'] = Variable<DateTime?>(DTCANCOT);
    }
    if (!nullToAbsent || DTCLOSOT != null) {
      map['dtclosot'] = Variable<DateTime?>(DTCLOSOT);
    }
    return map;
  }

  OtsCompanion toCompanion(bool nullToAbsent) {
    return OtsCompanion(
      IDOT: Value(IDOT),
      IDORIGINE: IDORIGINE == null && nullToAbsent
          ? const Value.absent()
          : Value(IDORIGINE),
      IDCATEGORIE: IDCATEGORIE == null && nullToAbsent
          ? const Value.absent()
          : Value(IDCATEGORIE),
      IDEQUIPEMENT: IDEQUIPEMENT == null && nullToAbsent
          ? const Value.absent()
          : Value(IDEQUIPEMENT),
      CODEOT: Value(CODEOT),
      LIBELLEOT: Value(LIBELLEOT),
      COMMENTOT: COMMENTOT == null && nullToAbsent
          ? const Value.absent()
          : Value(COMMENTOT),
      TEMPSOT: TEMPSOT == null && nullToAbsent
          ? const Value.absent()
          : Value(TEMPSOT),
      STATUTOT: STATUTOT == null && nullToAbsent
          ? const Value.absent()
          : Value(STATUTOT),
      DTOPENOT: DTOPENOT == null && nullToAbsent
          ? const Value.absent()
          : Value(DTOPENOT),
      DTEXECOT: DTEXECOT == null && nullToAbsent
          ? const Value.absent()
          : Value(DTEXECOT),
      DTWAITOT: DTWAITOT == null && nullToAbsent
          ? const Value.absent()
          : Value(DTWAITOT),
      DTCANCOT: DTCANCOT == null && nullToAbsent
          ? const Value.absent()
          : Value(DTCANCOT),
      DTCLOSOT: DTCLOSOT == null && nullToAbsent
          ? const Value.absent()
          : Value(DTCLOSOT),
    );
  }

  factory Ot.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ot(
      IDOT: serializer.fromJson<int>(json['IDOT']),
      IDORIGINE: serializer.fromJson<int?>(json['IDORIGINE']),
      IDCATEGORIE: serializer.fromJson<int?>(json['IDCATEGORIE']),
      IDEQUIPEMENT: serializer.fromJson<int?>(json['IDEQUIPEMENT']),
      CODEOT: serializer.fromJson<String>(json['CODEOT']),
      LIBELLEOT: serializer.fromJson<String>(json['LIBELLEOT']),
      COMMENTOT: serializer.fromJson<String?>(json['COMMENTOT']),
      TEMPSOT: serializer.fromJson<double?>(json['TEMPSOT']),
      STATUTOT: serializer.fromJson<String?>(json['STATUTOT']),
      DTOPENOT: serializer.fromJson<DateTime?>(json['DTOPENOT']),
      DTEXECOT: serializer.fromJson<DateTime?>(json['DTEXECOT']),
      DTWAITOT: serializer.fromJson<DateTime?>(json['DTWAITOT']),
      DTCANCOT: serializer.fromJson<DateTime?>(json['DTCANCOT']),
      DTCLOSOT: serializer.fromJson<DateTime?>(json['DTCLOSOT']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDOT': serializer.toJson<int>(IDOT),
      'IDORIGINE': serializer.toJson<int?>(IDORIGINE),
      'IDCATEGORIE': serializer.toJson<int?>(IDCATEGORIE),
      'IDEQUIPEMENT': serializer.toJson<int?>(IDEQUIPEMENT),
      'CODEOT': serializer.toJson<String>(CODEOT),
      'LIBELLEOT': serializer.toJson<String>(LIBELLEOT),
      'COMMENTOT': serializer.toJson<String?>(COMMENTOT),
      'TEMPSOT': serializer.toJson<double?>(TEMPSOT),
      'STATUTOT': serializer.toJson<String?>(STATUTOT),
      'DTOPENOT': serializer.toJson<DateTime?>(DTOPENOT),
      'DTEXECOT': serializer.toJson<DateTime?>(DTEXECOT),
      'DTWAITOT': serializer.toJson<DateTime?>(DTWAITOT),
      'DTCANCOT': serializer.toJson<DateTime?>(DTCANCOT),
      'DTCLOSOT': serializer.toJson<DateTime?>(DTCLOSOT),
    };
  }

  Ot copyWith(
          {int? IDOT,
          int? IDORIGINE,
          int? IDCATEGORIE,
          int? IDEQUIPEMENT,
          String? CODEOT,
          String? LIBELLEOT,
          String? COMMENTOT,
          double? TEMPSOT,
          String? STATUTOT,
          DateTime? DTOPENOT,
          DateTime? DTEXECOT,
          DateTime? DTWAITOT,
          DateTime? DTCANCOT,
          DateTime? DTCLOSOT}) =>
      Ot(
        IDOT: IDOT ?? this.IDOT,
        IDORIGINE: IDORIGINE ?? this.IDORIGINE,
        IDCATEGORIE: IDCATEGORIE ?? this.IDCATEGORIE,
        IDEQUIPEMENT: IDEQUIPEMENT ?? this.IDEQUIPEMENT,
        CODEOT: CODEOT ?? this.CODEOT,
        LIBELLEOT: LIBELLEOT ?? this.LIBELLEOT,
        COMMENTOT: COMMENTOT ?? this.COMMENTOT,
        TEMPSOT: TEMPSOT ?? this.TEMPSOT,
        STATUTOT: STATUTOT ?? this.STATUTOT,
        DTOPENOT: DTOPENOT ?? this.DTOPENOT,
        DTEXECOT: DTEXECOT ?? this.DTEXECOT,
        DTWAITOT: DTWAITOT ?? this.DTWAITOT,
        DTCANCOT: DTCANCOT ?? this.DTCANCOT,
        DTCLOSOT: DTCLOSOT ?? this.DTCLOSOT,
      );
  @override
  String toString() {
    return (StringBuffer('Ot(')
          ..write('IDOT: $IDOT, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('IDCATEGORIE: $IDCATEGORIE, ')
          ..write('IDEQUIPEMENT: $IDEQUIPEMENT, ')
          ..write('CODEOT: $CODEOT, ')
          ..write('LIBELLEOT: $LIBELLEOT, ')
          ..write('COMMENTOT: $COMMENTOT, ')
          ..write('TEMPSOT: $TEMPSOT, ')
          ..write('STATUTOT: $STATUTOT, ')
          ..write('DTOPENOT: $DTOPENOT, ')
          ..write('DTEXECOT: $DTEXECOT, ')
          ..write('DTWAITOT: $DTWAITOT, ')
          ..write('DTCANCOT: $DTCANCOT, ')
          ..write('DTCLOSOT: $DTCLOSOT')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      IDOT,
      IDORIGINE,
      IDCATEGORIE,
      IDEQUIPEMENT,
      CODEOT,
      LIBELLEOT,
      COMMENTOT,
      TEMPSOT,
      STATUTOT,
      DTOPENOT,
      DTEXECOT,
      DTWAITOT,
      DTCANCOT,
      DTCLOSOT);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ot &&
          other.IDOT == this.IDOT &&
          other.IDORIGINE == this.IDORIGINE &&
          other.IDCATEGORIE == this.IDCATEGORIE &&
          other.IDEQUIPEMENT == this.IDEQUIPEMENT &&
          other.CODEOT == this.CODEOT &&
          other.LIBELLEOT == this.LIBELLEOT &&
          other.COMMENTOT == this.COMMENTOT &&
          other.TEMPSOT == this.TEMPSOT &&
          other.STATUTOT == this.STATUTOT &&
          other.DTOPENOT == this.DTOPENOT &&
          other.DTEXECOT == this.DTEXECOT &&
          other.DTWAITOT == this.DTWAITOT &&
          other.DTCANCOT == this.DTCANCOT &&
          other.DTCLOSOT == this.DTCLOSOT);
}

class OtsCompanion extends UpdateCompanion<Ot> {
  final Value<int> IDOT;
  final Value<int?> IDORIGINE;
  final Value<int?> IDCATEGORIE;
  final Value<int?> IDEQUIPEMENT;
  final Value<String> CODEOT;
  final Value<String> LIBELLEOT;
  final Value<String?> COMMENTOT;
  final Value<double?> TEMPSOT;
  final Value<String?> STATUTOT;
  final Value<DateTime?> DTOPENOT;
  final Value<DateTime?> DTEXECOT;
  final Value<DateTime?> DTWAITOT;
  final Value<DateTime?> DTCANCOT;
  final Value<DateTime?> DTCLOSOT;
  const OtsCompanion({
    this.IDOT = const Value.absent(),
    this.IDORIGINE = const Value.absent(),
    this.IDCATEGORIE = const Value.absent(),
    this.IDEQUIPEMENT = const Value.absent(),
    this.CODEOT = const Value.absent(),
    this.LIBELLEOT = const Value.absent(),
    this.COMMENTOT = const Value.absent(),
    this.TEMPSOT = const Value.absent(),
    this.STATUTOT = const Value.absent(),
    this.DTOPENOT = const Value.absent(),
    this.DTEXECOT = const Value.absent(),
    this.DTWAITOT = const Value.absent(),
    this.DTCANCOT = const Value.absent(),
    this.DTCLOSOT = const Value.absent(),
  });
  OtsCompanion.insert({
    this.IDOT = const Value.absent(),
    this.IDORIGINE = const Value.absent(),
    this.IDCATEGORIE = const Value.absent(),
    this.IDEQUIPEMENT = const Value.absent(),
    required String CODEOT,
    required String LIBELLEOT,
    this.COMMENTOT = const Value.absent(),
    this.TEMPSOT = const Value.absent(),
    this.STATUTOT = const Value.absent(),
    this.DTOPENOT = const Value.absent(),
    this.DTEXECOT = const Value.absent(),
    this.DTWAITOT = const Value.absent(),
    this.DTCANCOT = const Value.absent(),
    this.DTCLOSOT = const Value.absent(),
  })  : CODEOT = Value(CODEOT),
        LIBELLEOT = Value(LIBELLEOT);
  static Insertable<Ot> custom({
    Expression<int>? IDOT,
    Expression<int?>? IDORIGINE,
    Expression<int?>? IDCATEGORIE,
    Expression<int?>? IDEQUIPEMENT,
    Expression<String>? CODEOT,
    Expression<String>? LIBELLEOT,
    Expression<String?>? COMMENTOT,
    Expression<double?>? TEMPSOT,
    Expression<String?>? STATUTOT,
    Expression<DateTime?>? DTOPENOT,
    Expression<DateTime?>? DTEXECOT,
    Expression<DateTime?>? DTWAITOT,
    Expression<DateTime?>? DTCANCOT,
    Expression<DateTime?>? DTCLOSOT,
  }) {
    return RawValuesInsertable({
      if (IDOT != null) 'idot': IDOT,
      if (IDORIGINE != null) 'idorigine': IDORIGINE,
      if (IDCATEGORIE != null) 'idcategorie': IDCATEGORIE,
      if (IDEQUIPEMENT != null) 'idequipement': IDEQUIPEMENT,
      if (CODEOT != null) 'codeot': CODEOT,
      if (LIBELLEOT != null) 'libelleot': LIBELLEOT,
      if (COMMENTOT != null) 'commentot': COMMENTOT,
      if (TEMPSOT != null) 'tempsot': TEMPSOT,
      if (STATUTOT != null) 'statutot': STATUTOT,
      if (DTOPENOT != null) 'dtopenot': DTOPENOT,
      if (DTEXECOT != null) 'dtexecot': DTEXECOT,
      if (DTWAITOT != null) 'dtwaitot': DTWAITOT,
      if (DTCANCOT != null) 'dtcancot': DTCANCOT,
      if (DTCLOSOT != null) 'dtclosot': DTCLOSOT,
    });
  }

  OtsCompanion copyWith(
      {Value<int>? IDOT,
      Value<int?>? IDORIGINE,
      Value<int?>? IDCATEGORIE,
      Value<int?>? IDEQUIPEMENT,
      Value<String>? CODEOT,
      Value<String>? LIBELLEOT,
      Value<String?>? COMMENTOT,
      Value<double?>? TEMPSOT,
      Value<String?>? STATUTOT,
      Value<DateTime?>? DTOPENOT,
      Value<DateTime?>? DTEXECOT,
      Value<DateTime?>? DTWAITOT,
      Value<DateTime?>? DTCANCOT,
      Value<DateTime?>? DTCLOSOT}) {
    return OtsCompanion(
      IDOT: IDOT ?? this.IDOT,
      IDORIGINE: IDORIGINE ?? this.IDORIGINE,
      IDCATEGORIE: IDCATEGORIE ?? this.IDCATEGORIE,
      IDEQUIPEMENT: IDEQUIPEMENT ?? this.IDEQUIPEMENT,
      CODEOT: CODEOT ?? this.CODEOT,
      LIBELLEOT: LIBELLEOT ?? this.LIBELLEOT,
      COMMENTOT: COMMENTOT ?? this.COMMENTOT,
      TEMPSOT: TEMPSOT ?? this.TEMPSOT,
      STATUTOT: STATUTOT ?? this.STATUTOT,
      DTOPENOT: DTOPENOT ?? this.DTOPENOT,
      DTEXECOT: DTEXECOT ?? this.DTEXECOT,
      DTWAITOT: DTWAITOT ?? this.DTWAITOT,
      DTCANCOT: DTCANCOT ?? this.DTCANCOT,
      DTCLOSOT: DTCLOSOT ?? this.DTCLOSOT,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDOT.present) {
      map['idot'] = Variable<int>(IDOT.value);
    }
    if (IDORIGINE.present) {
      map['idorigine'] = Variable<int?>(IDORIGINE.value);
    }
    if (IDCATEGORIE.present) {
      map['idcategorie'] = Variable<int?>(IDCATEGORIE.value);
    }
    if (IDEQUIPEMENT.present) {
      map['idequipement'] = Variable<int?>(IDEQUIPEMENT.value);
    }
    if (CODEOT.present) {
      map['codeot'] = Variable<String>(CODEOT.value);
    }
    if (LIBELLEOT.present) {
      map['libelleot'] = Variable<String>(LIBELLEOT.value);
    }
    if (COMMENTOT.present) {
      map['commentot'] = Variable<String?>(COMMENTOT.value);
    }
    if (TEMPSOT.present) {
      map['tempsot'] = Variable<double?>(TEMPSOT.value);
    }
    if (STATUTOT.present) {
      map['statutot'] = Variable<String?>(STATUTOT.value);
    }
    if (DTOPENOT.present) {
      map['dtopenot'] = Variable<DateTime?>(DTOPENOT.value);
    }
    if (DTEXECOT.present) {
      map['dtexecot'] = Variable<DateTime?>(DTEXECOT.value);
    }
    if (DTWAITOT.present) {
      map['dtwaitot'] = Variable<DateTime?>(DTWAITOT.value);
    }
    if (DTCANCOT.present) {
      map['dtcancot'] = Variable<DateTime?>(DTCANCOT.value);
    }
    if (DTCLOSOT.present) {
      map['dtclosot'] = Variable<DateTime?>(DTCLOSOT.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtsCompanion(')
          ..write('IDOT: $IDOT, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('IDCATEGORIE: $IDCATEGORIE, ')
          ..write('IDEQUIPEMENT: $IDEQUIPEMENT, ')
          ..write('CODEOT: $CODEOT, ')
          ..write('LIBELLEOT: $LIBELLEOT, ')
          ..write('COMMENTOT: $COMMENTOT, ')
          ..write('TEMPSOT: $TEMPSOT, ')
          ..write('STATUTOT: $STATUTOT, ')
          ..write('DTOPENOT: $DTOPENOT, ')
          ..write('DTEXECOT: $DTEXECOT, ')
          ..write('DTWAITOT: $DTWAITOT, ')
          ..write('DTCANCOT: $DTCANCOT, ')
          ..write('DTCLOSOT: $DTCLOSOT')
          ..write(')'))
        .toString();
  }
}

class $OtsTable extends Ots with TableInfo<$OtsTable, Ot> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OtsTable(this._db, [this._alias]);
  final VerificationMeta _IDOTMeta = const VerificationMeta('IDOT');
  @override
  late final GeneratedColumn<int?> IDOT = GeneratedColumn<int?>(
      'idot', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDORIGINEMeta = const VerificationMeta('IDORIGINE');
  @override
  late final GeneratedColumn<int?> IDORIGINE = GeneratedColumn<int?>(
      'idorigine', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Origines(IDORIGINE)');
  final VerificationMeta _IDCATEGORIEMeta =
      const VerificationMeta('IDCATEGORIE');
  @override
  late final GeneratedColumn<int?> IDCATEGORIE = GeneratedColumn<int?>(
      'idcategorie', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Categories(IDCATEGORIE)');
  final VerificationMeta _IDEQUIPEMENTMeta =
      const VerificationMeta('IDEQUIPEMENT');
  @override
  late final GeneratedColumn<int?> IDEQUIPEMENT = GeneratedColumn<int?>(
      'idequipement', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Equipements(IDEQUIPEMENT)');
  final VerificationMeta _CODEOTMeta = const VerificationMeta('CODEOT');
  @override
  late final GeneratedColumn<String?> CODEOT = GeneratedColumn<String?>(
      'codeot', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLEOTMeta = const VerificationMeta('LIBELLEOT');
  @override
  late final GeneratedColumn<String?> LIBELLEOT = GeneratedColumn<String?>(
      'libelleot', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _COMMENTOTMeta = const VerificationMeta('COMMENTOT');
  @override
  late final GeneratedColumn<String?> COMMENTOT = GeneratedColumn<String?>(
      'commentot', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2048),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _TEMPSOTMeta = const VerificationMeta('TEMPSOT');
  @override
  late final GeneratedColumn<double?> TEMPSOT = GeneratedColumn<double?>(
      'tempsot', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _STATUTOTMeta = const VerificationMeta('STATUTOT');
  @override
  late final GeneratedColumn<String?> STATUTOT = GeneratedColumn<String?>(
      'statutot', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 1),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _DTOPENOTMeta = const VerificationMeta('DTOPENOT');
  @override
  late final GeneratedColumn<DateTime?> DTOPENOT = GeneratedColumn<DateTime?>(
      'dtopenot', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _DTEXECOTMeta = const VerificationMeta('DTEXECOT');
  @override
  late final GeneratedColumn<DateTime?> DTEXECOT = GeneratedColumn<DateTime?>(
      'dtexecot', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _DTWAITOTMeta = const VerificationMeta('DTWAITOT');
  @override
  late final GeneratedColumn<DateTime?> DTWAITOT = GeneratedColumn<DateTime?>(
      'dtwaitot', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _DTCANCOTMeta = const VerificationMeta('DTCANCOT');
  @override
  late final GeneratedColumn<DateTime?> DTCANCOT = GeneratedColumn<DateTime?>(
      'dtcancot', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _DTCLOSOTMeta = const VerificationMeta('DTCLOSOT');
  @override
  late final GeneratedColumn<DateTime?> DTCLOSOT = GeneratedColumn<DateTime?>(
      'dtclosot', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        IDOT,
        IDORIGINE,
        IDCATEGORIE,
        IDEQUIPEMENT,
        CODEOT,
        LIBELLEOT,
        COMMENTOT,
        TEMPSOT,
        STATUTOT,
        DTOPENOT,
        DTEXECOT,
        DTWAITOT,
        DTCANCOT,
        DTCLOSOT
      ];
  @override
  String get aliasedName => _alias ?? 'ots';
  @override
  String get actualTableName => 'ots';
  @override
  VerificationContext validateIntegrity(Insertable<Ot> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idot')) {
      context.handle(
          _IDOTMeta, IDOT.isAcceptableOrUnknown(data['idot']!, _IDOTMeta));
    }
    if (data.containsKey('idorigine')) {
      context.handle(_IDORIGINEMeta,
          IDORIGINE.isAcceptableOrUnknown(data['idorigine']!, _IDORIGINEMeta));
    }
    if (data.containsKey('idcategorie')) {
      context.handle(
          _IDCATEGORIEMeta,
          IDCATEGORIE.isAcceptableOrUnknown(
              data['idcategorie']!, _IDCATEGORIEMeta));
    }
    if (data.containsKey('idequipement')) {
      context.handle(
          _IDEQUIPEMENTMeta,
          IDEQUIPEMENT.isAcceptableOrUnknown(
              data['idequipement']!, _IDEQUIPEMENTMeta));
    }
    if (data.containsKey('codeot')) {
      context.handle(_CODEOTMeta,
          CODEOT.isAcceptableOrUnknown(data['codeot']!, _CODEOTMeta));
    } else if (isInserting) {
      context.missing(_CODEOTMeta);
    }
    if (data.containsKey('libelleot')) {
      context.handle(_LIBELLEOTMeta,
          LIBELLEOT.isAcceptableOrUnknown(data['libelleot']!, _LIBELLEOTMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEOTMeta);
    }
    if (data.containsKey('commentot')) {
      context.handle(_COMMENTOTMeta,
          COMMENTOT.isAcceptableOrUnknown(data['commentot']!, _COMMENTOTMeta));
    }
    if (data.containsKey('tempsot')) {
      context.handle(_TEMPSOTMeta,
          TEMPSOT.isAcceptableOrUnknown(data['tempsot']!, _TEMPSOTMeta));
    }
    if (data.containsKey('statutot')) {
      context.handle(_STATUTOTMeta,
          STATUTOT.isAcceptableOrUnknown(data['statutot']!, _STATUTOTMeta));
    }
    if (data.containsKey('dtopenot')) {
      context.handle(_DTOPENOTMeta,
          DTOPENOT.isAcceptableOrUnknown(data['dtopenot']!, _DTOPENOTMeta));
    }
    if (data.containsKey('dtexecot')) {
      context.handle(_DTEXECOTMeta,
          DTEXECOT.isAcceptableOrUnknown(data['dtexecot']!, _DTEXECOTMeta));
    }
    if (data.containsKey('dtwaitot')) {
      context.handle(_DTWAITOTMeta,
          DTWAITOT.isAcceptableOrUnknown(data['dtwaitot']!, _DTWAITOTMeta));
    }
    if (data.containsKey('dtcancot')) {
      context.handle(_DTCANCOTMeta,
          DTCANCOT.isAcceptableOrUnknown(data['dtcancot']!, _DTCANCOTMeta));
    }
    if (data.containsKey('dtclosot')) {
      context.handle(_DTCLOSOTMeta,
          DTCLOSOT.isAcceptableOrUnknown(data['dtclosot']!, _DTCLOSOTMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDOT};
  @override
  Ot map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Ot.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OtsTable createAlias(String alias) {
    return $OtsTable(_db, alias);
  }
}

class Reservation extends DataClass implements Insertable<Reservation> {
  final int IDPIECE;
  final int? IDOT;
  final String? CODEARTICLE;
  final String LIBELLEARTICLE;
  final int QTEARTICLE;
  final int IDARTICLE;
  Reservation(
      {required this.IDPIECE,
      this.IDOT,
      this.CODEARTICLE,
      required this.LIBELLEARTICLE,
      required this.QTEARTICLE,
      required this.IDARTICLE});
  factory Reservation.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Reservation(
      IDPIECE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idpiece'])!,
      IDOT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idot']),
      CODEARTICLE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codearticle']),
      LIBELLEARTICLE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libellearticle'])!,
      QTEARTICLE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qtearticle'])!,
      IDARTICLE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idarticle'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idpiece'] = Variable<int>(IDPIECE);
    if (!nullToAbsent || IDOT != null) {
      map['idot'] = Variable<int?>(IDOT);
    }
    if (!nullToAbsent || CODEARTICLE != null) {
      map['codearticle'] = Variable<String?>(CODEARTICLE);
    }
    map['libellearticle'] = Variable<String>(LIBELLEARTICLE);
    map['qtearticle'] = Variable<int>(QTEARTICLE);
    map['idarticle'] = Variable<int>(IDARTICLE);
    return map;
  }

  ReservationsCompanion toCompanion(bool nullToAbsent) {
    return ReservationsCompanion(
      IDPIECE: Value(IDPIECE),
      IDOT: IDOT == null && nullToAbsent ? const Value.absent() : Value(IDOT),
      CODEARTICLE: CODEARTICLE == null && nullToAbsent
          ? const Value.absent()
          : Value(CODEARTICLE),
      LIBELLEARTICLE: Value(LIBELLEARTICLE),
      QTEARTICLE: Value(QTEARTICLE),
      IDARTICLE: Value(IDARTICLE),
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reservation(
      IDPIECE: serializer.fromJson<int>(json['IDPIECE']),
      IDOT: serializer.fromJson<int?>(json['IDOT']),
      CODEARTICLE: serializer.fromJson<String?>(json['CODEARTICLE']),
      LIBELLEARTICLE: serializer.fromJson<String>(json['LIBELLEARTICLE']),
      QTEARTICLE: serializer.fromJson<int>(json['QTEARTICLE']),
      IDARTICLE: serializer.fromJson<int>(json['IDARTICLE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDPIECE': serializer.toJson<int>(IDPIECE),
      'IDOT': serializer.toJson<int?>(IDOT),
      'CODEARTICLE': serializer.toJson<String?>(CODEARTICLE),
      'LIBELLEARTICLE': serializer.toJson<String>(LIBELLEARTICLE),
      'QTEARTICLE': serializer.toJson<int>(QTEARTICLE),
      'IDARTICLE': serializer.toJson<int>(IDARTICLE),
    };
  }

  Reservation copyWith(
          {int? IDPIECE,
          int? IDOT,
          String? CODEARTICLE,
          String? LIBELLEARTICLE,
          int? QTEARTICLE,
          int? IDARTICLE}) =>
      Reservation(
        IDPIECE: IDPIECE ?? this.IDPIECE,
        IDOT: IDOT ?? this.IDOT,
        CODEARTICLE: CODEARTICLE ?? this.CODEARTICLE,
        LIBELLEARTICLE: LIBELLEARTICLE ?? this.LIBELLEARTICLE,
        QTEARTICLE: QTEARTICLE ?? this.QTEARTICLE,
        IDARTICLE: IDARTICLE ?? this.IDARTICLE,
      );
  @override
  String toString() {
    return (StringBuffer('Reservation(')
          ..write('IDPIECE: $IDPIECE, ')
          ..write('IDOT: $IDOT, ')
          ..write('CODEARTICLE: $CODEARTICLE, ')
          ..write('LIBELLEARTICLE: $LIBELLEARTICLE, ')
          ..write('QTEARTICLE: $QTEARTICLE, ')
          ..write('IDARTICLE: $IDARTICLE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      IDPIECE, IDOT, CODEARTICLE, LIBELLEARTICLE, QTEARTICLE, IDARTICLE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reservation &&
          other.IDPIECE == this.IDPIECE &&
          other.IDOT == this.IDOT &&
          other.CODEARTICLE == this.CODEARTICLE &&
          other.LIBELLEARTICLE == this.LIBELLEARTICLE &&
          other.QTEARTICLE == this.QTEARTICLE &&
          other.IDARTICLE == this.IDARTICLE);
}

class ReservationsCompanion extends UpdateCompanion<Reservation> {
  final Value<int> IDPIECE;
  final Value<int?> IDOT;
  final Value<String?> CODEARTICLE;
  final Value<String> LIBELLEARTICLE;
  final Value<int> QTEARTICLE;
  final Value<int> IDARTICLE;
  const ReservationsCompanion({
    this.IDPIECE = const Value.absent(),
    this.IDOT = const Value.absent(),
    this.CODEARTICLE = const Value.absent(),
    this.LIBELLEARTICLE = const Value.absent(),
    this.QTEARTICLE = const Value.absent(),
    this.IDARTICLE = const Value.absent(),
  });
  ReservationsCompanion.insert({
    this.IDPIECE = const Value.absent(),
    this.IDOT = const Value.absent(),
    this.CODEARTICLE = const Value.absent(),
    required String LIBELLEARTICLE,
    required int QTEARTICLE,
    required int IDARTICLE,
  })  : LIBELLEARTICLE = Value(LIBELLEARTICLE),
        QTEARTICLE = Value(QTEARTICLE),
        IDARTICLE = Value(IDARTICLE);
  static Insertable<Reservation> custom({
    Expression<int>? IDPIECE,
    Expression<int?>? IDOT,
    Expression<String?>? CODEARTICLE,
    Expression<String>? LIBELLEARTICLE,
    Expression<int>? QTEARTICLE,
    Expression<int>? IDARTICLE,
  }) {
    return RawValuesInsertable({
      if (IDPIECE != null) 'idpiece': IDPIECE,
      if (IDOT != null) 'idot': IDOT,
      if (CODEARTICLE != null) 'codearticle': CODEARTICLE,
      if (LIBELLEARTICLE != null) 'libellearticle': LIBELLEARTICLE,
      if (QTEARTICLE != null) 'qtearticle': QTEARTICLE,
      if (IDARTICLE != null) 'idarticle': IDARTICLE,
    });
  }

  ReservationsCompanion copyWith(
      {Value<int>? IDPIECE,
      Value<int?>? IDOT,
      Value<String?>? CODEARTICLE,
      Value<String>? LIBELLEARTICLE,
      Value<int>? QTEARTICLE,
      Value<int>? IDARTICLE}) {
    return ReservationsCompanion(
      IDPIECE: IDPIECE ?? this.IDPIECE,
      IDOT: IDOT ?? this.IDOT,
      CODEARTICLE: CODEARTICLE ?? this.CODEARTICLE,
      LIBELLEARTICLE: LIBELLEARTICLE ?? this.LIBELLEARTICLE,
      QTEARTICLE: QTEARTICLE ?? this.QTEARTICLE,
      IDARTICLE: IDARTICLE ?? this.IDARTICLE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDPIECE.present) {
      map['idpiece'] = Variable<int>(IDPIECE.value);
    }
    if (IDOT.present) {
      map['idot'] = Variable<int?>(IDOT.value);
    }
    if (CODEARTICLE.present) {
      map['codearticle'] = Variable<String?>(CODEARTICLE.value);
    }
    if (LIBELLEARTICLE.present) {
      map['libellearticle'] = Variable<String>(LIBELLEARTICLE.value);
    }
    if (QTEARTICLE.present) {
      map['qtearticle'] = Variable<int>(QTEARTICLE.value);
    }
    if (IDARTICLE.present) {
      map['idarticle'] = Variable<int>(IDARTICLE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsCompanion(')
          ..write('IDPIECE: $IDPIECE, ')
          ..write('IDOT: $IDOT, ')
          ..write('CODEARTICLE: $CODEARTICLE, ')
          ..write('LIBELLEARTICLE: $LIBELLEARTICLE, ')
          ..write('QTEARTICLE: $QTEARTICLE, ')
          ..write('IDARTICLE: $IDARTICLE')
          ..write(')'))
        .toString();
  }
}

class $ReservationsTable extends Reservations
    with TableInfo<$ReservationsTable, Reservation> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ReservationsTable(this._db, [this._alias]);
  final VerificationMeta _IDPIECEMeta = const VerificationMeta('IDPIECE');
  @override
  late final GeneratedColumn<int?> IDPIECE = GeneratedColumn<int?>(
      'idpiece', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _IDOTMeta = const VerificationMeta('IDOT');
  @override
  late final GeneratedColumn<int?> IDOT = GeneratedColumn<int?>(
      'idot', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(IDOT)');
  final VerificationMeta _CODEARTICLEMeta =
      const VerificationMeta('CODEARTICLE');
  @override
  late final GeneratedColumn<String?> CODEARTICLE = GeneratedColumn<String?>(
      'codearticle', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Articles(IDARTICLE)');
  final VerificationMeta _LIBELLEARTICLEMeta =
      const VerificationMeta('LIBELLEARTICLE');
  @override
  late final GeneratedColumn<String?> LIBELLEARTICLE = GeneratedColumn<String?>(
      'libellearticle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _QTEARTICLEMeta = const VerificationMeta('QTEARTICLE');
  @override
  late final GeneratedColumn<int?> QTEARTICLE = GeneratedColumn<int?>(
      'qtearticle', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _IDARTICLEMeta = const VerificationMeta('IDARTICLE');
  @override
  late final GeneratedColumn<int?> IDARTICLE = GeneratedColumn<int?>(
      'idarticle', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDPIECE, IDOT, CODEARTICLE, LIBELLEARTICLE, QTEARTICLE, IDARTICLE];
  @override
  String get aliasedName => _alias ?? 'reservations';
  @override
  String get actualTableName => 'reservations';
  @override
  VerificationContext validateIntegrity(Insertable<Reservation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idpiece')) {
      context.handle(_IDPIECEMeta,
          IDPIECE.isAcceptableOrUnknown(data['idpiece']!, _IDPIECEMeta));
    }
    if (data.containsKey('idot')) {
      context.handle(
          _IDOTMeta, IDOT.isAcceptableOrUnknown(data['idot']!, _IDOTMeta));
    }
    if (data.containsKey('codearticle')) {
      context.handle(
          _CODEARTICLEMeta,
          CODEARTICLE.isAcceptableOrUnknown(
              data['codearticle']!, _CODEARTICLEMeta));
    }
    if (data.containsKey('libellearticle')) {
      context.handle(
          _LIBELLEARTICLEMeta,
          LIBELLEARTICLE.isAcceptableOrUnknown(
              data['libellearticle']!, _LIBELLEARTICLEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEARTICLEMeta);
    }
    if (data.containsKey('qtearticle')) {
      context.handle(
          _QTEARTICLEMeta,
          QTEARTICLE.isAcceptableOrUnknown(
              data['qtearticle']!, _QTEARTICLEMeta));
    } else if (isInserting) {
      context.missing(_QTEARTICLEMeta);
    }
    if (data.containsKey('idarticle')) {
      context.handle(_IDARTICLEMeta,
          IDARTICLE.isAcceptableOrUnknown(data['idarticle']!, _IDARTICLEMeta));
    } else if (isInserting) {
      context.missing(_IDARTICLEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDPIECE};
  @override
  Reservation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Reservation.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReservationsTable createAlias(String alias) {
    return $ReservationsTable(_db, alias);
  }
}

class Site extends DataClass implements Insertable<Site> {
  final int IDSITE;
  final String CODESITE;
  final String NOMSITE;
  final String ADRESSESITE;
  Site(
      {required this.IDSITE,
      required this.CODESITE,
      required this.NOMSITE,
      required this.ADRESSESITE});
  factory Site.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Site(
      IDSITE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idsite'])!,
      CODESITE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codesite'])!,
      NOMSITE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nomsite'])!,
      ADRESSESITE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adressesite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idsite'] = Variable<int>(IDSITE);
    map['codesite'] = Variable<String>(CODESITE);
    map['nomsite'] = Variable<String>(NOMSITE);
    map['adressesite'] = Variable<String>(ADRESSESITE);
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      IDSITE: Value(IDSITE),
      CODESITE: Value(CODESITE),
      NOMSITE: Value(NOMSITE),
      ADRESSESITE: Value(ADRESSESITE),
    );
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Site(
      IDSITE: serializer.fromJson<int>(json['IDSITE']),
      CODESITE: serializer.fromJson<String>(json['CODESITE']),
      NOMSITE: serializer.fromJson<String>(json['NOMSITE']),
      ADRESSESITE: serializer.fromJson<String>(json['ADRESSESITE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDSITE': serializer.toJson<int>(IDSITE),
      'CODESITE': serializer.toJson<String>(CODESITE),
      'NOMSITE': serializer.toJson<String>(NOMSITE),
      'ADRESSESITE': serializer.toJson<String>(ADRESSESITE),
    };
  }

  Site copyWith(
          {int? IDSITE,
          String? CODESITE,
          String? NOMSITE,
          String? ADRESSESITE}) =>
      Site(
        IDSITE: IDSITE ?? this.IDSITE,
        CODESITE: CODESITE ?? this.CODESITE,
        NOMSITE: NOMSITE ?? this.NOMSITE,
        ADRESSESITE: ADRESSESITE ?? this.ADRESSESITE,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODESITE: $CODESITE, ')
          ..write('NOMSITE: $NOMSITE, ')
          ..write('ADRESSESITE: $ADRESSESITE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(IDSITE, CODESITE, NOMSITE, ADRESSESITE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Site &&
          other.IDSITE == this.IDSITE &&
          other.CODESITE == this.CODESITE &&
          other.NOMSITE == this.NOMSITE &&
          other.ADRESSESITE == this.ADRESSESITE);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int> IDSITE;
  final Value<String> CODESITE;
  final Value<String> NOMSITE;
  final Value<String> ADRESSESITE;
  const SitesCompanion({
    this.IDSITE = const Value.absent(),
    this.CODESITE = const Value.absent(),
    this.NOMSITE = const Value.absent(),
    this.ADRESSESITE = const Value.absent(),
  });
  SitesCompanion.insert({
    this.IDSITE = const Value.absent(),
    required String CODESITE,
    required String NOMSITE,
    required String ADRESSESITE,
  })  : CODESITE = Value(CODESITE),
        NOMSITE = Value(NOMSITE),
        ADRESSESITE = Value(ADRESSESITE);
  static Insertable<Site> custom({
    Expression<int>? IDSITE,
    Expression<String>? CODESITE,
    Expression<String>? NOMSITE,
    Expression<String>? ADRESSESITE,
  }) {
    return RawValuesInsertable({
      if (IDSITE != null) 'idsite': IDSITE,
      if (CODESITE != null) 'codesite': CODESITE,
      if (NOMSITE != null) 'nomsite': NOMSITE,
      if (ADRESSESITE != null) 'adressesite': ADRESSESITE,
    });
  }

  SitesCompanion copyWith(
      {Value<int>? IDSITE,
      Value<String>? CODESITE,
      Value<String>? NOMSITE,
      Value<String>? ADRESSESITE}) {
    return SitesCompanion(
      IDSITE: IDSITE ?? this.IDSITE,
      CODESITE: CODESITE ?? this.CODESITE,
      NOMSITE: NOMSITE ?? this.NOMSITE,
      ADRESSESITE: ADRESSESITE ?? this.ADRESSESITE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDSITE.present) {
      map['idsite'] = Variable<int>(IDSITE.value);
    }
    if (CODESITE.present) {
      map['codesite'] = Variable<String>(CODESITE.value);
    }
    if (NOMSITE.present) {
      map['nomsite'] = Variable<String>(NOMSITE.value);
    }
    if (ADRESSESITE.present) {
      map['adressesite'] = Variable<String>(ADRESSESITE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesCompanion(')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODESITE: $CODESITE, ')
          ..write('NOMSITE: $NOMSITE, ')
          ..write('ADRESSESITE: $ADRESSESITE')
          ..write(')'))
        .toString();
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SitesTable(this._db, [this._alias]);
  final VerificationMeta _IDSITEMeta = const VerificationMeta('IDSITE');
  @override
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _CODESITEMeta = const VerificationMeta('CODESITE');
  @override
  late final GeneratedColumn<String?> CODESITE = GeneratedColumn<String?>(
      'codesite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _NOMSITEMeta = const VerificationMeta('NOMSITE');
  @override
  late final GeneratedColumn<String?> NOMSITE = GeneratedColumn<String?>(
      'nomsite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _ADRESSESITEMeta =
      const VerificationMeta('ADRESSESITE');
  @override
  late final GeneratedColumn<String?> ADRESSESITE = GeneratedColumn<String?>(
      'adressesite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDSITE, CODESITE, NOMSITE, ADRESSESITE];
  @override
  String get aliasedName => _alias ?? 'sites';
  @override
  String get actualTableName => 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idsite')) {
      context.handle(_IDSITEMeta,
          IDSITE.isAcceptableOrUnknown(data['idsite']!, _IDSITEMeta));
    }
    if (data.containsKey('codesite')) {
      context.handle(_CODESITEMeta,
          CODESITE.isAcceptableOrUnknown(data['codesite']!, _CODESITEMeta));
    } else if (isInserting) {
      context.missing(_CODESITEMeta);
    }
    if (data.containsKey('nomsite')) {
      context.handle(_NOMSITEMeta,
          NOMSITE.isAcceptableOrUnknown(data['nomsite']!, _NOMSITEMeta));
    } else if (isInserting) {
      context.missing(_NOMSITEMeta);
    }
    if (data.containsKey('adressesite')) {
      context.handle(
          _ADRESSESITEMeta,
          ADRESSESITE.isAcceptableOrUnknown(
              data['adressesite']!, _ADRESSESITEMeta));
    } else if (isInserting) {
      context.missing(_ADRESSESITEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {IDSITE};
  @override
  Site map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Site.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(_db, alias);
  }
}

class Tache extends DataClass implements Insertable<Tache> {
  final int IDTACHE;
  final int? IDOT;
  final String CODETACHE;
  final String LIBELLETACHE;
  final int STATUTTACHE;
  final String? COMMENTTACHE;
  Tache(
      {required this.IDTACHE,
      this.IDOT,
      required this.CODETACHE,
      required this.LIBELLETACHE,
      required this.STATUTTACHE,
      this.COMMENTTACHE});
  factory Tache.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tache(
      IDTACHE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idtache'])!,
      IDOT: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idot']),
      CODETACHE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codetache'])!,
      LIBELLETACHE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelletache'])!,
      STATUTTACHE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statuttache'])!,
      COMMENTTACHE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}commenttache']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['idtache'] = Variable<int>(IDTACHE);
    if (!nullToAbsent || IDOT != null) {
      map['idot'] = Variable<int?>(IDOT);
    }
    map['codetache'] = Variable<String>(CODETACHE);
    map['libelletache'] = Variable<String>(LIBELLETACHE);
    map['statuttache'] = Variable<int>(STATUTTACHE);
    if (!nullToAbsent || COMMENTTACHE != null) {
      map['commenttache'] = Variable<String?>(COMMENTTACHE);
    }
    return map;
  }

  TachesCompanion toCompanion(bool nullToAbsent) {
    return TachesCompanion(
      IDTACHE: Value(IDTACHE),
      IDOT: IDOT == null && nullToAbsent ? const Value.absent() : Value(IDOT),
      CODETACHE: Value(CODETACHE),
      LIBELLETACHE: Value(LIBELLETACHE),
      STATUTTACHE: Value(STATUTTACHE),
      COMMENTTACHE: COMMENTTACHE == null && nullToAbsent
          ? const Value.absent()
          : Value(COMMENTTACHE),
    );
  }

  factory Tache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tache(
      IDTACHE: serializer.fromJson<int>(json['IDTACHE']),
      IDOT: serializer.fromJson<int?>(json['IDOT']),
      CODETACHE: serializer.fromJson<String>(json['CODETACHE']),
      LIBELLETACHE: serializer.fromJson<String>(json['LIBELLETACHE']),
      STATUTTACHE: serializer.fromJson<int>(json['STATUTTACHE']),
      COMMENTTACHE: serializer.fromJson<String?>(json['COMMENTTACHE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDTACHE': serializer.toJson<int>(IDTACHE),
      'IDOT': serializer.toJson<int?>(IDOT),
      'CODETACHE': serializer.toJson<String>(CODETACHE),
      'LIBELLETACHE': serializer.toJson<String>(LIBELLETACHE),
      'STATUTTACHE': serializer.toJson<int>(STATUTTACHE),
      'COMMENTTACHE': serializer.toJson<String?>(COMMENTTACHE),
    };
  }

  Tache copyWith(
          {int? IDTACHE,
          int? IDOT,
          String? CODETACHE,
          String? LIBELLETACHE,
          int? STATUTTACHE,
          String? COMMENTTACHE}) =>
      Tache(
        IDTACHE: IDTACHE ?? this.IDTACHE,
        IDOT: IDOT ?? this.IDOT,
        CODETACHE: CODETACHE ?? this.CODETACHE,
        LIBELLETACHE: LIBELLETACHE ?? this.LIBELLETACHE,
        STATUTTACHE: STATUTTACHE ?? this.STATUTTACHE,
        COMMENTTACHE: COMMENTTACHE ?? this.COMMENTTACHE,
      );
  @override
  String toString() {
    return (StringBuffer('Tache(')
          ..write('IDTACHE: $IDTACHE, ')
          ..write('IDOT: $IDOT, ')
          ..write('CODETACHE: $CODETACHE, ')
          ..write('LIBELLETACHE: $LIBELLETACHE, ')
          ..write('STATUTTACHE: $STATUTTACHE, ')
          ..write('COMMENTTACHE: $COMMENTTACHE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      IDTACHE, IDOT, CODETACHE, LIBELLETACHE, STATUTTACHE, COMMENTTACHE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tache &&
          other.IDTACHE == this.IDTACHE &&
          other.IDOT == this.IDOT &&
          other.CODETACHE == this.CODETACHE &&
          other.LIBELLETACHE == this.LIBELLETACHE &&
          other.STATUTTACHE == this.STATUTTACHE &&
          other.COMMENTTACHE == this.COMMENTTACHE);
}

class TachesCompanion extends UpdateCompanion<Tache> {
  final Value<int> IDTACHE;
  final Value<int?> IDOT;
  final Value<String> CODETACHE;
  final Value<String> LIBELLETACHE;
  final Value<int> STATUTTACHE;
  final Value<String?> COMMENTTACHE;
  const TachesCompanion({
    this.IDTACHE = const Value.absent(),
    this.IDOT = const Value.absent(),
    this.CODETACHE = const Value.absent(),
    this.LIBELLETACHE = const Value.absent(),
    this.STATUTTACHE = const Value.absent(),
    this.COMMENTTACHE = const Value.absent(),
  });
  TachesCompanion.insert({
    required int IDTACHE,
    this.IDOT = const Value.absent(),
    required String CODETACHE,
    required String LIBELLETACHE,
    required int STATUTTACHE,
    this.COMMENTTACHE = const Value.absent(),
  })  : IDTACHE = Value(IDTACHE),
        CODETACHE = Value(CODETACHE),
        LIBELLETACHE = Value(LIBELLETACHE),
        STATUTTACHE = Value(STATUTTACHE);
  static Insertable<Tache> custom({
    Expression<int>? IDTACHE,
    Expression<int?>? IDOT,
    Expression<String>? CODETACHE,
    Expression<String>? LIBELLETACHE,
    Expression<int>? STATUTTACHE,
    Expression<String?>? COMMENTTACHE,
  }) {
    return RawValuesInsertable({
      if (IDTACHE != null) 'idtache': IDTACHE,
      if (IDOT != null) 'idot': IDOT,
      if (CODETACHE != null) 'codetache': CODETACHE,
      if (LIBELLETACHE != null) 'libelletache': LIBELLETACHE,
      if (STATUTTACHE != null) 'statuttache': STATUTTACHE,
      if (COMMENTTACHE != null) 'commenttache': COMMENTTACHE,
    });
  }

  TachesCompanion copyWith(
      {Value<int>? IDTACHE,
      Value<int?>? IDOT,
      Value<String>? CODETACHE,
      Value<String>? LIBELLETACHE,
      Value<int>? STATUTTACHE,
      Value<String?>? COMMENTTACHE}) {
    return TachesCompanion(
      IDTACHE: IDTACHE ?? this.IDTACHE,
      IDOT: IDOT ?? this.IDOT,
      CODETACHE: CODETACHE ?? this.CODETACHE,
      LIBELLETACHE: LIBELLETACHE ?? this.LIBELLETACHE,
      STATUTTACHE: STATUTTACHE ?? this.STATUTTACHE,
      COMMENTTACHE: COMMENTTACHE ?? this.COMMENTTACHE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDTACHE.present) {
      map['idtache'] = Variable<int>(IDTACHE.value);
    }
    if (IDOT.present) {
      map['idot'] = Variable<int?>(IDOT.value);
    }
    if (CODETACHE.present) {
      map['codetache'] = Variable<String>(CODETACHE.value);
    }
    if (LIBELLETACHE.present) {
      map['libelletache'] = Variable<String>(LIBELLETACHE.value);
    }
    if (STATUTTACHE.present) {
      map['statuttache'] = Variable<int>(STATUTTACHE.value);
    }
    if (COMMENTTACHE.present) {
      map['commenttache'] = Variable<String?>(COMMENTTACHE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TachesCompanion(')
          ..write('IDTACHE: $IDTACHE, ')
          ..write('IDOT: $IDOT, ')
          ..write('CODETACHE: $CODETACHE, ')
          ..write('LIBELLETACHE: $LIBELLETACHE, ')
          ..write('STATUTTACHE: $STATUTTACHE, ')
          ..write('COMMENTTACHE: $COMMENTTACHE')
          ..write(')'))
        .toString();
  }
}

class $TachesTable extends Taches with TableInfo<$TachesTable, Tache> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TachesTable(this._db, [this._alias]);
  final VerificationMeta _IDTACHEMeta = const VerificationMeta('IDTACHE');
  @override
  late final GeneratedColumn<int?> IDTACHE = GeneratedColumn<int?>(
      'idtache', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _IDOTMeta = const VerificationMeta('IDOT');
  @override
  late final GeneratedColumn<int?> IDOT = GeneratedColumn<int?>(
      'idot', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(IDOT)');
  final VerificationMeta _CODETACHEMeta = const VerificationMeta('CODETACHE');
  @override
  late final GeneratedColumn<String?> CODETACHE = GeneratedColumn<String?>(
      'codetache', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _LIBELLETACHEMeta =
      const VerificationMeta('LIBELLETACHE');
  @override
  late final GeneratedColumn<String?> LIBELLETACHE = GeneratedColumn<String?>(
      'libelletache', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _STATUTTACHEMeta =
      const VerificationMeta('STATUTTACHE');
  @override
  late final GeneratedColumn<int?> STATUTTACHE = GeneratedColumn<int?>(
      'statuttache', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _COMMENTTACHEMeta =
      const VerificationMeta('COMMENTTACHE');
  @override
  late final GeneratedColumn<String?> COMMENTTACHE = GeneratedColumn<String?>(
      'commenttache', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 2018),
      type: const StringType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [IDTACHE, IDOT, CODETACHE, LIBELLETACHE, STATUTTACHE, COMMENTTACHE];
  @override
  String get aliasedName => _alias ?? 'taches';
  @override
  String get actualTableName => 'taches';
  @override
  VerificationContext validateIntegrity(Insertable<Tache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idtache')) {
      context.handle(_IDTACHEMeta,
          IDTACHE.isAcceptableOrUnknown(data['idtache']!, _IDTACHEMeta));
    } else if (isInserting) {
      context.missing(_IDTACHEMeta);
    }
    if (data.containsKey('idot')) {
      context.handle(
          _IDOTMeta, IDOT.isAcceptableOrUnknown(data['idot']!, _IDOTMeta));
    }
    if (data.containsKey('codetache')) {
      context.handle(_CODETACHEMeta,
          CODETACHE.isAcceptableOrUnknown(data['codetache']!, _CODETACHEMeta));
    } else if (isInserting) {
      context.missing(_CODETACHEMeta);
    }
    if (data.containsKey('libelletache')) {
      context.handle(
          _LIBELLETACHEMeta,
          LIBELLETACHE.isAcceptableOrUnknown(
              data['libelletache']!, _LIBELLETACHEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLETACHEMeta);
    }
    if (data.containsKey('statuttache')) {
      context.handle(
          _STATUTTACHEMeta,
          STATUTTACHE.isAcceptableOrUnknown(
              data['statuttache']!, _STATUTTACHEMeta));
    } else if (isInserting) {
      context.missing(_STATUTTACHEMeta);
    }
    if (data.containsKey('commenttache')) {
      context.handle(
          _COMMENTTACHEMeta,
          COMMENTTACHE.isAcceptableOrUnknown(
              data['commenttache']!, _COMMENTTACHEMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {CODETACHE, IDTACHE};
  @override
  Tache map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tache.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TachesTable createAlias(String alias) {
    return $TachesTable(_db, alias);
  }
}

class Config extends DataClass implements Insertable<Config> {
  final int? IDSITE;
  final String CODEPOCKET;
  final String NOMPOCKET;
  final int? IDORIGINE;
  final String CODEORIGINE;
  final String LIBELLEORIGINE;
  Config(
      {this.IDSITE,
      required this.CODEPOCKET,
      required this.NOMPOCKET,
      this.IDORIGINE,
      required this.CODEORIGINE,
      required this.LIBELLEORIGINE});
  factory Config.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Config(
      IDSITE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idsite']),
      CODEPOCKET: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codepocket'])!,
      NOMPOCKET: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nompocket'])!,
      IDORIGINE: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idorigine']),
      CODEORIGINE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codeorigine'])!,
      LIBELLEORIGINE: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelleorigine'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || IDSITE != null) {
      map['idsite'] = Variable<int?>(IDSITE);
    }
    map['codepocket'] = Variable<String>(CODEPOCKET);
    map['nompocket'] = Variable<String>(NOMPOCKET);
    if (!nullToAbsent || IDORIGINE != null) {
      map['idorigine'] = Variable<int?>(IDORIGINE);
    }
    map['codeorigine'] = Variable<String>(CODEORIGINE);
    map['libelleorigine'] = Variable<String>(LIBELLEORIGINE);
    return map;
  }

  ConfigsCompanion toCompanion(bool nullToAbsent) {
    return ConfigsCompanion(
      IDSITE:
          IDSITE == null && nullToAbsent ? const Value.absent() : Value(IDSITE),
      CODEPOCKET: Value(CODEPOCKET),
      NOMPOCKET: Value(NOMPOCKET),
      IDORIGINE: IDORIGINE == null && nullToAbsent
          ? const Value.absent()
          : Value(IDORIGINE),
      CODEORIGINE: Value(CODEORIGINE),
      LIBELLEORIGINE: Value(LIBELLEORIGINE),
    );
  }

  factory Config.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Config(
      IDSITE: serializer.fromJson<int?>(json['IDSITE']),
      CODEPOCKET: serializer.fromJson<String>(json['CODEPOCKET']),
      NOMPOCKET: serializer.fromJson<String>(json['NOMPOCKET']),
      IDORIGINE: serializer.fromJson<int?>(json['IDORIGINE']),
      CODEORIGINE: serializer.fromJson<String>(json['CODEORIGINE']),
      LIBELLEORIGINE: serializer.fromJson<String>(json['LIBELLEORIGINE']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'IDSITE': serializer.toJson<int?>(IDSITE),
      'CODEPOCKET': serializer.toJson<String>(CODEPOCKET),
      'NOMPOCKET': serializer.toJson<String>(NOMPOCKET),
      'IDORIGINE': serializer.toJson<int?>(IDORIGINE),
      'CODEORIGINE': serializer.toJson<String>(CODEORIGINE),
      'LIBELLEORIGINE': serializer.toJson<String>(LIBELLEORIGINE),
    };
  }

  Config copyWith(
          {int? IDSITE,
          String? CODEPOCKET,
          String? NOMPOCKET,
          int? IDORIGINE,
          String? CODEORIGINE,
          String? LIBELLEORIGINE}) =>
      Config(
        IDSITE: IDSITE ?? this.IDSITE,
        CODEPOCKET: CODEPOCKET ?? this.CODEPOCKET,
        NOMPOCKET: NOMPOCKET ?? this.NOMPOCKET,
        IDORIGINE: IDORIGINE ?? this.IDORIGINE,
        CODEORIGINE: CODEORIGINE ?? this.CODEORIGINE,
        LIBELLEORIGINE: LIBELLEORIGINE ?? this.LIBELLEORIGINE,
      );
  @override
  String toString() {
    return (StringBuffer('Config(')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEPOCKET: $CODEPOCKET, ')
          ..write('NOMPOCKET: $NOMPOCKET, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('CODEORIGINE: $CODEORIGINE, ')
          ..write('LIBELLEORIGINE: $LIBELLEORIGINE')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      IDSITE, CODEPOCKET, NOMPOCKET, IDORIGINE, CODEORIGINE, LIBELLEORIGINE);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Config &&
          other.IDSITE == this.IDSITE &&
          other.CODEPOCKET == this.CODEPOCKET &&
          other.NOMPOCKET == this.NOMPOCKET &&
          other.IDORIGINE == this.IDORIGINE &&
          other.CODEORIGINE == this.CODEORIGINE &&
          other.LIBELLEORIGINE == this.LIBELLEORIGINE);
}

class ConfigsCompanion extends UpdateCompanion<Config> {
  final Value<int?> IDSITE;
  final Value<String> CODEPOCKET;
  final Value<String> NOMPOCKET;
  final Value<int?> IDORIGINE;
  final Value<String> CODEORIGINE;
  final Value<String> LIBELLEORIGINE;
  const ConfigsCompanion({
    this.IDSITE = const Value.absent(),
    this.CODEPOCKET = const Value.absent(),
    this.NOMPOCKET = const Value.absent(),
    this.IDORIGINE = const Value.absent(),
    this.CODEORIGINE = const Value.absent(),
    this.LIBELLEORIGINE = const Value.absent(),
  });
  ConfigsCompanion.insert({
    this.IDSITE = const Value.absent(),
    required String CODEPOCKET,
    required String NOMPOCKET,
    this.IDORIGINE = const Value.absent(),
    required String CODEORIGINE,
    required String LIBELLEORIGINE,
  })  : CODEPOCKET = Value(CODEPOCKET),
        NOMPOCKET = Value(NOMPOCKET),
        CODEORIGINE = Value(CODEORIGINE),
        LIBELLEORIGINE = Value(LIBELLEORIGINE);
  static Insertable<Config> custom({
    Expression<int?>? IDSITE,
    Expression<String>? CODEPOCKET,
    Expression<String>? NOMPOCKET,
    Expression<int?>? IDORIGINE,
    Expression<String>? CODEORIGINE,
    Expression<String>? LIBELLEORIGINE,
  }) {
    return RawValuesInsertable({
      if (IDSITE != null) 'idsite': IDSITE,
      if (CODEPOCKET != null) 'codepocket': CODEPOCKET,
      if (NOMPOCKET != null) 'nompocket': NOMPOCKET,
      if (IDORIGINE != null) 'idorigine': IDORIGINE,
      if (CODEORIGINE != null) 'codeorigine': CODEORIGINE,
      if (LIBELLEORIGINE != null) 'libelleorigine': LIBELLEORIGINE,
    });
  }

  ConfigsCompanion copyWith(
      {Value<int?>? IDSITE,
      Value<String>? CODEPOCKET,
      Value<String>? NOMPOCKET,
      Value<int?>? IDORIGINE,
      Value<String>? CODEORIGINE,
      Value<String>? LIBELLEORIGINE}) {
    return ConfigsCompanion(
      IDSITE: IDSITE ?? this.IDSITE,
      CODEPOCKET: CODEPOCKET ?? this.CODEPOCKET,
      NOMPOCKET: NOMPOCKET ?? this.NOMPOCKET,
      IDORIGINE: IDORIGINE ?? this.IDORIGINE,
      CODEORIGINE: CODEORIGINE ?? this.CODEORIGINE,
      LIBELLEORIGINE: LIBELLEORIGINE ?? this.LIBELLEORIGINE,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (IDSITE.present) {
      map['idsite'] = Variable<int?>(IDSITE.value);
    }
    if (CODEPOCKET.present) {
      map['codepocket'] = Variable<String>(CODEPOCKET.value);
    }
    if (NOMPOCKET.present) {
      map['nompocket'] = Variable<String>(NOMPOCKET.value);
    }
    if (IDORIGINE.present) {
      map['idorigine'] = Variable<int?>(IDORIGINE.value);
    }
    if (CODEORIGINE.present) {
      map['codeorigine'] = Variable<String>(CODEORIGINE.value);
    }
    if (LIBELLEORIGINE.present) {
      map['libelleorigine'] = Variable<String>(LIBELLEORIGINE.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigsCompanion(')
          ..write('IDSITE: $IDSITE, ')
          ..write('CODEPOCKET: $CODEPOCKET, ')
          ..write('NOMPOCKET: $NOMPOCKET, ')
          ..write('IDORIGINE: $IDORIGINE, ')
          ..write('CODEORIGINE: $CODEORIGINE, ')
          ..write('LIBELLEORIGINE: $LIBELLEORIGINE')
          ..write(')'))
        .toString();
  }
}

class $ConfigsTable extends Configs with TableInfo<$ConfigsTable, Config> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ConfigsTable(this._db, [this._alias]);
  final VerificationMeta _IDSITEMeta = const VerificationMeta('IDSITE');
  @override
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(IDSITE)');
  final VerificationMeta _CODEPOCKETMeta = const VerificationMeta('CODEPOCKET');
  @override
  late final GeneratedColumn<String?> CODEPOCKET = GeneratedColumn<String?>(
      'codepocket', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _NOMPOCKETMeta = const VerificationMeta('NOMPOCKET');
  @override
  late final GeneratedColumn<String?> NOMPOCKET = GeneratedColumn<String?>(
      'nompocket', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _IDORIGINEMeta = const VerificationMeta('IDORIGINE');
  @override
  late final GeneratedColumn<int?> IDORIGINE = GeneratedColumn<int?>(
      'idorigine', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Origines(IDORIGINE)');
  final VerificationMeta _CODEORIGINEMeta =
      const VerificationMeta('CODEORIGINE');
  @override
  late final GeneratedColumn<String?> CODEORIGINE = GeneratedColumn<String?>(
      'codeorigine', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _LIBELLEORIGINEMeta =
      const VerificationMeta('LIBELLEORIGINE');
  @override
  late final GeneratedColumn<String?> LIBELLEORIGINE = GeneratedColumn<String?>(
      'libelleorigine', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [IDSITE, CODEPOCKET, NOMPOCKET, IDORIGINE, CODEORIGINE, LIBELLEORIGINE];
  @override
  String get aliasedName => _alias ?? 'configs';
  @override
  String get actualTableName => 'configs';
  @override
  VerificationContext validateIntegrity(Insertable<Config> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('idsite')) {
      context.handle(_IDSITEMeta,
          IDSITE.isAcceptableOrUnknown(data['idsite']!, _IDSITEMeta));
    }
    if (data.containsKey('codepocket')) {
      context.handle(
          _CODEPOCKETMeta,
          CODEPOCKET.isAcceptableOrUnknown(
              data['codepocket']!, _CODEPOCKETMeta));
    } else if (isInserting) {
      context.missing(_CODEPOCKETMeta);
    }
    if (data.containsKey('nompocket')) {
      context.handle(_NOMPOCKETMeta,
          NOMPOCKET.isAcceptableOrUnknown(data['nompocket']!, _NOMPOCKETMeta));
    } else if (isInserting) {
      context.missing(_NOMPOCKETMeta);
    }
    if (data.containsKey('idorigine')) {
      context.handle(_IDORIGINEMeta,
          IDORIGINE.isAcceptableOrUnknown(data['idorigine']!, _IDORIGINEMeta));
    }
    if (data.containsKey('codeorigine')) {
      context.handle(
          _CODEORIGINEMeta,
          CODEORIGINE.isAcceptableOrUnknown(
              data['codeorigine']!, _CODEORIGINEMeta));
    } else if (isInserting) {
      context.missing(_CODEORIGINEMeta);
    }
    if (data.containsKey('libelleorigine')) {
      context.handle(
          _LIBELLEORIGINEMeta,
          LIBELLEORIGINE.isAcceptableOrUnknown(
              data['libelleorigine']!, _LIBELLEORIGINEMeta));
    } else if (isInserting) {
      context.missing(_LIBELLEORIGINEMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {CODEPOCKET};
  @override
  Config map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Config.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConfigsTable createAlias(String alias) {
    return $ConfigsTable(_db, alias);
  }
}

abstract class _$IomerDatabase extends GeneratedDatabase {
  _$IomerDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $EquipementsTable equipements = $EquipementsTable(this);
  late final $MatriculesTable matricules = $MatriculesTable(this);
  late final $OriginesTable origines = $OriginesTable(this);
  late final $OtsTable ots = $OtsTable(this);
  late final $ReservationsTable reservations = $ReservationsTable(this);
  late final $SitesTable sites = $SitesTable(this);
  late final $TachesTable taches = $TachesTable(this);
  late final $ConfigsTable configs = $ConfigsTable(this);
  late final ArticleDao articleDao = ArticleDao(this as IomerDatabase);
  late final CategorieDao categorieDao = CategorieDao(this as IomerDatabase);
  late final EquipementDao equipementDao = EquipementDao(this as IomerDatabase);
  late final MatriculeDao matriculeDao = MatriculeDao(this as IomerDatabase);
  late final OrigineDao origineDao = OrigineDao(this as IomerDatabase);
  late final OtDao otDao = OtDao(this as IomerDatabase);
  late final ReservationDao reservationDao =
      ReservationDao(this as IomerDatabase);
  late final SiteDao siteDao = SiteDao(this as IomerDatabase);
  late final TacheDao tacheDao = TacheDao(this as IomerDatabase);
  late final ConfigDao configDao = ConfigDao(this as IomerDatabase);
  late final DocumentDao documentDao = DocumentDao(this as IomerDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        articles,
        categories,
        documents,
        equipements,
        matricules,
        origines,
        ots,
        reservations,
        sites,
        taches,
        configs
      ];
}
