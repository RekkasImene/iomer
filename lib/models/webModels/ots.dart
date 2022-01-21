class OTs {
  final int idOT;
  final int idOrigine;
  final int idEquipement;
  final int idCategorie;
  final String codeOT;
  final String libelleOT;
  final String commentOT;
  final String tempsOT;
  final String statusOT;

  OTs({
    required this.idOrigine,
    required this.idEquipement,
    required this.idCategorie,
    required this.idOT,
    required this.codeOT,
    required this.libelleOT,
    required this.commentOT,
    required this.statusOT,
    required this.tempsOT,
  });

  factory OTs.fromJson(Map<String, dynamic> json) {
    return OTs(
      idOT: json['IDOT'],
      idCategorie: json['IDCATEGORIE'],
      idOrigine: json['IDORIGINE'],
      idEquipement: json['IDEQUIPEMENT'],
      commentOT: json['COMMENTOT'],
      codeOT: json['CODEOT'],
      libelleOT: json['LIBELLEOT'],
      tempsOT: json['TEMPSOT'],
      statusOT: json['STATUSOT'],
    );
  }
}
