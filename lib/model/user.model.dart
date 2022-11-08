import 'package:inter_war/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.privateId,
    required this.campus,
    required this.name,
    this.id,
    this.kisses = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // TODO: when working with a backend create a public id there to be assigned here
  String? id;
  String privateId;
  Campus campus;
  String name;
  List<Kiss> kisses;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
