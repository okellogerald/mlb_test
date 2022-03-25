// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      homeTeamName: json['home_team_name'] as String,
      awayTeamName: json['away_team_name'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      linescore: Linescore.fromJson(json['linescore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'home_team_name': instance.homeTeamName,
      'away_team_name': instance.awayTeamName,
      'status': instance.status.toJson(),
      'linescore': instance.linescore.toJson(),
    };
