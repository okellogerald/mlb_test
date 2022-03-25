import 'package:json_annotation/json_annotation.dart';
part '../g_models/rr.g.dart';

@JsonSerializable(explicitToJson: true)
   class R{
  @JsonKey(name: 'home')
   String home;

  @JsonKey(name: 'away')
   String away;

  R({
    required this.home, required this.away
});

  factory R.fromJson(Map<String, dynamic> json) => _$RFromJson(json);

  Map<String, dynamic> toJson() => _$RToJson(this);
}