import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  const ReportModel({
    this.image = '',
    this.description = '',
  });

  final String? image;
  final String? description;

  ReportModel copyWith({
    String? image,
    String? description,
  }) =>
      ReportModel(
        image: image ?? this.image,
        description: description ?? this.description,
      );

  factory ReportModel.fromRawJson(String str) =>
      ReportModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}
