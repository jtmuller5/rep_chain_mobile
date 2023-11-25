import 'package:json_annotation/json_annotation.dart';

part 'reputation.g.dart';

@JsonSerializable(explicitToJson: true)
class Reputation {
  @JsonKey(name: 'User')
  String? user;

  @JsonKey(name: 'Date')
  DateTime? date;

  @JsonKey(name: 'Value')
  int? value;

  @JsonKey(name: 'Platform')
  String? platform;

  @JsonKey(name: 'Metric')
  String? metric;

  Reputation({
    this.user,
    this.date,
    this.value,
    this.platform,
    this.metric,
  });

  factory Reputation.fromJson(Map<String, dynamic> json) => _$ReputationFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationToJson(this);
}