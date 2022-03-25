import 'package:json_annotation/json_annotation.dart';

import 'games.dart';

part '../g_models/data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data{
  Data({required this.games});
@JsonKey(name: 'games')
  Games games;


  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}