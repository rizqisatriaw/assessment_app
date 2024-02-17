import 'question.dart';

class TestAssessment {
  final String? id;
  final String? name;
  final List<Question>? question;

  TestAssessment({
    this.id,
    this.name,
    this.question,
  });

  factory TestAssessment.fromJson(Map<String, dynamic> json) => TestAssessment(
        id: json["id"],
        name: json["name"],
        question: json["question"] == null
            ? []
            : List<Question>.from(
                json["question"]!.map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "question": question == null
            ? []
            : List<dynamic>.from(question!.map((x) => x.toJson())),
      };
}
