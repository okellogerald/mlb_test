import 'package:json_annotation/json_annotation.dart';

import 'rr.dart';
part '../g_models/linescore.g.dart';

@JsonSerializable(explicitToJson: true)
class Linescore{
  @JsonKey(name: 'r')
  R r;
  Linescore({
    required this.r
});

  factory Linescore.fromJson(Map<String, dynamic> json) =>
      _$LinescoreFromJson(json);

  Map<String, dynamic> toJson() => _$LinescoreToJson(this);
}