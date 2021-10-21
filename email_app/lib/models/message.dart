import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Message {
  String subject;
  String body;

  Message(this.subject, this.body);
}
