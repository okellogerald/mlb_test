// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      games: Games.fromJson(json['games'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'games': instance.games.toJson(),
    };
