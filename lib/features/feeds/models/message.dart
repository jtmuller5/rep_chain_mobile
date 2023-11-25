import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  String? content;

  Message({
    this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
