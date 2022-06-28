import 'dart:convert';

class PincodeModel {
  final List<Result> result;

  PincodeModel({
    required this.result,
  });

  factory PincodeModel.fromJson(String str) =>
      PincodeModel.fromMap(json.decode(str));

  factory PincodeModel.fromMap(Map<String, dynamic> json) => PincodeModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  final String pincode;

  Result({
    required this.pincode,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        pincode: json["Pincode"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "Pincode": pincode,
      };
}
