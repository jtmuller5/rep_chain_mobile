// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reputation _$ReputationFromJson(Map<String, dynamic> json) => Reputation(
      user: json['User'] as String?,
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      value: json['Value'] as int?,
      platform: json['Platform'] as String?,
      metric: json['Metric'] as String?,
    );

Map<String, dynamic> _$ReputationToJson(Reputation instance) =>
    <String, dynamic>{
      'User': instance.user,
      'Date': instance.date?.toIso8601String(),
      'Value': instance.value,
      'Platform': instance.platform,
      'Metric': instance.metric,
    };
