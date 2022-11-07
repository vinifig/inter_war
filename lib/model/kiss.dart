import 'package:interunesp_war/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kiss.g.dart';

@JsonSerializable(explicitToJson: true)
class Kiss {
  Kiss({
    required this.id,
    required this.timestamp,
    required this.campus,
    this.traits = const [],
  });

  factory Kiss.fromJson(Map<String, dynamic> json) => _$KissFromJson(json);

  String id;
  String timestamp;
  Campus campus;
  List<Trait> traits;

  Map<String, dynamic> toJson() => _$KissToJson(this);
}

enum Trait { warVeteran }
