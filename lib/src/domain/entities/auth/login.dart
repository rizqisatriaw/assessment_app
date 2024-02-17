class Login {
  final String? userId;
  final String? nik;
  final int? systemRoleId;
  final String? systemRole;
  final String? name;
  final String? email;
  final String? phone;
  final String? departementId;
  final String? departement;
  final String? siteLocationId;
  final String? siteLocation;

  Login({
    this.userId,
    this.nik,
    this.systemRoleId,
    this.systemRole,
    this.name,
    this.email,
    this.phone,
    this.departementId,
    this.departement,
    this.siteLocationId,
    this.siteLocation,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json["user_id"],
        nik: json["nik"],
        systemRoleId: json["system_role_id"],
        systemRole: json["system_role"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        departementId: json["departement_id"],
        departement: json["departement"],
        siteLocationId: json["site_location_id"],
        siteLocation: json["site_location"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "nik": nik,
        "system_role_id": systemRoleId,
        "system_role": systemRole,
        "name": name,
        "email": email,
        "phone": phone,
        "departement_id": departementId,
        "departement": departement,
        "site_location_id": siteLocationId,
        "site_location": siteLocation,
      };
}
