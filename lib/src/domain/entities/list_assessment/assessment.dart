import 'participant.dart';

class Assessment {
  final String? id;
  final String? name;
  final String? assessmentDate;
  final String? description;
  final String? type;
  final int? roleAssessor;
  final String? roleAssessorName;
  final int? roleParticipant;
  final String? roleParticipantName;
  final String? departementId;
  final String? siteLocationId;
  final String? image;
  final List<Participant>? participants;
  final String? createdAt;
  final String? updatedAt;

  Assessment({
    this.id,
    this.name,
    this.assessmentDate,
    this.description,
    this.type,
    this.roleAssessor,
    this.roleAssessorName,
    this.roleParticipant,
    this.roleParticipantName,
    this.departementId,
    this.siteLocationId,
    this.image,
    this.participants,
    this.createdAt,
    this.updatedAt,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
        id: json["id"],
        name: json["name"],
        assessmentDate: json["assessment_date"],
        description: json["description"],
        type: json["type"],
        roleAssessor: json["role_assessor"],
        roleAssessorName: json["role_assessor_name"],
        roleParticipant: json["role_participant"],
        roleParticipantName: json["role_participant_name"],
        departementId: json["departement_id"],
        siteLocationId: json["site_location_id"],
        image: json["image"],
        participants: json["participants"] == null
            ? []
            : List<Participant>.from(
                json["participants"]!.map((x) => Participant.fromJson(x))),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
