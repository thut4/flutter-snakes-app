import 'dart:convert';

List<SnakesModel> productsFromJson(String str) => List<SnakesModel>.from(
    json.decode(str).map((x) => SnakesModel.fromJson(x)));

String productsToJson(List<SnakesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SnakesModel {
  int id;
  String mmName;
  String engName;
  String detail;
  Is isPoison;
  Is isDanger;

  SnakesModel({
    required this.id,
    required this.mmName,
    required this.engName,
    required this.detail,
    required this.isPoison,
    required this.isDanger,
  });

  factory SnakesModel.fromJson(Map<String, dynamic> json) => SnakesModel(
        id: json["Id"],
        mmName: json["MMName"] ?? '',
        engName: json["EngName"] ?? '-',
        detail: json["Detail"],
        isPoison: isValues.map[json["IsPoison"]]!,
        isDanger: isValues.map[json["IsDanger"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "MMName": mmName,
        "EngName": engName,
        "Detail": detail,
        "IsPoison": _enumToString(isValues.reverse[isPoison]),
        "IsDanger": _enumToString(isValues.reverse[isDanger]),
      };

  String _enumToString(dynamic value) {
    // Handle null or unexpected values gracefully
    return value?.toString() ?? '';
  }

  String get isDangerString => _enumToString(isValues.reverse[isDanger]);
  String get isPoisonString => _enumToString(isValues.reverse[isPoison]);
}

enum Is { IS_YES, NO, YES }

final isValues = EnumValues({"Yes ": Is.YES, "No": Is.NO, "Yes": Is.YES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
