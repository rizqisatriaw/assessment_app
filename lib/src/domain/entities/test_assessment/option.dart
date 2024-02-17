class Option {
  final String? optionid;
  final String? optionName;
  final int? points;
  final int? flag;

  Option({
    this.optionid,
    this.optionName,
    this.points,
    this.flag,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionid: json["optionid"],
        optionName: json["option_name"],
        points: json["points"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "optionid": optionid,
        "option_name": optionName,
        "points": points,
        "flag": flag,
      };
}
