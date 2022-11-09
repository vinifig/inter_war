import 'dart:math';

import 'package:inter_war/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kiss.model.g.dart';

@JsonSerializable(explicitToJson: true)
class Kiss {
  Kiss({
    required this.timestamp,
    required this.campus,
    this.id,
    this.traits = const [],
  });

  factory Kiss.fromJson(Map<String, dynamic> json) => _$KissFromJson(json);

  String? id;
  String timestamp;
  Campus campus;
  List<String> traits;

  int get points => Random().nextInt(500);

  Map<String, dynamic> toJson() => _$KissToJson(this);
}

class Trait {
  static final values = <String, int>{
    "Velha Guarda (<2016)": 300,
    "Mestre de Bateria": 100,
    "Exótica": 200,
    "Cheer / Ritmista": 50,
    "Foi em +10 inters": 1000,
    "Dinossauros da Unesp (<2011)": 500,
    "Poliatleta(4+)": 300,
    "Era o Mêw": 600,
  };
}
