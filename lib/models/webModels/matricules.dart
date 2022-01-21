class Matricules {
  final int idOrigine;
  final int idMatricule;
  final String codeMatricule;
  final String nomMatricule;
  final String prenomMatricule;

  Matricules({
    required this.idOrigine,
    required this.idMatricule,
    required this.codeMatricule,
    required this.nomMatricule,
    required this.prenomMatricule,
  });

  factory Matricules.fromJson(Map<String, dynamic> json) {
    return Matricules(
      idOrigine: json['IDORIGINE'],
      idMatricule: json['IDMATRICULE'],
      codeMatricule: json['CODEMATRICULE'],
      nomMatricule: json['NOMMATRICULE'],
      prenomMatricule: json['PRENOMMATRICULE'],
    );
  }
}
