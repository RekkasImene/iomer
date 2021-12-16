class Site {
  final int idsite;
  final String codesite;
  final String nomsite;
  final String adressesite;

  Site({
    required this.idsite,
    required this.codesite,
    required this.nomsite,
    required this.adressesite,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      idsite: json['IDSITE'],
      codesite: json['CODESITE'],
      nomsite: json['NOMSITE'],
      adressesite: json['ADRESSESITE'],
    );
  }
}