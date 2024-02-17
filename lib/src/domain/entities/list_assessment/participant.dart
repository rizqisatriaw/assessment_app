class Participant {
  final String? nik;
  final String? name;
  final String? departement;
  final String? role;
  final String? siteLocation;
  final int? totalAssessment;
  final String? lastAssessment;
  final String? imageProfile;

  Participant({
    this.nik,
    this.name,
    this.departement,
    this.role,
    this.siteLocation,
    this.totalAssessment,
    this.lastAssessment,
    this.imageProfile,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        nik: json["nik"],
        name: json["name"],
        departement: json["departement"],
        role: json["role"],
        siteLocation: json["site_location"],
        totalAssessment: json["total_assessment"],
        lastAssessment: json["last_assessment"],
        imageProfile: json["image_profile"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "name": name,
        "departement": departement,
        "role": role,
        "site_location": siteLocation,
        "total_assessment": totalAssessment,
        "last_assessment": lastAssessment,
        "image_profile": imageProfile,
      };
}
