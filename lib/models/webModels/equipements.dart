class Equipements {
  final int idSite;
  final int idEquipement;
  final String codeEquipement;
  final String libelleEquipement;

  Equipements({
    required this.idSite,
    required this.idEquipement,
    required this.codeEquipement,
    required this.libelleEquipement,
  });

  factory Equipements.fromJson(Map<String, dynamic> json) {
    return Equipements(
      idSite: json['IDSITE'],
      idEquipement: json['IDEQUIPEMENT'],
      codeEquipement: json['CODEEQUIPEMENT'],
      libelleEquipement: json['LIBELLEEQUIPEMENT'],
    );
  }
}
