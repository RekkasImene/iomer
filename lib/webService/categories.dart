class Categories {
  final int idSite;
  final int idCategorie;
  final String codeCategorie;
  final String libelleCategorie;

  Categories({
    required this.idSite,
    required this.idCategorie,
    required this.codeCategorie,
    required this.libelleCategorie,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      idSite: json['IDSITE'],
      idCategorie: json['IDCATEGORIE'],
      codeCategorie: json['CODECATEGORIE'],
      libelleCategorie: json['LIBELLECATEGORIE'],
    );
  }
}