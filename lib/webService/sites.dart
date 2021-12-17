class Sites {
  final int idsite;
  final String codesite;
  final String nomsite;
  final String adressesite;

  Sites({
    required this.idsite,
    required this.codesite,
    required this.nomsite,
    required this.adressesite,
  });

  factory Sites.fromJson(Map<String, dynamic> json) {
    return Sites(
      idsite: json['IDSITE'],
      codesite: json['CODESITE'],
      nomsite: json['NOMSITE'],
      adressesite: json['ADRESSESITE'],
    );
  }
}