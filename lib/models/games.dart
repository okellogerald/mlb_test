import 'package:json_annotation/json_annotation.dart';

import 'game.dart';
part '../g_models/games.g.dart';

@JsonSerializable(explicitToJson: true)
class Games{
  Games({
    required this.game,
});
  @JsonKey(name: 'game')
  List<Game> game;

  factory Games.fromJson(Map<String, dynamic> json) =>
      _$GamesFromJson(json);

  Map<String, dynamic> toJson() => _$GamesToJson(this);
}