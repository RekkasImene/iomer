// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iomer_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Article extends DataClass implements Insertable<Article> {
  final int idArticle;
  final String codeArticle;
  final String libelleArticle;
  final int qteArticle;
  Article(
      {required this.idArticle,
      required this.codeArticle,
      required this.libelleArticle,
      required this.qteArticle});
  factory Article.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Article(
      idArticle: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_article'])!,
      codeArticle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_article'])!,
      libelleArticle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelle_article'])!,
      qteArticle: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qte_article'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_article'] = Variable<int>(idArticle);
    map['code_article'] = Variable<String>(codeArticle);
    map['libelle_article'] = Variable<String>(libelleArticle);
    map['qte_article'] = Variable<int>(qteArticle);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      idArticle: Value(idArticle),
      codeArticle: Value(codeArticle),
      libelleArticle: Value(libelleArticle),
      qteArticle: Value(qteArticle),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      idArticle: serializer.fromJson<int>(json['idArticle']),
      codeArticle: serializer.fromJson<String>(json['codeArticle']),
      libelleArticle: serializer.fromJson<String>(json['libelleArticle']),
      qteArticle: serializer.fromJson<int>(json['qteArticle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idArticle': serializer.toJson<int>(idArticle),
      'codeArticle': serializer.toJson<String>(codeArticle),
      'libelleArticle': serializer.toJson<String>(libelleArticle),
      'qteArticle': serializer.toJson<int>(qteArticle),
    };
  }

  Article copyWith(
          {int? idArticle,
          String? codeArticle,
          String? libelleArticle,
          int? qteArticle}) =>
      Article(
        idArticle: idArticle ?? this.idArticle,
        codeArticle: codeArticle ?? this.codeArticle,
        libelleArticle: libelleArticle ?? this.libelleArticle,
        qteArticle: qteArticle ?? this.qteArticle,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('idArticle: $idArticle, ')
          ..write('codeArticle: $codeArticle, ')
          ..write('libelleArticle: $libelleArticle, ')
          ..write('qteArticle: $qteArticle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idArticle, codeArticle, libelleArticle, qteArticle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.idArticle == this.idArticle &&
          other.codeArticle == this.codeArticle &&
          other.libelleArticle == this.libelleArticle &&
          other.qteArticle == this.qteArticle);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> idArticle;
  final Value<String> codeArticle;
  final Value<String> libelleArticle;
  final Value<int> qteArticle;
  const ArticlesCompanion({
    this.idArticle = const Value.absent(),
    this.codeArticle = const Value.absent(),
    this.libelleArticle = const Value.absent(),
    this.qteArticle = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required int idArticle,
    required String codeArticle,
    required String libelleArticle,
    required int qteArticle,
  })  : idArticle = Value(idArticle),
        codeArticle = Value(codeArticle),
        libelleArticle = Value(libelleArticle),
        qteArticle = Value(qteArticle);
  static Insertable<Article> custom({
    Expression<int>? idArticle,
    Expression<String>? codeArticle,
    Expression<String>? libelleArticle,
    Expression<int>? qteArticle,
  }) {
    return RawValuesInsertable({
      if (idArticle != null) 'id_article': idArticle,
      if (codeArticle != null) 'code_article': codeArticle,
      if (libelleArticle != null) 'libelle_article': libelleArticle,
      if (qteArticle != null) 'qte_article': qteArticle,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? idArticle,
      Value<String>? codeArticle,
      Value<String>? libelleArticle,
      Value<int>? qteArticle}) {
    return ArticlesCompanion(
      idArticle: idArticle ?? this.idArticle,
      codeArticle: codeArticle ?? this.codeArticle,
      libelleArticle: libelleArticle ?? this.libelleArticle,
      qteArticle: qteArticle ?? this.qteArticle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idArticle.present) {
      map['id_article'] = Variable<int>(idArticle.value);
    }
    if (codeArticle.present) {
      map['code_article'] = Variable<String>(codeArticle.value);
    }
    if (libelleArticle.present) {
      map['libelle_article'] = Variable<String>(libelleArticle.value);
    }
    if (qteArticle.present) {
      map['qte_article'] = Variable<int>(qteArticle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('idArticle: $idArticle, ')
          ..write('codeArticle: $codeArticle, ')
          ..write('libelleArticle: $libelleArticle, ')
          ..write('qteArticle: $qteArticle')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArticlesTable(this._db, [this._alias]);
  final VerificationMeta _idArticleMeta = const VerificationMeta('idArticle');
  late final GeneratedColumn<int?> idArticle = GeneratedColumn<int?>(
      'id_article', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _codeArticleMeta =
      const VerificationMeta('codeArticle');
  late final GeneratedColumn<String?> codeArticle = GeneratedColumn<String?>(
      'code_article', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libelleArticleMeta =
      const VerificationMeta('libelleArticle');
  late final GeneratedColumn<String?> libelleArticle = GeneratedColumn<String?>(
      'libelle_article', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _qteArticleMeta = const VerificationMeta('qteArticle');
  late final GeneratedColumn<int?> qteArticle = GeneratedColumn<int?>(
      'qte_article', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idArticle, codeArticle, libelleArticle, qteArticle];
  @override
  String get aliasedName => _alias ?? 'articles';
  @override
  String get actualTableName => 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_article')) {
      context.handle(_idArticleMeta,
          idArticle.isAcceptableOrUnknown(data['id_article']!, _idArticleMeta));
    } else if (isInserting) {
      context.missing(_idArticleMeta);
    }
    if (data.containsKey('code_article')) {
      context.handle(
          _codeArticleMeta,
          codeArticle.isAcceptableOrUnknown(
              data['code_article']!, _codeArticleMeta));
    } else if (isInserting) {
      context.missing(_codeArticleMeta);
    }
    if (data.containsKey('libelle_article')) {
      context.handle(
          _libelleArticleMeta,
          libelleArticle.isAcceptableOrUnknown(
              data['libelle_article']!, _libelleArticleMeta));
    } else if (isInserting) {
      context.missing(_libelleArticleMeta);
    }
    if (data.containsKey('qte_article')) {
      context.handle(
          _qteArticleMeta,
          qteArticle.isAcceptableOrUnknown(
              data['qte_article']!, _qteArticleMeta));
    } else if (isInserting) {
      context.missing(_qteArticleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idArticle, codeArticle};
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
  final int idCategorie;
  final int? idSite;
  final String codeCategorie;
  final String libelleCategorie;
  Categorie(
      {required this.idCategorie,
      this.idSite,
      required this.codeCategorie,
      required this.libelleCategorie});
  factory Categorie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Categorie(
      idCategorie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_categorie'])!,
      idSite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_site']),
      codeCategorie: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_categorie'])!,
      libelleCategorie: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}libelle_categorie'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_categorie'] = Variable<int>(idCategorie);
    if (!nullToAbsent || idSite != null) {
      map['id_site'] = Variable<int?>(idSite);
    }
    map['code_categorie'] = Variable<String>(codeCategorie);
    map['libelle_categorie'] = Variable<String>(libelleCategorie);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      idCategorie: Value(idCategorie),
      idSite:
          idSite == null && nullToAbsent ? const Value.absent() : Value(idSite),
      codeCategorie: Value(codeCategorie),
      libelleCategorie: Value(libelleCategorie),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categorie(
      idCategorie: serializer.fromJson<int>(json['idCategorie']),
      idSite: serializer.fromJson<int?>(json['idSite']),
      codeCategorie: serializer.fromJson<String>(json['codeCategorie']),
      libelleCategorie: serializer.fromJson<String>(json['libelleCategorie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCategorie': serializer.toJson<int>(idCategorie),
      'idSite': serializer.toJson<int?>(idSite),
      'codeCategorie': serializer.toJson<String>(codeCategorie),
      'libelleCategorie': serializer.toJson<String>(libelleCategorie),
    };
  }

  Categorie copyWith(
          {int? idCategorie,
          int? idSite,
          String? codeCategorie,
          String? libelleCategorie}) =>
      Categorie(
        idCategorie: idCategorie ?? this.idCategorie,
        idSite: idSite ?? this.idSite,
        codeCategorie: codeCategorie ?? this.codeCategorie,
        libelleCategorie: libelleCategorie ?? this.libelleCategorie,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('idCategorie: $idCategorie, ')
          ..write('idSite: $idSite, ')
          ..write('codeCategorie: $codeCategorie, ')
          ..write('libelleCategorie: $libelleCategorie')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idCategorie, idSite, codeCategorie, libelleCategorie);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.idCategorie == this.idCategorie &&
          other.idSite == this.idSite &&
          other.codeCategorie == this.codeCategorie &&
          other.libelleCategorie == this.libelleCategorie);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> idCategorie;
  final Value<int?> idSite;
  final Value<String> codeCategorie;
  final Value<String> libelleCategorie;
  const CategoriesCompanion({
    this.idCategorie = const Value.absent(),
    this.idSite = const Value.absent(),
    this.codeCategorie = const Value.absent(),
    this.libelleCategorie = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.idCategorie = const Value.absent(),
    this.idSite = const Value.absent(),
    required String codeCategorie,
    required String libelleCategorie,
  })  : codeCategorie = Value(codeCategorie),
        libelleCategorie = Value(libelleCategorie);
  static Insertable<Categorie> custom({
    Expression<int>? idCategorie,
    Expression<int?>? idSite,
    Expression<String>? codeCategorie,
    Expression<String>? libelleCategorie,
  }) {
    return RawValuesInsertable({
      if (idCategorie != null) 'id_categorie': idCategorie,
      if (idSite != null) 'id_site': idSite,
      if (codeCategorie != null) 'code_categorie': codeCategorie,
      if (libelleCategorie != null) 'libelle_categorie': libelleCategorie,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? idCategorie,
      Value<int?>? idSite,
      Value<String>? codeCategorie,
      Value<String>? libelleCategorie}) {
    return CategoriesCompanion(
      idCategorie: idCategorie ?? this.idCategorie,
      idSite: idSite ?? this.idSite,
      codeCategorie: codeCategorie ?? this.codeCategorie,
      libelleCategorie: libelleCategorie ?? this.libelleCategorie,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCategorie.present) {
      map['id_categorie'] = Variable<int>(idCategorie.value);
    }
    if (idSite.present) {
      map['id_site'] = Variable<int?>(idSite.value);
    }
    if (codeCategorie.present) {
      map['code_categorie'] = Variable<String>(codeCategorie.value);
    }
    if (libelleCategorie.present) {
      map['libelle_categorie'] = Variable<String>(libelleCategorie.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('idCategorie: $idCategorie, ')
          ..write('idSite: $idSite, ')
          ..write('codeCategorie: $codeCategorie, ')
          ..write('libelleCategorie: $libelleCategorie')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idCategorieMeta =
      const VerificationMeta('idCategorie');
  late final GeneratedColumn<int?> idCategorie = GeneratedColumn<int?>(
      'id_categorie', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idSiteMeta = const VerificationMeta('idSite');
  late final GeneratedColumn<int?> idSite = GeneratedColumn<int?>(
      'id_site', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(idSite)');
  final VerificationMeta _codeCategorieMeta =
      const VerificationMeta('codeCategorie');
  late final GeneratedColumn<String?> codeCategorie = GeneratedColumn<String?>(
      'code_categorie', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libelleCategorieMeta =
      const VerificationMeta('libelleCategorie');
  late final GeneratedColumn<String?> libelleCategorie =
      GeneratedColumn<String?>('libelle_categorie', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          typeName: 'TEXT',
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idCategorie, idSite, codeCategorie, libelleCategorie];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_categorie')) {
      context.handle(
          _idCategorieMeta,
          idCategorie.isAcceptableOrUnknown(
              data['id_categorie']!, _idCategorieMeta));
    }
    if (data.containsKey('id_site')) {
      context.handle(_idSiteMeta,
          idSite.isAcceptableOrUnknown(data['id_site']!, _idSiteMeta));
    }
    if (data.containsKey('code_categorie')) {
      context.handle(
          _codeCategorieMeta,
          codeCategorie.isAcceptableOrUnknown(
              data['code_categorie']!, _codeCategorieMeta));
    } else if (isInserting) {
      context.missing(_codeCategorieMeta);
    }
    if (data.containsKey('libelle_categorie')) {
      context.handle(
          _libelleCategorieMeta,
          libelleCategorie.isAcceptableOrUnknown(
              data['libelle_categorie']!, _libelleCategorieMeta));
    } else if (isInserting) {
      context.missing(_libelleCategorieMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCategorie};
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
  final int idAttachement;
  final int? idOt;
  final String attachement;
  Document({required this.idAttachement, this.idOt, required this.attachement});
  factory Document.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Document(
      idAttachement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_attachement'])!,
      idOt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_ot']),
      attachement: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attachement'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_attachement'] = Variable<int>(idAttachement);
    if (!nullToAbsent || idOt != null) {
      map['id_ot'] = Variable<int?>(idOt);
    }
    map['attachement'] = Variable<String>(attachement);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      idAttachement: Value(idAttachement),
      idOt: idOt == null && nullToAbsent ? const Value.absent() : Value(idOt),
      attachement: Value(attachement),
    );
  }

  factory Document.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      idAttachement: serializer.fromJson<int>(json['idAttachement']),
      idOt: serializer.fromJson<int?>(json['idOt']),
      attachement: serializer.fromJson<String>(json['attachement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idAttachement': serializer.toJson<int>(idAttachement),
      'idOt': serializer.toJson<int?>(idOt),
      'attachement': serializer.toJson<String>(attachement),
    };
  }

  Document copyWith({int? idAttachement, int? idOt, String? attachement}) =>
      Document(
        idAttachement: idAttachement ?? this.idAttachement,
        idOt: idOt ?? this.idOt,
        attachement: attachement ?? this.attachement,
      );
  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('idAttachement: $idAttachement, ')
          ..write('idOt: $idOt, ')
          ..write('attachement: $attachement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idAttachement, idOt, attachement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.idAttachement == this.idAttachement &&
          other.idOt == this.idOt &&
          other.attachement == this.attachement);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> idAttachement;
  final Value<int?> idOt;
  final Value<String> attachement;
  const DocumentsCompanion({
    this.idAttachement = const Value.absent(),
    this.idOt = const Value.absent(),
    this.attachement = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.idAttachement = const Value.absent(),
    this.idOt = const Value.absent(),
    required String attachement,
  }) : attachement = Value(attachement);
  static Insertable<Document> custom({
    Expression<int>? idAttachement,
    Expression<int?>? idOt,
    Expression<String>? attachement,
  }) {
    return RawValuesInsertable({
      if (idAttachement != null) 'id_attachement': idAttachement,
      if (idOt != null) 'id_ot': idOt,
      if (attachement != null) 'attachement': attachement,
    });
  }

  DocumentsCompanion copyWith(
      {Value<int>? idAttachement,
      Value<int?>? idOt,
      Value<String>? attachement}) {
    return DocumentsCompanion(
      idAttachement: idAttachement ?? this.idAttachement,
      idOt: idOt ?? this.idOt,
      attachement: attachement ?? this.attachement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idAttachement.present) {
      map['id_attachement'] = Variable<int>(idAttachement.value);
    }
    if (idOt.present) {
      map['id_ot'] = Variable<int?>(idOt.value);
    }
    if (attachement.present) {
      map['attachement'] = Variable<String>(attachement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('idAttachement: $idAttachement, ')
          ..write('idOt: $idOt, ')
          ..write('attachement: $attachement')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DocumentsTable(this._db, [this._alias]);
  final VerificationMeta _idAttachementMeta =
      const VerificationMeta('idAttachement');
  late final GeneratedColumn<int?> idAttachement = GeneratedColumn<int?>(
      'id_attachement', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idOtMeta = const VerificationMeta('idOt');
  late final GeneratedColumn<int?> idOt = GeneratedColumn<int?>(
      'id_ot', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(idOt)');
  final VerificationMeta _attachementMeta =
      const VerificationMeta('attachement');
  late final GeneratedColumn<String?> attachement = GeneratedColumn<String?>(
      'attachement', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idAttachement, idOt, attachement];
  @override
  String get aliasedName => _alias ?? 'documents';
  @override
  String get actualTableName => 'documents';
  @override
  VerificationContext validateIntegrity(Insertable<Document> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_attachement')) {
      context.handle(
          _idAttachementMeta,
          idAttachement.isAcceptableOrUnknown(
              data['id_attachement']!, _idAttachementMeta));
    }
    if (data.containsKey('id_ot')) {
      context.handle(
          _idOtMeta, idOt.isAcceptableOrUnknown(data['id_ot']!, _idOtMeta));
    }
    if (data.containsKey('attachement')) {
      context.handle(
          _attachementMeta,
          attachement.isAcceptableOrUnknown(
              data['attachement']!, _attachementMeta));
    } else if (isInserting) {
      context.missing(_attachementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAttachement};
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
  final int idEquipement;
  final int? idSite;
  final String codeEquipement;
  final String libelleEquipement;
  Equipement(
      {required this.idEquipement,
      this.idSite,
      required this.codeEquipement,
      required this.libelleEquipement});
  factory Equipement.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Equipement(
      idEquipement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_equipement'])!,
      idSite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_site']),
      codeEquipement: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_equipement'])!,
      libelleEquipement: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}libelle_equipement'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_equipement'] = Variable<int>(idEquipement);
    if (!nullToAbsent || idSite != null) {
      map['id_site'] = Variable<int?>(idSite);
    }
    map['code_equipement'] = Variable<String>(codeEquipement);
    map['libelle_equipement'] = Variable<String>(libelleEquipement);
    return map;
  }

  EquipementsCompanion toCompanion(bool nullToAbsent) {
    return EquipementsCompanion(
      idEquipement: Value(idEquipement),
      idSite:
          idSite == null && nullToAbsent ? const Value.absent() : Value(idSite),
      codeEquipement: Value(codeEquipement),
      libelleEquipement: Value(libelleEquipement),
    );
  }

  factory Equipement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Equipement(
      idEquipement: serializer.fromJson<int>(json['idEquipement']),
      idSite: serializer.fromJson<int?>(json['idSite']),
      codeEquipement: serializer.fromJson<String>(json['codeEquipement']),
      libelleEquipement: serializer.fromJson<String>(json['libelleEquipement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEquipement': serializer.toJson<int>(idEquipement),
      'idSite': serializer.toJson<int?>(idSite),
      'codeEquipement': serializer.toJson<String>(codeEquipement),
      'libelleEquipement': serializer.toJson<String>(libelleEquipement),
    };
  }

  Equipement copyWith(
          {int? idEquipement,
          int? idSite,
          String? codeEquipement,
          String? libelleEquipement}) =>
      Equipement(
        idEquipement: idEquipement ?? this.idEquipement,
        idSite: idSite ?? this.idSite,
        codeEquipement: codeEquipement ?? this.codeEquipement,
        libelleEquipement: libelleEquipement ?? this.libelleEquipement,
      );
  @override
  String toString() {
    return (StringBuffer('Equipement(')
          ..write('idEquipement: $idEquipement, ')
          ..write('idSite: $idSite, ')
          ..write('codeEquipement: $codeEquipement, ')
          ..write('libelleEquipement: $libelleEquipement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idEquipement, idSite, codeEquipement, libelleEquipement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Equipement &&
          other.idEquipement == this.idEquipement &&
          other.idSite == this.idSite &&
          other.codeEquipement == this.codeEquipement &&
          other.libelleEquipement == this.libelleEquipement);
}

class EquipementsCompanion extends UpdateCompanion<Equipement> {
  final Value<int> idEquipement;
  final Value<int?> idSite;
  final Value<String> codeEquipement;
  final Value<String> libelleEquipement;
  const EquipementsCompanion({
    this.idEquipement = const Value.absent(),
    this.idSite = const Value.absent(),
    this.codeEquipement = const Value.absent(),
    this.libelleEquipement = const Value.absent(),
  });
  EquipementsCompanion.insert({
    this.idEquipement = const Value.absent(),
    this.idSite = const Value.absent(),
    required String codeEquipement,
    required String libelleEquipement,
  })  : codeEquipement = Value(codeEquipement),
        libelleEquipement = Value(libelleEquipement);
  static Insertable<Equipement> custom({
    Expression<int>? idEquipement,
    Expression<int?>? idSite,
    Expression<String>? codeEquipement,
    Expression<String>? libelleEquipement,
  }) {
    return RawValuesInsertable({
      if (idEquipement != null) 'id_equipement': idEquipement,
      if (idSite != null) 'id_site': idSite,
      if (codeEquipement != null) 'code_equipement': codeEquipement,
      if (libelleEquipement != null) 'libelle_equipement': libelleEquipement,
    });
  }

  EquipementsCompanion copyWith(
      {Value<int>? idEquipement,
      Value<int?>? idSite,
      Value<String>? codeEquipement,
      Value<String>? libelleEquipement}) {
    return EquipementsCompanion(
      idEquipement: idEquipement ?? this.idEquipement,
      idSite: idSite ?? this.idSite,
      codeEquipement: codeEquipement ?? this.codeEquipement,
      libelleEquipement: libelleEquipement ?? this.libelleEquipement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEquipement.present) {
      map['id_equipement'] = Variable<int>(idEquipement.value);
    }
    if (idSite.present) {
      map['id_site'] = Variable<int?>(idSite.value);
    }
    if (codeEquipement.present) {
      map['code_equipement'] = Variable<String>(codeEquipement.value);
    }
    if (libelleEquipement.present) {
      map['libelle_equipement'] = Variable<String>(libelleEquipement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipementsCompanion(')
          ..write('idEquipement: $idEquipement, ')
          ..write('idSite: $idSite, ')
          ..write('codeEquipement: $codeEquipement, ')
          ..write('libelleEquipement: $libelleEquipement')
          ..write(')'))
        .toString();
  }
}

class $EquipementsTable extends Equipements
    with TableInfo<$EquipementsTable, Equipement> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EquipementsTable(this._db, [this._alias]);
  final VerificationMeta _idEquipementMeta =
      const VerificationMeta('idEquipement');
  late final GeneratedColumn<int?> idEquipement = GeneratedColumn<int?>(
      'id_equipement', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idSiteMeta = const VerificationMeta('idSite');
  late final GeneratedColumn<int?> idSite = GeneratedColumn<int?>(
      'id_site', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(idSite)');
  final VerificationMeta _codeEquipementMeta =
      const VerificationMeta('codeEquipement');
  late final GeneratedColumn<String?> codeEquipement = GeneratedColumn<String?>(
      'code_equipement', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libelleEquipementMeta =
      const VerificationMeta('libelleEquipement');
  late final GeneratedColumn<String?> libelleEquipement =
      GeneratedColumn<String?>('libelle_equipement', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          typeName: 'TEXT',
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idEquipement, idSite, codeEquipement, libelleEquipement];
  @override
  String get aliasedName => _alias ?? 'equipements';
  @override
  String get actualTableName => 'equipements';
  @override
  VerificationContext validateIntegrity(Insertable<Equipement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_equipement')) {
      context.handle(
          _idEquipementMeta,
          idEquipement.isAcceptableOrUnknown(
              data['id_equipement']!, _idEquipementMeta));
    }
    if (data.containsKey('id_site')) {
      context.handle(_idSiteMeta,
          idSite.isAcceptableOrUnknown(data['id_site']!, _idSiteMeta));
    }
    if (data.containsKey('code_equipement')) {
      context.handle(
          _codeEquipementMeta,
          codeEquipement.isAcceptableOrUnknown(
              data['code_equipement']!, _codeEquipementMeta));
    } else if (isInserting) {
      context.missing(_codeEquipementMeta);
    }
    if (data.containsKey('libelle_equipement')) {
      context.handle(
          _libelleEquipementMeta,
          libelleEquipement.isAcceptableOrUnknown(
              data['libelle_equipement']!, _libelleEquipementMeta));
    } else if (isInserting) {
      context.missing(_libelleEquipementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEquipement};
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
  final int idMatricule;
  final int? idOrigine;
  final String codeMatricule;
  final String nomMatricule;
  final String prenomMatricule;
  final bool checked;
  Matricule(
      {required this.idMatricule,
      this.idOrigine,
      required this.codeMatricule,
      required this.nomMatricule,
      required this.prenomMatricule,
      required this.checked});
  factory Matricule.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Matricule(
      idMatricule: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_matricule'])!,
      idOrigine: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_origine']),
      codeMatricule: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_matricule'])!,
      nomMatricule: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nom_matricule'])!,
      prenomMatricule: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prenom_matricule'])!,
      checked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}checked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_matricule'] = Variable<int>(idMatricule);
    if (!nullToAbsent || idOrigine != null) {
      map['id_origine'] = Variable<int?>(idOrigine);
    }
    map['code_matricule'] = Variable<String>(codeMatricule);
    map['nom_matricule'] = Variable<String>(nomMatricule);
    map['prenom_matricule'] = Variable<String>(prenomMatricule);
    map['checked'] = Variable<bool>(checked);
    return map;
  }

  MatriculesCompanion toCompanion(bool nullToAbsent) {
    return MatriculesCompanion(
      idMatricule: Value(idMatricule),
      idOrigine: idOrigine == null && nullToAbsent
          ? const Value.absent()
          : Value(idOrigine),
      codeMatricule: Value(codeMatricule),
      nomMatricule: Value(nomMatricule),
      prenomMatricule: Value(prenomMatricule),
      checked: Value(checked),
    );
  }

  factory Matricule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matricule(
      idMatricule: serializer.fromJson<int>(json['idMatricule']),
      idOrigine: serializer.fromJson<int?>(json['idOrigine']),
      codeMatricule: serializer.fromJson<String>(json['codeMatricule']),
      nomMatricule: serializer.fromJson<String>(json['nomMatricule']),
      prenomMatricule: serializer.fromJson<String>(json['prenomMatricule']),
      checked: serializer.fromJson<bool>(json['checked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMatricule': serializer.toJson<int>(idMatricule),
      'idOrigine': serializer.toJson<int?>(idOrigine),
      'codeMatricule': serializer.toJson<String>(codeMatricule),
      'nomMatricule': serializer.toJson<String>(nomMatricule),
      'prenomMatricule': serializer.toJson<String>(prenomMatricule),
      'checked': serializer.toJson<bool>(checked),
    };
  }

  Matricule copyWith(
          {int? idMatricule,
          int? idOrigine,
          String? codeMatricule,
          String? nomMatricule,
          String? prenomMatricule,
          bool? checked}) =>
      Matricule(
        idMatricule: idMatricule ?? this.idMatricule,
        idOrigine: idOrigine ?? this.idOrigine,
        codeMatricule: codeMatricule ?? this.codeMatricule,
        nomMatricule: nomMatricule ?? this.nomMatricule,
        prenomMatricule: prenomMatricule ?? this.prenomMatricule,
        checked: checked ?? this.checked,
      );
  @override
  String toString() {
    return (StringBuffer('Matricule(')
          ..write('idMatricule: $idMatricule, ')
          ..write('idOrigine: $idOrigine, ')
          ..write('codeMatricule: $codeMatricule, ')
          ..write('nomMatricule: $nomMatricule, ')
          ..write('prenomMatricule: $prenomMatricule, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMatricule, idOrigine, codeMatricule,
      nomMatricule, prenomMatricule, checked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matricule &&
          other.idMatricule == this.idMatricule &&
          other.idOrigine == this.idOrigine &&
          other.codeMatricule == this.codeMatricule &&
          other.nomMatricule == this.nomMatricule &&
          other.prenomMatricule == this.prenomMatricule &&
          other.checked == this.checked);
}

class MatriculesCompanion extends UpdateCompanion<Matricule> {
  final Value<int> idMatricule;
  final Value<int?> idOrigine;
  final Value<String> codeMatricule;
  final Value<String> nomMatricule;
  final Value<String> prenomMatricule;
  final Value<bool> checked;
  const MatriculesCompanion({
    this.idMatricule = const Value.absent(),
    this.idOrigine = const Value.absent(),
    this.codeMatricule = const Value.absent(),
    this.nomMatricule = const Value.absent(),
    this.prenomMatricule = const Value.absent(),
    this.checked = const Value.absent(),
  });
  MatriculesCompanion.insert({
    this.idMatricule = const Value.absent(),
    this.idOrigine = const Value.absent(),
    required String codeMatricule,
    required String nomMatricule,
    required String prenomMatricule,
    this.checked = const Value.absent(),
  })  : codeMatricule = Value(codeMatricule),
        nomMatricule = Value(nomMatricule),
        prenomMatricule = Value(prenomMatricule);
  static Insertable<Matricule> custom({
    Expression<int>? idMatricule,
    Expression<int?>? idOrigine,
    Expression<String>? codeMatricule,
    Expression<String>? nomMatricule,
    Expression<String>? prenomMatricule,
    Expression<bool>? checked,
  }) {
    return RawValuesInsertable({
      if (idMatricule != null) 'id_matricule': idMatricule,
      if (idOrigine != null) 'id_origine': idOrigine,
      if (codeMatricule != null) 'code_matricule': codeMatricule,
      if (nomMatricule != null) 'nom_matricule': nomMatricule,
      if (prenomMatricule != null) 'prenom_matricule': prenomMatricule,
      if (checked != null) 'checked': checked,
    });
  }

  MatriculesCompanion copyWith(
      {Value<int>? idMatricule,
      Value<int?>? idOrigine,
      Value<String>? codeMatricule,
      Value<String>? nomMatricule,
      Value<String>? prenomMatricule,
      Value<bool>? checked}) {
    return MatriculesCompanion(
      idMatricule: idMatricule ?? this.idMatricule,
      idOrigine: idOrigine ?? this.idOrigine,
      codeMatricule: codeMatricule ?? this.codeMatricule,
      nomMatricule: nomMatricule ?? this.nomMatricule,
      prenomMatricule: prenomMatricule ?? this.prenomMatricule,
      checked: checked ?? this.checked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMatricule.present) {
      map['id_matricule'] = Variable<int>(idMatricule.value);
    }
    if (idOrigine.present) {
      map['id_origine'] = Variable<int?>(idOrigine.value);
    }
    if (codeMatricule.present) {
      map['code_matricule'] = Variable<String>(codeMatricule.value);
    }
    if (nomMatricule.present) {
      map['nom_matricule'] = Variable<String>(nomMatricule.value);
    }
    if (prenomMatricule.present) {
      map['prenom_matricule'] = Variable<String>(prenomMatricule.value);
    }
    if (checked.present) {
      map['checked'] = Variable<bool>(checked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatriculesCompanion(')
          ..write('idMatricule: $idMatricule, ')
          ..write('idOrigine: $idOrigine, ')
          ..write('codeMatricule: $codeMatricule, ')
          ..write('nomMatricule: $nomMatricule, ')
          ..write('prenomMatricule: $prenomMatricule, ')
          ..write('checked: $checked')
          ..write(')'))
        .toString();
  }
}

class $MatriculesTable extends Matricules
    with TableInfo<$MatriculesTable, Matricule> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MatriculesTable(this._db, [this._alias]);
  final VerificationMeta _idMatriculeMeta =
      const VerificationMeta('idMatricule');
  late final GeneratedColumn<int?> idMatricule = GeneratedColumn<int?>(
      'id_matricule', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idOrigineMeta = const VerificationMeta('idOrigine');
  late final GeneratedColumn<int?> idOrigine = GeneratedColumn<int?>(
      'id_origine', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Origines(idOrigin)');
  final VerificationMeta _codeMatriculeMeta =
      const VerificationMeta('codeMatricule');
  late final GeneratedColumn<String?> codeMatricule = GeneratedColumn<String?>(
      'code_matricule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _nomMatriculeMeta =
      const VerificationMeta('nomMatricule');
  late final GeneratedColumn<String?> nomMatricule = GeneratedColumn<String?>(
      'nom_matricule', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _prenomMatriculeMeta =
      const VerificationMeta('prenomMatricule');
  late final GeneratedColumn<String?> prenomMatricule =
      GeneratedColumn<String?>('prenom_matricule', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 48),
          typeName: 'TEXT',
          requiredDuringInsert: true);
  final VerificationMeta _checkedMeta = const VerificationMeta('checked');
  late final GeneratedColumn<bool?> checked = GeneratedColumn<bool?>(
      'checked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (checked IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        idMatricule,
        idOrigine,
        codeMatricule,
        nomMatricule,
        prenomMatricule,
        checked
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
    if (data.containsKey('id_matricule')) {
      context.handle(
          _idMatriculeMeta,
          idMatricule.isAcceptableOrUnknown(
              data['id_matricule']!, _idMatriculeMeta));
    }
    if (data.containsKey('id_origine')) {
      context.handle(_idOrigineMeta,
          idOrigine.isAcceptableOrUnknown(data['id_origine']!, _idOrigineMeta));
    }
    if (data.containsKey('code_matricule')) {
      context.handle(
          _codeMatriculeMeta,
          codeMatricule.isAcceptableOrUnknown(
              data['code_matricule']!, _codeMatriculeMeta));
    } else if (isInserting) {
      context.missing(_codeMatriculeMeta);
    }
    if (data.containsKey('nom_matricule')) {
      context.handle(
          _nomMatriculeMeta,
          nomMatricule.isAcceptableOrUnknown(
              data['nom_matricule']!, _nomMatriculeMeta));
    } else if (isInserting) {
      context.missing(_nomMatriculeMeta);
    }
    if (data.containsKey('prenom_matricule')) {
      context.handle(
          _prenomMatriculeMeta,
          prenomMatricule.isAcceptableOrUnknown(
              data['prenom_matricule']!, _prenomMatriculeMeta));
    } else if (isInserting) {
      context.missing(_prenomMatriculeMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(_checkedMeta,
          checked.isAcceptableOrUnknown(data['checked']!, _checkedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMatricule};
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
  final int idOrigin;
  final int? idSite;
  final String codeOrigin;
  final String libelleOrigin;
  Origine(
      {required this.idOrigin,
      this.idSite,
      required this.codeOrigin,
      required this.libelleOrigin});
  factory Origine.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Origine(
      idOrigin: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_origin'])!,
      idSite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_site']),
      codeOrigin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_origin'])!,
      libelleOrigin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelle_origin'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_origin'] = Variable<int>(idOrigin);
    if (!nullToAbsent || idSite != null) {
      map['id_site'] = Variable<int?>(idSite);
    }
    map['code_origin'] = Variable<String>(codeOrigin);
    map['libelle_origin'] = Variable<String>(libelleOrigin);
    return map;
  }

  OriginesCompanion toCompanion(bool nullToAbsent) {
    return OriginesCompanion(
      idOrigin: Value(idOrigin),
      idSite:
          idSite == null && nullToAbsent ? const Value.absent() : Value(idSite),
      codeOrigin: Value(codeOrigin),
      libelleOrigin: Value(libelleOrigin),
    );
  }

  factory Origine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Origine(
      idOrigin: serializer.fromJson<int>(json['idOrigin']),
      idSite: serializer.fromJson<int?>(json['idSite']),
      codeOrigin: serializer.fromJson<String>(json['codeOrigin']),
      libelleOrigin: serializer.fromJson<String>(json['libelleOrigin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrigin': serializer.toJson<int>(idOrigin),
      'idSite': serializer.toJson<int?>(idSite),
      'codeOrigin': serializer.toJson<String>(codeOrigin),
      'libelleOrigin': serializer.toJson<String>(libelleOrigin),
    };
  }

  Origine copyWith(
          {int? idOrigin,
          int? idSite,
          String? codeOrigin,
          String? libelleOrigin}) =>
      Origine(
        idOrigin: idOrigin ?? this.idOrigin,
        idSite: idSite ?? this.idSite,
        codeOrigin: codeOrigin ?? this.codeOrigin,
        libelleOrigin: libelleOrigin ?? this.libelleOrigin,
      );
  @override
  String toString() {
    return (StringBuffer('Origine(')
          ..write('idOrigin: $idOrigin, ')
          ..write('idSite: $idSite, ')
          ..write('codeOrigin: $codeOrigin, ')
          ..write('libelleOrigin: $libelleOrigin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOrigin, idSite, codeOrigin, libelleOrigin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Origine &&
          other.idOrigin == this.idOrigin &&
          other.idSite == this.idSite &&
          other.codeOrigin == this.codeOrigin &&
          other.libelleOrigin == this.libelleOrigin);
}

class OriginesCompanion extends UpdateCompanion<Origine> {
  final Value<int> idOrigin;
  final Value<int?> idSite;
  final Value<String> codeOrigin;
  final Value<String> libelleOrigin;
  const OriginesCompanion({
    this.idOrigin = const Value.absent(),
    this.idSite = const Value.absent(),
    this.codeOrigin = const Value.absent(),
    this.libelleOrigin = const Value.absent(),
  });
  OriginesCompanion.insert({
    this.idOrigin = const Value.absent(),
    this.idSite = const Value.absent(),
    required String codeOrigin,
    required String libelleOrigin,
  })  : codeOrigin = Value(codeOrigin),
        libelleOrigin = Value(libelleOrigin);
  static Insertable<Origine> custom({
    Expression<int>? idOrigin,
    Expression<int?>? idSite,
    Expression<String>? codeOrigin,
    Expression<String>? libelleOrigin,
  }) {
    return RawValuesInsertable({
      if (idOrigin != null) 'id_origin': idOrigin,
      if (idSite != null) 'id_site': idSite,
      if (codeOrigin != null) 'code_origin': codeOrigin,
      if (libelleOrigin != null) 'libelle_origin': libelleOrigin,
    });
  }

  OriginesCompanion copyWith(
      {Value<int>? idOrigin,
      Value<int?>? idSite,
      Value<String>? codeOrigin,
      Value<String>? libelleOrigin}) {
    return OriginesCompanion(
      idOrigin: idOrigin ?? this.idOrigin,
      idSite: idSite ?? this.idSite,
      codeOrigin: codeOrigin ?? this.codeOrigin,
      libelleOrigin: libelleOrigin ?? this.libelleOrigin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrigin.present) {
      map['id_origin'] = Variable<int>(idOrigin.value);
    }
    if (idSite.present) {
      map['id_site'] = Variable<int?>(idSite.value);
    }
    if (codeOrigin.present) {
      map['code_origin'] = Variable<String>(codeOrigin.value);
    }
    if (libelleOrigin.present) {
      map['libelle_origin'] = Variable<String>(libelleOrigin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OriginesCompanion(')
          ..write('idOrigin: $idOrigin, ')
          ..write('idSite: $idSite, ')
          ..write('codeOrigin: $codeOrigin, ')
          ..write('libelleOrigin: $libelleOrigin')
          ..write(')'))
        .toString();
  }
}

class $OriginesTable extends Origines with TableInfo<$OriginesTable, Origine> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OriginesTable(this._db, [this._alias]);
  final VerificationMeta _idOriginMeta = const VerificationMeta('idOrigin');
  late final GeneratedColumn<int?> idOrigin = GeneratedColumn<int?>(
      'id_origin', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idSiteMeta = const VerificationMeta('idSite');
  late final GeneratedColumn<int?> idSite = GeneratedColumn<int?>(
      'id_site', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Sites(idSite)');
  final VerificationMeta _codeOriginMeta = const VerificationMeta('codeOrigin');
  late final GeneratedColumn<String?> codeOrigin = GeneratedColumn<String?>(
      'code_origin', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libelleOriginMeta =
      const VerificationMeta('libelleOrigin');
  late final GeneratedColumn<String?> libelleOrigin = GeneratedColumn<String?>(
      'libelle_origin', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idOrigin, idSite, codeOrigin, libelleOrigin];
  @override
  String get aliasedName => _alias ?? 'origines';
  @override
  String get actualTableName => 'origines';
  @override
  VerificationContext validateIntegrity(Insertable<Origine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_origin')) {
      context.handle(_idOriginMeta,
          idOrigin.isAcceptableOrUnknown(data['id_origin']!, _idOriginMeta));
    }
    if (data.containsKey('id_site')) {
      context.handle(_idSiteMeta,
          idSite.isAcceptableOrUnknown(data['id_site']!, _idSiteMeta));
    }
    if (data.containsKey('code_origin')) {
      context.handle(
          _codeOriginMeta,
          codeOrigin.isAcceptableOrUnknown(
              data['code_origin']!, _codeOriginMeta));
    } else if (isInserting) {
      context.missing(_codeOriginMeta);
    }
    if (data.containsKey('libelle_origin')) {
      context.handle(
          _libelleOriginMeta,
          libelleOrigin.isAcceptableOrUnknown(
              data['libelle_origin']!, _libelleOriginMeta));
    } else if (isInserting) {
      context.missing(_libelleOriginMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrigin};
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

class OtData extends DataClass implements Insertable<OtData> {
  final int idOt;
  final int? idOrigine;
  final int? idCategorie;
  final int? idEquipement;
  final String codeOt;
  final String libellOt;
  final String comentOt;
  final double tempsOt;
  final String statutOt;
  final DateTime dtOpenOt;
  final DateTime dtExecOt;
  final DateTime dtWaitOt;
  final DateTime dtCancOt;
  final DateTime dtClosOt;
  OtData(
      {required this.idOt,
      this.idOrigine,
      this.idCategorie,
      this.idEquipement,
      required this.codeOt,
      required this.libellOt,
      required this.comentOt,
      required this.tempsOt,
      required this.statutOt,
      required this.dtOpenOt,
      required this.dtExecOt,
      required this.dtWaitOt,
      required this.dtCancOt,
      required this.dtClosOt});
  factory OtData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OtData(
      idOt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_ot'])!,
      idOrigine: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_origine']),
      idCategorie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_categorie']),
      idEquipement: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_equipement']),
      codeOt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_ot'])!,
      libellOt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libell_ot'])!,
      comentOt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}coment_ot'])!,
      tempsOt: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temps_ot'])!,
      statutOt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statut_ot'])!,
      dtOpenOt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_open_ot'])!,
      dtExecOt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_exec_ot'])!,
      dtWaitOt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_wait_ot'])!,
      dtCancOt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_canc_ot'])!,
      dtClosOt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dt_clos_ot'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ot'] = Variable<int>(idOt);
    if (!nullToAbsent || idOrigine != null) {
      map['id_origine'] = Variable<int?>(idOrigine);
    }
    if (!nullToAbsent || idCategorie != null) {
      map['id_categorie'] = Variable<int?>(idCategorie);
    }
    if (!nullToAbsent || idEquipement != null) {
      map['id_equipement'] = Variable<int?>(idEquipement);
    }
    map['code_ot'] = Variable<String>(codeOt);
    map['libell_ot'] = Variable<String>(libellOt);
    map['coment_ot'] = Variable<String>(comentOt);
    map['temps_ot'] = Variable<double>(tempsOt);
    map['statut_ot'] = Variable<String>(statutOt);
    map['dt_open_ot'] = Variable<DateTime>(dtOpenOt);
    map['dt_exec_ot'] = Variable<DateTime>(dtExecOt);
    map['dt_wait_ot'] = Variable<DateTime>(dtWaitOt);
    map['dt_canc_ot'] = Variable<DateTime>(dtCancOt);
    map['dt_clos_ot'] = Variable<DateTime>(dtClosOt);
    return map;
  }

  OtCompanion toCompanion(bool nullToAbsent) {
    return OtCompanion(
      idOt: Value(idOt),
      idOrigine: idOrigine == null && nullToAbsent
          ? const Value.absent()
          : Value(idOrigine),
      idCategorie: idCategorie == null && nullToAbsent
          ? const Value.absent()
          : Value(idCategorie),
      idEquipement: idEquipement == null && nullToAbsent
          ? const Value.absent()
          : Value(idEquipement),
      codeOt: Value(codeOt),
      libellOt: Value(libellOt),
      comentOt: Value(comentOt),
      tempsOt: Value(tempsOt),
      statutOt: Value(statutOt),
      dtOpenOt: Value(dtOpenOt),
      dtExecOt: Value(dtExecOt),
      dtWaitOt: Value(dtWaitOt),
      dtCancOt: Value(dtCancOt),
      dtClosOt: Value(dtClosOt),
    );
  }

  factory OtData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OtData(
      idOt: serializer.fromJson<int>(json['idOt']),
      idOrigine: serializer.fromJson<int?>(json['idOrigine']),
      idCategorie: serializer.fromJson<int?>(json['idCategorie']),
      idEquipement: serializer.fromJson<int?>(json['idEquipement']),
      codeOt: serializer.fromJson<String>(json['codeOt']),
      libellOt: serializer.fromJson<String>(json['libellOt']),
      comentOt: serializer.fromJson<String>(json['comentOt']),
      tempsOt: serializer.fromJson<double>(json['tempsOt']),
      statutOt: serializer.fromJson<String>(json['statutOt']),
      dtOpenOt: serializer.fromJson<DateTime>(json['dtOpenOt']),
      dtExecOt: serializer.fromJson<DateTime>(json['dtExecOt']),
      dtWaitOt: serializer.fromJson<DateTime>(json['dtWaitOt']),
      dtCancOt: serializer.fromJson<DateTime>(json['dtCancOt']),
      dtClosOt: serializer.fromJson<DateTime>(json['dtClosOt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOt': serializer.toJson<int>(idOt),
      'idOrigine': serializer.toJson<int?>(idOrigine),
      'idCategorie': serializer.toJson<int?>(idCategorie),
      'idEquipement': serializer.toJson<int?>(idEquipement),
      'codeOt': serializer.toJson<String>(codeOt),
      'libellOt': serializer.toJson<String>(libellOt),
      'comentOt': serializer.toJson<String>(comentOt),
      'tempsOt': serializer.toJson<double>(tempsOt),
      'statutOt': serializer.toJson<String>(statutOt),
      'dtOpenOt': serializer.toJson<DateTime>(dtOpenOt),
      'dtExecOt': serializer.toJson<DateTime>(dtExecOt),
      'dtWaitOt': serializer.toJson<DateTime>(dtWaitOt),
      'dtCancOt': serializer.toJson<DateTime>(dtCancOt),
      'dtClosOt': serializer.toJson<DateTime>(dtClosOt),
    };
  }

  OtData copyWith(
          {int? idOt,
          int? idOrigine,
          int? idCategorie,
          int? idEquipement,
          String? codeOt,
          String? libellOt,
          String? comentOt,
          double? tempsOt,
          String? statutOt,
          DateTime? dtOpenOt,
          DateTime? dtExecOt,
          DateTime? dtWaitOt,
          DateTime? dtCancOt,
          DateTime? dtClosOt}) =>
      OtData(
        idOt: idOt ?? this.idOt,
        idOrigine: idOrigine ?? this.idOrigine,
        idCategorie: idCategorie ?? this.idCategorie,
        idEquipement: idEquipement ?? this.idEquipement,
        codeOt: codeOt ?? this.codeOt,
        libellOt: libellOt ?? this.libellOt,
        comentOt: comentOt ?? this.comentOt,
        tempsOt: tempsOt ?? this.tempsOt,
        statutOt: statutOt ?? this.statutOt,
        dtOpenOt: dtOpenOt ?? this.dtOpenOt,
        dtExecOt: dtExecOt ?? this.dtExecOt,
        dtWaitOt: dtWaitOt ?? this.dtWaitOt,
        dtCancOt: dtCancOt ?? this.dtCancOt,
        dtClosOt: dtClosOt ?? this.dtClosOt,
      );
  @override
  String toString() {
    return (StringBuffer('OtData(')
          ..write('idOt: $idOt, ')
          ..write('idOrigine: $idOrigine, ')
          ..write('idCategorie: $idCategorie, ')
          ..write('idEquipement: $idEquipement, ')
          ..write('codeOt: $codeOt, ')
          ..write('libellOt: $libellOt, ')
          ..write('comentOt: $comentOt, ')
          ..write('tempsOt: $tempsOt, ')
          ..write('statutOt: $statutOt, ')
          ..write('dtOpenOt: $dtOpenOt, ')
          ..write('dtExecOt: $dtExecOt, ')
          ..write('dtWaitOt: $dtWaitOt, ')
          ..write('dtCancOt: $dtCancOt, ')
          ..write('dtClosOt: $dtClosOt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idOt,
      idOrigine,
      idCategorie,
      idEquipement,
      codeOt,
      libellOt,
      comentOt,
      tempsOt,
      statutOt,
      dtOpenOt,
      dtExecOt,
      dtWaitOt,
      dtCancOt,
      dtClosOt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OtData &&
          other.idOt == this.idOt &&
          other.idOrigine == this.idOrigine &&
          other.idCategorie == this.idCategorie &&
          other.idEquipement == this.idEquipement &&
          other.codeOt == this.codeOt &&
          other.libellOt == this.libellOt &&
          other.comentOt == this.comentOt &&
          other.tempsOt == this.tempsOt &&
          other.statutOt == this.statutOt &&
          other.dtOpenOt == this.dtOpenOt &&
          other.dtExecOt == this.dtExecOt &&
          other.dtWaitOt == this.dtWaitOt &&
          other.dtCancOt == this.dtCancOt &&
          other.dtClosOt == this.dtClosOt);
}

class OtCompanion extends UpdateCompanion<OtData> {
  final Value<int> idOt;
  final Value<int?> idOrigine;
  final Value<int?> idCategorie;
  final Value<int?> idEquipement;
  final Value<String> codeOt;
  final Value<String> libellOt;
  final Value<String> comentOt;
  final Value<double> tempsOt;
  final Value<String> statutOt;
  final Value<DateTime> dtOpenOt;
  final Value<DateTime> dtExecOt;
  final Value<DateTime> dtWaitOt;
  final Value<DateTime> dtCancOt;
  final Value<DateTime> dtClosOt;
  const OtCompanion({
    this.idOt = const Value.absent(),
    this.idOrigine = const Value.absent(),
    this.idCategorie = const Value.absent(),
    this.idEquipement = const Value.absent(),
    this.codeOt = const Value.absent(),
    this.libellOt = const Value.absent(),
    this.comentOt = const Value.absent(),
    this.tempsOt = const Value.absent(),
    this.statutOt = const Value.absent(),
    this.dtOpenOt = const Value.absent(),
    this.dtExecOt = const Value.absent(),
    this.dtWaitOt = const Value.absent(),
    this.dtCancOt = const Value.absent(),
    this.dtClosOt = const Value.absent(),
  });
  OtCompanion.insert({
    this.idOt = const Value.absent(),
    this.idOrigine = const Value.absent(),
    this.idCategorie = const Value.absent(),
    this.idEquipement = const Value.absent(),
    required String codeOt,
    required String libellOt,
    required String comentOt,
    required double tempsOt,
    required String statutOt,
    required DateTime dtOpenOt,
    required DateTime dtExecOt,
    required DateTime dtWaitOt,
    required DateTime dtCancOt,
    required DateTime dtClosOt,
  })  : codeOt = Value(codeOt),
        libellOt = Value(libellOt),
        comentOt = Value(comentOt),
        tempsOt = Value(tempsOt),
        statutOt = Value(statutOt),
        dtOpenOt = Value(dtOpenOt),
        dtExecOt = Value(dtExecOt),
        dtWaitOt = Value(dtWaitOt),
        dtCancOt = Value(dtCancOt),
        dtClosOt = Value(dtClosOt);
  static Insertable<OtData> custom({
    Expression<int>? idOt,
    Expression<int?>? idOrigine,
    Expression<int?>? idCategorie,
    Expression<int?>? idEquipement,
    Expression<String>? codeOt,
    Expression<String>? libellOt,
    Expression<String>? comentOt,
    Expression<double>? tempsOt,
    Expression<String>? statutOt,
    Expression<DateTime>? dtOpenOt,
    Expression<DateTime>? dtExecOt,
    Expression<DateTime>? dtWaitOt,
    Expression<DateTime>? dtCancOt,
    Expression<DateTime>? dtClosOt,
  }) {
    return RawValuesInsertable({
      if (idOt != null) 'id_ot': idOt,
      if (idOrigine != null) 'id_origine': idOrigine,
      if (idCategorie != null) 'id_categorie': idCategorie,
      if (idEquipement != null) 'id_equipement': idEquipement,
      if (codeOt != null) 'code_ot': codeOt,
      if (libellOt != null) 'libell_ot': libellOt,
      if (comentOt != null) 'coment_ot': comentOt,
      if (tempsOt != null) 'temps_ot': tempsOt,
      if (statutOt != null) 'statut_ot': statutOt,
      if (dtOpenOt != null) 'dt_open_ot': dtOpenOt,
      if (dtExecOt != null) 'dt_exec_ot': dtExecOt,
      if (dtWaitOt != null) 'dt_wait_ot': dtWaitOt,
      if (dtCancOt != null) 'dt_canc_ot': dtCancOt,
      if (dtClosOt != null) 'dt_clos_ot': dtClosOt,
    });
  }

  OtCompanion copyWith(
      {Value<int>? idOt,
      Value<int?>? idOrigine,
      Value<int?>? idCategorie,
      Value<int?>? idEquipement,
      Value<String>? codeOt,
      Value<String>? libellOt,
      Value<String>? comentOt,
      Value<double>? tempsOt,
      Value<String>? statutOt,
      Value<DateTime>? dtOpenOt,
      Value<DateTime>? dtExecOt,
      Value<DateTime>? dtWaitOt,
      Value<DateTime>? dtCancOt,
      Value<DateTime>? dtClosOt}) {
    return OtCompanion(
      idOt: idOt ?? this.idOt,
      idOrigine: idOrigine ?? this.idOrigine,
      idCategorie: idCategorie ?? this.idCategorie,
      idEquipement: idEquipement ?? this.idEquipement,
      codeOt: codeOt ?? this.codeOt,
      libellOt: libellOt ?? this.libellOt,
      comentOt: comentOt ?? this.comentOt,
      tempsOt: tempsOt ?? this.tempsOt,
      statutOt: statutOt ?? this.statutOt,
      dtOpenOt: dtOpenOt ?? this.dtOpenOt,
      dtExecOt: dtExecOt ?? this.dtExecOt,
      dtWaitOt: dtWaitOt ?? this.dtWaitOt,
      dtCancOt: dtCancOt ?? this.dtCancOt,
      dtClosOt: dtClosOt ?? this.dtClosOt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOt.present) {
      map['id_ot'] = Variable<int>(idOt.value);
    }
    if (idOrigine.present) {
      map['id_origine'] = Variable<int?>(idOrigine.value);
    }
    if (idCategorie.present) {
      map['id_categorie'] = Variable<int?>(idCategorie.value);
    }
    if (idEquipement.present) {
      map['id_equipement'] = Variable<int?>(idEquipement.value);
    }
    if (codeOt.present) {
      map['code_ot'] = Variable<String>(codeOt.value);
    }
    if (libellOt.present) {
      map['libell_ot'] = Variable<String>(libellOt.value);
    }
    if (comentOt.present) {
      map['coment_ot'] = Variable<String>(comentOt.value);
    }
    if (tempsOt.present) {
      map['temps_ot'] = Variable<double>(tempsOt.value);
    }
    if (statutOt.present) {
      map['statut_ot'] = Variable<String>(statutOt.value);
    }
    if (dtOpenOt.present) {
      map['dt_open_ot'] = Variable<DateTime>(dtOpenOt.value);
    }
    if (dtExecOt.present) {
      map['dt_exec_ot'] = Variable<DateTime>(dtExecOt.value);
    }
    if (dtWaitOt.present) {
      map['dt_wait_ot'] = Variable<DateTime>(dtWaitOt.value);
    }
    if (dtCancOt.present) {
      map['dt_canc_ot'] = Variable<DateTime>(dtCancOt.value);
    }
    if (dtClosOt.present) {
      map['dt_clos_ot'] = Variable<DateTime>(dtClosOt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtCompanion(')
          ..write('idOt: $idOt, ')
          ..write('idOrigine: $idOrigine, ')
          ..write('idCategorie: $idCategorie, ')
          ..write('idEquipement: $idEquipement, ')
          ..write('codeOt: $codeOt, ')
          ..write('libellOt: $libellOt, ')
          ..write('comentOt: $comentOt, ')
          ..write('tempsOt: $tempsOt, ')
          ..write('statutOt: $statutOt, ')
          ..write('dtOpenOt: $dtOpenOt, ')
          ..write('dtExecOt: $dtExecOt, ')
          ..write('dtWaitOt: $dtWaitOt, ')
          ..write('dtCancOt: $dtCancOt, ')
          ..write('dtClosOt: $dtClosOt')
          ..write(')'))
        .toString();
  }
}

class $OtTable extends Ot with TableInfo<$OtTable, OtData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OtTable(this._db, [this._alias]);
  final VerificationMeta _idOtMeta = const VerificationMeta('idOt');
  late final GeneratedColumn<int?> idOt = GeneratedColumn<int?>(
      'id_ot', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idOrigineMeta = const VerificationMeta('idOrigine');
  late final GeneratedColumn<int?> idOrigine = GeneratedColumn<int?>(
      'id_origine', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Origines(idOrigin)');
  final VerificationMeta _idCategorieMeta =
      const VerificationMeta('idCategorie');
  late final GeneratedColumn<int?> idCategorie = GeneratedColumn<int?>(
      'id_categorie', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Categories(idCategorie)');
  final VerificationMeta _idEquipementMeta =
      const VerificationMeta('idEquipement');
  late final GeneratedColumn<int?> idEquipement = GeneratedColumn<int?>(
      'id_equipement', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Equipements(idEquipement)');
  final VerificationMeta _codeOtMeta = const VerificationMeta('codeOt');
  late final GeneratedColumn<String?> codeOt = GeneratedColumn<String?>(
      'code_ot', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 24),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libellOtMeta = const VerificationMeta('libellOt');
  late final GeneratedColumn<String?> libellOt = GeneratedColumn<String?>(
      'libell_ot', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _comentOtMeta = const VerificationMeta('comentOt');
  late final GeneratedColumn<String?> comentOt = GeneratedColumn<String?>(
      'coment_ot', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 2048),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _tempsOtMeta = const VerificationMeta('tempsOt');
  late final GeneratedColumn<double?> tempsOt = GeneratedColumn<double?>(
      'temps_ot', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _statutOtMeta = const VerificationMeta('statutOt');
  late final GeneratedColumn<String?> statutOt = GeneratedColumn<String?>(
      'statut_ot', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 1),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dtOpenOtMeta = const VerificationMeta('dtOpenOt');
  late final GeneratedColumn<DateTime?> dtOpenOt = GeneratedColumn<DateTime?>(
      'dt_open_ot', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dtExecOtMeta = const VerificationMeta('dtExecOt');
  late final GeneratedColumn<DateTime?> dtExecOt = GeneratedColumn<DateTime?>(
      'dt_exec_ot', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dtWaitOtMeta = const VerificationMeta('dtWaitOt');
  late final GeneratedColumn<DateTime?> dtWaitOt = GeneratedColumn<DateTime?>(
      'dt_wait_ot', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dtCancOtMeta = const VerificationMeta('dtCancOt');
  late final GeneratedColumn<DateTime?> dtCancOt = GeneratedColumn<DateTime?>(
      'dt_canc_ot', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dtClosOtMeta = const VerificationMeta('dtClosOt');
  late final GeneratedColumn<DateTime?> dtClosOt = GeneratedColumn<DateTime?>(
      'dt_clos_ot', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        idOt,
        idOrigine,
        idCategorie,
        idEquipement,
        codeOt,
        libellOt,
        comentOt,
        tempsOt,
        statutOt,
        dtOpenOt,
        dtExecOt,
        dtWaitOt,
        dtCancOt,
        dtClosOt
      ];
  @override
  String get aliasedName => _alias ?? 'ot';
  @override
  String get actualTableName => 'ot';
  @override
  VerificationContext validateIntegrity(Insertable<OtData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ot')) {
      context.handle(
          _idOtMeta, idOt.isAcceptableOrUnknown(data['id_ot']!, _idOtMeta));
    }
    if (data.containsKey('id_origine')) {
      context.handle(_idOrigineMeta,
          idOrigine.isAcceptableOrUnknown(data['id_origine']!, _idOrigineMeta));
    }
    if (data.containsKey('id_categorie')) {
      context.handle(
          _idCategorieMeta,
          idCategorie.isAcceptableOrUnknown(
              data['id_categorie']!, _idCategorieMeta));
    }
    if (data.containsKey('id_equipement')) {
      context.handle(
          _idEquipementMeta,
          idEquipement.isAcceptableOrUnknown(
              data['id_equipement']!, _idEquipementMeta));
    }
    if (data.containsKey('code_ot')) {
      context.handle(_codeOtMeta,
          codeOt.isAcceptableOrUnknown(data['code_ot']!, _codeOtMeta));
    } else if (isInserting) {
      context.missing(_codeOtMeta);
    }
    if (data.containsKey('libell_ot')) {
      context.handle(_libellOtMeta,
          libellOt.isAcceptableOrUnknown(data['libell_ot']!, _libellOtMeta));
    } else if (isInserting) {
      context.missing(_libellOtMeta);
    }
    if (data.containsKey('coment_ot')) {
      context.handle(_comentOtMeta,
          comentOt.isAcceptableOrUnknown(data['coment_ot']!, _comentOtMeta));
    } else if (isInserting) {
      context.missing(_comentOtMeta);
    }
    if (data.containsKey('temps_ot')) {
      context.handle(_tempsOtMeta,
          tempsOt.isAcceptableOrUnknown(data['temps_ot']!, _tempsOtMeta));
    } else if (isInserting) {
      context.missing(_tempsOtMeta);
    }
    if (data.containsKey('statut_ot')) {
      context.handle(_statutOtMeta,
          statutOt.isAcceptableOrUnknown(data['statut_ot']!, _statutOtMeta));
    } else if (isInserting) {
      context.missing(_statutOtMeta);
    }
    if (data.containsKey('dt_open_ot')) {
      context.handle(_dtOpenOtMeta,
          dtOpenOt.isAcceptableOrUnknown(data['dt_open_ot']!, _dtOpenOtMeta));
    } else if (isInserting) {
      context.missing(_dtOpenOtMeta);
    }
    if (data.containsKey('dt_exec_ot')) {
      context.handle(_dtExecOtMeta,
          dtExecOt.isAcceptableOrUnknown(data['dt_exec_ot']!, _dtExecOtMeta));
    } else if (isInserting) {
      context.missing(_dtExecOtMeta);
    }
    if (data.containsKey('dt_wait_ot')) {
      context.handle(_dtWaitOtMeta,
          dtWaitOt.isAcceptableOrUnknown(data['dt_wait_ot']!, _dtWaitOtMeta));
    } else if (isInserting) {
      context.missing(_dtWaitOtMeta);
    }
    if (data.containsKey('dt_canc_ot')) {
      context.handle(_dtCancOtMeta,
          dtCancOt.isAcceptableOrUnknown(data['dt_canc_ot']!, _dtCancOtMeta));
    } else if (isInserting) {
      context.missing(_dtCancOtMeta);
    }
    if (data.containsKey('dt_clos_ot')) {
      context.handle(_dtClosOtMeta,
          dtClosOt.isAcceptableOrUnknown(data['dt_clos_ot']!, _dtClosOtMeta));
    } else if (isInserting) {
      context.missing(_dtClosOtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOt};
  @override
  OtData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OtData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OtTable createAlias(String alias) {
    return $OtTable(_db, alias);
  }
}

class Reservation extends DataClass implements Insertable<Reservation> {
  final int idPiece;
  final int? idOt;
  final String? codeArticle;
  final String libelleArticle;
  final int qteArticle;
  final int idArticle;
  Reservation(
      {required this.idPiece,
      this.idOt,
      this.codeArticle,
      required this.libelleArticle,
      required this.qteArticle,
      required this.idArticle});
  factory Reservation.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Reservation(
      idPiece: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_piece'])!,
      idOt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_ot']),
      codeArticle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_article']),
      libelleArticle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelle_article'])!,
      qteArticle: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qte_article'])!,
      idArticle: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_article'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_piece'] = Variable<int>(idPiece);
    if (!nullToAbsent || idOt != null) {
      map['id_ot'] = Variable<int?>(idOt);
    }
    if (!nullToAbsent || codeArticle != null) {
      map['code_article'] = Variable<String?>(codeArticle);
    }
    map['libelle_article'] = Variable<String>(libelleArticle);
    map['qte_article'] = Variable<int>(qteArticle);
    map['id_article'] = Variable<int>(idArticle);
    return map;
  }

  ReservationsCompanion toCompanion(bool nullToAbsent) {
    return ReservationsCompanion(
      idPiece: Value(idPiece),
      idOt: idOt == null && nullToAbsent ? const Value.absent() : Value(idOt),
      codeArticle: codeArticle == null && nullToAbsent
          ? const Value.absent()
          : Value(codeArticle),
      libelleArticle: Value(libelleArticle),
      qteArticle: Value(qteArticle),
      idArticle: Value(idArticle),
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reservation(
      idPiece: serializer.fromJson<int>(json['idPiece']),
      idOt: serializer.fromJson<int?>(json['idOt']),
      codeArticle: serializer.fromJson<String?>(json['codeArticle']),
      libelleArticle: serializer.fromJson<String>(json['libelleArticle']),
      qteArticle: serializer.fromJson<int>(json['qteArticle']),
      idArticle: serializer.fromJson<int>(json['idArticle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPiece': serializer.toJson<int>(idPiece),
      'idOt': serializer.toJson<int?>(idOt),
      'codeArticle': serializer.toJson<String?>(codeArticle),
      'libelleArticle': serializer.toJson<String>(libelleArticle),
      'qteArticle': serializer.toJson<int>(qteArticle),
      'idArticle': serializer.toJson<int>(idArticle),
    };
  }

  Reservation copyWith(
          {int? idPiece,
          int? idOt,
          String? codeArticle,
          String? libelleArticle,
          int? qteArticle,
          int? idArticle}) =>
      Reservation(
        idPiece: idPiece ?? this.idPiece,
        idOt: idOt ?? this.idOt,
        codeArticle: codeArticle ?? this.codeArticle,
        libelleArticle: libelleArticle ?? this.libelleArticle,
        qteArticle: qteArticle ?? this.qteArticle,
        idArticle: idArticle ?? this.idArticle,
      );
  @override
  String toString() {
    return (StringBuffer('Reservation(')
          ..write('idPiece: $idPiece, ')
          ..write('idOt: $idOt, ')
          ..write('codeArticle: $codeArticle, ')
          ..write('libelleArticle: $libelleArticle, ')
          ..write('qteArticle: $qteArticle, ')
          ..write('idArticle: $idArticle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idPiece, idOt, codeArticle, libelleArticle, qteArticle, idArticle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reservation &&
          other.idPiece == this.idPiece &&
          other.idOt == this.idOt &&
          other.codeArticle == this.codeArticle &&
          other.libelleArticle == this.libelleArticle &&
          other.qteArticle == this.qteArticle &&
          other.idArticle == this.idArticle);
}

class ReservationsCompanion extends UpdateCompanion<Reservation> {
  final Value<int> idPiece;
  final Value<int?> idOt;
  final Value<String?> codeArticle;
  final Value<String> libelleArticle;
  final Value<int> qteArticle;
  final Value<int> idArticle;
  const ReservationsCompanion({
    this.idPiece = const Value.absent(),
    this.idOt = const Value.absent(),
    this.codeArticle = const Value.absent(),
    this.libelleArticle = const Value.absent(),
    this.qteArticle = const Value.absent(),
    this.idArticle = const Value.absent(),
  });
  ReservationsCompanion.insert({
    this.idPiece = const Value.absent(),
    this.idOt = const Value.absent(),
    this.codeArticle = const Value.absent(),
    required String libelleArticle,
    required int qteArticle,
    required int idArticle,
  })  : libelleArticle = Value(libelleArticle),
        qteArticle = Value(qteArticle),
        idArticle = Value(idArticle);
  static Insertable<Reservation> custom({
    Expression<int>? idPiece,
    Expression<int?>? idOt,
    Expression<String?>? codeArticle,
    Expression<String>? libelleArticle,
    Expression<int>? qteArticle,
    Expression<int>? idArticle,
  }) {
    return RawValuesInsertable({
      if (idPiece != null) 'id_piece': idPiece,
      if (idOt != null) 'id_ot': idOt,
      if (codeArticle != null) 'code_article': codeArticle,
      if (libelleArticle != null) 'libelle_article': libelleArticle,
      if (qteArticle != null) 'qte_article': qteArticle,
      if (idArticle != null) 'id_article': idArticle,
    });
  }

  ReservationsCompanion copyWith(
      {Value<int>? idPiece,
      Value<int?>? idOt,
      Value<String?>? codeArticle,
      Value<String>? libelleArticle,
      Value<int>? qteArticle,
      Value<int>? idArticle}) {
    return ReservationsCompanion(
      idPiece: idPiece ?? this.idPiece,
      idOt: idOt ?? this.idOt,
      codeArticle: codeArticle ?? this.codeArticle,
      libelleArticle: libelleArticle ?? this.libelleArticle,
      qteArticle: qteArticle ?? this.qteArticle,
      idArticle: idArticle ?? this.idArticle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPiece.present) {
      map['id_piece'] = Variable<int>(idPiece.value);
    }
    if (idOt.present) {
      map['id_ot'] = Variable<int?>(idOt.value);
    }
    if (codeArticle.present) {
      map['code_article'] = Variable<String?>(codeArticle.value);
    }
    if (libelleArticle.present) {
      map['libelle_article'] = Variable<String>(libelleArticle.value);
    }
    if (qteArticle.present) {
      map['qte_article'] = Variable<int>(qteArticle.value);
    }
    if (idArticle.present) {
      map['id_article'] = Variable<int>(idArticle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsCompanion(')
          ..write('idPiece: $idPiece, ')
          ..write('idOt: $idOt, ')
          ..write('codeArticle: $codeArticle, ')
          ..write('libelleArticle: $libelleArticle, ')
          ..write('qteArticle: $qteArticle, ')
          ..write('idArticle: $idArticle')
          ..write(')'))
        .toString();
  }
}

class $ReservationsTable extends Reservations
    with TableInfo<$ReservationsTable, Reservation> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ReservationsTable(this._db, [this._alias]);
  final VerificationMeta _idPieceMeta = const VerificationMeta('idPiece');
  late final GeneratedColumn<int?> idPiece = GeneratedColumn<int?>(
      'id_piece', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idOtMeta = const VerificationMeta('idOt');
  late final GeneratedColumn<int?> idOt = GeneratedColumn<int?>(
      'id_ot', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(idOt)');
  final VerificationMeta _codeArticleMeta =
      const VerificationMeta('codeArticle');
  late final GeneratedColumn<String?> codeArticle = GeneratedColumn<String?>(
      'code_article', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      typeName: 'TEXT',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Articles(idArticle)');
  final VerificationMeta _libelleArticleMeta =
      const VerificationMeta('libelleArticle');
  late final GeneratedColumn<String?> libelleArticle = GeneratedColumn<String?>(
      'libelle_article', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _qteArticleMeta = const VerificationMeta('qteArticle');
  late final GeneratedColumn<int?> qteArticle = GeneratedColumn<int?>(
      'qte_article', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idArticleMeta = const VerificationMeta('idArticle');
  late final GeneratedColumn<int?> idArticle = GeneratedColumn<int?>(
      'id_article', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idPiece, idOt, codeArticle, libelleArticle, qteArticle, idArticle];
  @override
  String get aliasedName => _alias ?? 'reservations';
  @override
  String get actualTableName => 'reservations';
  @override
  VerificationContext validateIntegrity(Insertable<Reservation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_piece')) {
      context.handle(_idPieceMeta,
          idPiece.isAcceptableOrUnknown(data['id_piece']!, _idPieceMeta));
    }
    if (data.containsKey('id_ot')) {
      context.handle(
          _idOtMeta, idOt.isAcceptableOrUnknown(data['id_ot']!, _idOtMeta));
    }
    if (data.containsKey('code_article')) {
      context.handle(
          _codeArticleMeta,
          codeArticle.isAcceptableOrUnknown(
              data['code_article']!, _codeArticleMeta));
    }
    if (data.containsKey('libelle_article')) {
      context.handle(
          _libelleArticleMeta,
          libelleArticle.isAcceptableOrUnknown(
              data['libelle_article']!, _libelleArticleMeta));
    } else if (isInserting) {
      context.missing(_libelleArticleMeta);
    }
    if (data.containsKey('qte_article')) {
      context.handle(
          _qteArticleMeta,
          qteArticle.isAcceptableOrUnknown(
              data['qte_article']!, _qteArticleMeta));
    } else if (isInserting) {
      context.missing(_qteArticleMeta);
    }
    if (data.containsKey('id_article')) {
      context.handle(_idArticleMeta,
          idArticle.isAcceptableOrUnknown(data['id_article']!, _idArticleMeta));
    } else if (isInserting) {
      context.missing(_idArticleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPiece};
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
  late final GeneratedColumn<int?> IDSITE = GeneratedColumn<int?>(
      'idsite', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _CODESITEMeta = const VerificationMeta('CODESITE');
  late final GeneratedColumn<String?> CODESITE = GeneratedColumn<String?>(
      'codesite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _NOMSITEMeta = const VerificationMeta('NOMSITE');
  late final GeneratedColumn<String?> NOMSITE = GeneratedColumn<String?>(
      'nomsite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _ADRESSESITEMeta =
      const VerificationMeta('ADRESSESITE');
  late final GeneratedColumn<String?> ADRESSESITE = GeneratedColumn<String?>(
      'adressesite', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
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
  final int? idOt;
  final String codeTache;
  final String libelleTache;
  final String statutTache;
  final String commentTache;
  final int idTache;
  Tache(
      {this.idOt,
      required this.codeTache,
      required this.libelleTache,
      required this.statutTache,
      required this.commentTache,
      required this.idTache});
  factory Tache.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tache(
      idOt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_ot']),
      codeTache: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code_tache'])!,
      libelleTache: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}libelle_tache'])!,
      statutTache: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statut_tache'])!,
      commentTache: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment_tache'])!,
      idTache: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_tache'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idOt != null) {
      map['id_ot'] = Variable<int?>(idOt);
    }
    map['code_tache'] = Variable<String>(codeTache);
    map['libelle_tache'] = Variable<String>(libelleTache);
    map['statut_tache'] = Variable<String>(statutTache);
    map['comment_tache'] = Variable<String>(commentTache);
    map['id_tache'] = Variable<int>(idTache);
    return map;
  }

  TachesCompanion toCompanion(bool nullToAbsent) {
    return TachesCompanion(
      idOt: idOt == null && nullToAbsent ? const Value.absent() : Value(idOt),
      codeTache: Value(codeTache),
      libelleTache: Value(libelleTache),
      statutTache: Value(statutTache),
      commentTache: Value(commentTache),
      idTache: Value(idTache),
    );
  }

  factory Tache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tache(
      idOt: serializer.fromJson<int?>(json['idOt']),
      codeTache: serializer.fromJson<String>(json['codeTache']),
      libelleTache: serializer.fromJson<String>(json['libelleTache']),
      statutTache: serializer.fromJson<String>(json['statutTache']),
      commentTache: serializer.fromJson<String>(json['commentTache']),
      idTache: serializer.fromJson<int>(json['idTache']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOt': serializer.toJson<int?>(idOt),
      'codeTache': serializer.toJson<String>(codeTache),
      'libelleTache': serializer.toJson<String>(libelleTache),
      'statutTache': serializer.toJson<String>(statutTache),
      'commentTache': serializer.toJson<String>(commentTache),
      'idTache': serializer.toJson<int>(idTache),
    };
  }

  Tache copyWith(
          {int? idOt,
          String? codeTache,
          String? libelleTache,
          String? statutTache,
          String? commentTache,
          int? idTache}) =>
      Tache(
        idOt: idOt ?? this.idOt,
        codeTache: codeTache ?? this.codeTache,
        libelleTache: libelleTache ?? this.libelleTache,
        statutTache: statutTache ?? this.statutTache,
        commentTache: commentTache ?? this.commentTache,
        idTache: idTache ?? this.idTache,
      );
  @override
  String toString() {
    return (StringBuffer('Tache(')
          ..write('idOt: $idOt, ')
          ..write('codeTache: $codeTache, ')
          ..write('libelleTache: $libelleTache, ')
          ..write('statutTache: $statutTache, ')
          ..write('commentTache: $commentTache, ')
          ..write('idTache: $idTache')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idOt, codeTache, libelleTache, statutTache, commentTache, idTache);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tache &&
          other.idOt == this.idOt &&
          other.codeTache == this.codeTache &&
          other.libelleTache == this.libelleTache &&
          other.statutTache == this.statutTache &&
          other.commentTache == this.commentTache &&
          other.idTache == this.idTache);
}

class TachesCompanion extends UpdateCompanion<Tache> {
  final Value<int?> idOt;
  final Value<String> codeTache;
  final Value<String> libelleTache;
  final Value<String> statutTache;
  final Value<String> commentTache;
  final Value<int> idTache;
  const TachesCompanion({
    this.idOt = const Value.absent(),
    this.codeTache = const Value.absent(),
    this.libelleTache = const Value.absent(),
    this.statutTache = const Value.absent(),
    this.commentTache = const Value.absent(),
    this.idTache = const Value.absent(),
  });
  TachesCompanion.insert({
    this.idOt = const Value.absent(),
    required String codeTache,
    required String libelleTache,
    required String statutTache,
    required String commentTache,
    required int idTache,
  })  : codeTache = Value(codeTache),
        libelleTache = Value(libelleTache),
        statutTache = Value(statutTache),
        commentTache = Value(commentTache),
        idTache = Value(idTache);
  static Insertable<Tache> custom({
    Expression<int?>? idOt,
    Expression<String>? codeTache,
    Expression<String>? libelleTache,
    Expression<String>? statutTache,
    Expression<String>? commentTache,
    Expression<int>? idTache,
  }) {
    return RawValuesInsertable({
      if (idOt != null) 'id_ot': idOt,
      if (codeTache != null) 'code_tache': codeTache,
      if (libelleTache != null) 'libelle_tache': libelleTache,
      if (statutTache != null) 'statut_tache': statutTache,
      if (commentTache != null) 'comment_tache': commentTache,
      if (idTache != null) 'id_tache': idTache,
    });
  }

  TachesCompanion copyWith(
      {Value<int?>? idOt,
      Value<String>? codeTache,
      Value<String>? libelleTache,
      Value<String>? statutTache,
      Value<String>? commentTache,
      Value<int>? idTache}) {
    return TachesCompanion(
      idOt: idOt ?? this.idOt,
      codeTache: codeTache ?? this.codeTache,
      libelleTache: libelleTache ?? this.libelleTache,
      statutTache: statutTache ?? this.statutTache,
      commentTache: commentTache ?? this.commentTache,
      idTache: idTache ?? this.idTache,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOt.present) {
      map['id_ot'] = Variable<int?>(idOt.value);
    }
    if (codeTache.present) {
      map['code_tache'] = Variable<String>(codeTache.value);
    }
    if (libelleTache.present) {
      map['libelle_tache'] = Variable<String>(libelleTache.value);
    }
    if (statutTache.present) {
      map['statut_tache'] = Variable<String>(statutTache.value);
    }
    if (commentTache.present) {
      map['comment_tache'] = Variable<String>(commentTache.value);
    }
    if (idTache.present) {
      map['id_tache'] = Variable<int>(idTache.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TachesCompanion(')
          ..write('idOt: $idOt, ')
          ..write('codeTache: $codeTache, ')
          ..write('libelleTache: $libelleTache, ')
          ..write('statutTache: $statutTache, ')
          ..write('commentTache: $commentTache, ')
          ..write('idTache: $idTache')
          ..write(')'))
        .toString();
  }
}

class $TachesTable extends Taches with TableInfo<$TachesTable, Tache> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TachesTable(this._db, [this._alias]);
  final VerificationMeta _idOtMeta = const VerificationMeta('idOt');
  late final GeneratedColumn<int?> idOt = GeneratedColumn<int?>(
      'id_ot', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES Ot(idOt)');
  final VerificationMeta _codeTacheMeta = const VerificationMeta('codeTache');
  late final GeneratedColumn<String?> codeTache = GeneratedColumn<String?>(
      'code_tache', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 24),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _libelleTacheMeta =
      const VerificationMeta('libelleTache');
  late final GeneratedColumn<String?> libelleTache = GeneratedColumn<String?>(
      'libelle_tache', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 48),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _statutTacheMeta =
      const VerificationMeta('statutTache');
  late final GeneratedColumn<String?> statutTache = GeneratedColumn<String?>(
      'statut_tache', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 1),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _commentTacheMeta =
      const VerificationMeta('commentTache');
  late final GeneratedColumn<String?> commentTache = GeneratedColumn<String?>(
      'comment_tache', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 2018),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _idTacheMeta = const VerificationMeta('idTache');
  late final GeneratedColumn<int?> idTache = GeneratedColumn<int?>(
      'id_tache', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idOt, codeTache, libelleTache, statutTache, commentTache, idTache];
  @override
  String get aliasedName => _alias ?? 'taches';
  @override
  String get actualTableName => 'taches';
  @override
  VerificationContext validateIntegrity(Insertable<Tache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ot')) {
      context.handle(
          _idOtMeta, idOt.isAcceptableOrUnknown(data['id_ot']!, _idOtMeta));
    }
    if (data.containsKey('code_tache')) {
      context.handle(_codeTacheMeta,
          codeTache.isAcceptableOrUnknown(data['code_tache']!, _codeTacheMeta));
    } else if (isInserting) {
      context.missing(_codeTacheMeta);
    }
    if (data.containsKey('libelle_tache')) {
      context.handle(
          _libelleTacheMeta,
          libelleTache.isAcceptableOrUnknown(
              data['libelle_tache']!, _libelleTacheMeta));
    } else if (isInserting) {
      context.missing(_libelleTacheMeta);
    }
    if (data.containsKey('statut_tache')) {
      context.handle(
          _statutTacheMeta,
          statutTache.isAcceptableOrUnknown(
              data['statut_tache']!, _statutTacheMeta));
    } else if (isInserting) {
      context.missing(_statutTacheMeta);
    }
    if (data.containsKey('comment_tache')) {
      context.handle(
          _commentTacheMeta,
          commentTache.isAcceptableOrUnknown(
              data['comment_tache']!, _commentTacheMeta));
    } else if (isInserting) {
      context.missing(_commentTacheMeta);
    }
    if (data.containsKey('id_tache')) {
      context.handle(_idTacheMeta,
          idTache.isAcceptableOrUnknown(data['id_tache']!, _idTacheMeta));
    } else if (isInserting) {
      context.missing(_idTacheMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeTache};
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

abstract class _$IomerDatabase extends GeneratedDatabase {
  _$IomerDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $EquipementsTable equipements = $EquipementsTable(this);
  late final $MatriculesTable matricules = $MatriculesTable(this);
  late final $OriginesTable origines = $OriginesTable(this);
  late final $OtTable ot = $OtTable(this);
  late final $ReservationsTable reservations = $ReservationsTable(this);
  late final $SitesTable sites = $SitesTable(this);
  late final $TachesTable taches = $TachesTable(this);
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
        ot,
        reservations,
        sites,
        taches
      ];
}
