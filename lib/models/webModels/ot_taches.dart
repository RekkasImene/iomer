class OTTaches {
  final int idOT;
  final int idTache;
  final String codeTache;
  final String libelleTache;
  final String commentTache;
  final String statusTache;


  OTTaches({
    required this.idTache,
    required this.idOT,
    required this.codeTache,
    required this.libelleTache,
    required this.commentTache,
    required this.statusTache,
  });

  factory OTTaches.fromJson(Map<String, dynamic> json) {
    return OTTaches(
      idOT: json ['IDOT'],
      idTache: json['IDTACHE'],
      commentTache: json['COMMENTTACHE'],
      codeTache: json['CODETACHE'],
      libelleTache: json['LIBELLETACHE'],
      statusTache:json['STATUSTACHE'] ,

    );
  }
}