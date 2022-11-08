import 'package:interunesp_war/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.id,
    required this.privateId,
    required this.campus,
    this.kisses = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String id;
  String privateId;
  Campus campus;
  List<Kiss> kisses;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
