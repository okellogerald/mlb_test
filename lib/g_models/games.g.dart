// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/games.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Games _$GamesFromJson(Map<String, dynamic> json) => Games(
      game: (json['game'] as List<dynamic>)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'game': instance.game.map((e) => e.toJson()).toList(),
    };
