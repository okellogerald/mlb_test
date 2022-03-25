import 'package:json_annotation/json_annotation.dart';
import 'package:mlb_test1/models/status.dart';
import 'package:mlb_test1/models/linescore.dart';
part '../g_models/game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  @JsonKey(name: 'home_team_name')
  String homeTeamName;

  @JsonKey(name: 'away_team_name')
  String awayTeamName;

  @JsonKey(name: 'status')
  Status status;

  @JsonKey(name: 'linescore')
  Linescore linescore;

  Game({
      required this.homeTeamName,
      required this.awayTeamName,
      required this.status,
      required this.linescore
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
