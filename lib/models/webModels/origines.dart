class Origines {
  final int idOrigine;
  final int idSite;
  final String codeOrigine;
  final String libelleOrigine;

  Origines({
    required this.idOrigine,
    required this.idSite,
    required this.codeOrigine,
    required this.libelleOrigine,
  });

  factory Origines.fromJson(Map<String, dynamic> json) {
    return Origines(
      idOrigine: json['IDORIGINE'],
      idSite: json['IDSITE'],
      codeOrigine: json['CODEORIGINE'],
      libelleOrigine: json['LIBELLEORIGINE'],
    );
  }
}
