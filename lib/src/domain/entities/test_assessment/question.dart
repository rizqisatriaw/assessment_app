import 'option.dart';

class Question {
  final String? questionid;
  final String? section;
  final String? number;
  final String? type;
  final String? questionName;
  final bool? scoring;
  final List<Option>? options;

  Question({
    this.questionid,
    this.section,
    this.number,
    this.type,
    this.questionName,
    this.scoring,
    this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionid: json["questionid"],
        section: json["section"],
        number: json["number"],
        type: json["type"],
        questionName: json["question_name"],
        scoring: json["scoring"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionid": questionid,
        "section": section,
        "number": number,
        "type": type,
        "question_name": questionName,
        "scoring": scoring,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}
