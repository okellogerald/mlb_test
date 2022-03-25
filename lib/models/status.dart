import 'package:json_annotation/json_annotation.dart';
part '../g_models/status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status{
  @JsonKey(name: 'status')
  String status;

  Status({
    required this.status
});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}