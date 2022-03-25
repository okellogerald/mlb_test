import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part '../g_models/payload.g.dart';


@JsonSerializable(explicitToJson: true)

class PayLoad {
  PayLoad({required this.subject, required this.copyright, required this.data});
@JsonKey(name: 'subject')
  String subject;
@JsonKey(name: 'copyright')
  String copyright;
@JsonKey(name: 'data')
  Data data;

  factory PayLoad.fromJson(Map<String, dynamic> json) =>
      _$PayLoadFromJson(json);

  Map<String, dynamic> toJson() => _$PayLoadToJson(this);
}
