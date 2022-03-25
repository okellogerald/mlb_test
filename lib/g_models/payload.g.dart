// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayLoad _$PayLoadFromJson(Map<String, dynamic> json) => PayLoad(
      subject: json['subject'] as String,
      copyright: json['copyright'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayLoadToJson(PayLoad instance) => <String, dynamic>{
      'subject': instance.subject,
      'copyright': instance.copyright,
      'data': instance.data.toJson(),
    };
