import 'package:inter_war/model/kiss/points_strategy.dart';
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
    this.metadata = "",
  });

  factory Kiss.fromJson(Map<String, dynamic> json) => _$KissFromJson(json);

  String? id;
  String timestamp;
  Campus campus;
  List<String> traits;
  String? metadata;

  int _getTraitPoints() {
    final traitPoints = Trait.values.entries
        .where((traitPair) => traits.contains(traitPair.key))
        .map((traitPair) => traitPair.value);
    if (traitPoints.isEmpty) {
      return 0;
    }
    return traitPoints.reduce((acc, cur) {
      return acc + cur;
    });
  }

  int _getStrategiesPoints(Campus userCampus) {
    return PointsStrategy.strategies.map(
      (strategy) {
        return strategy.getPoints(userCampus, this);
      },
    ).reduce((acc, cur) {
      return acc + cur;
    });
  }

  int getPoints(Campus userCampus) {
    return _getTraitPoints() + _getStrategiesPoints(userCampus);
  }

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
    "Formada": 100,
    "Você casou :(": -20,
  };
}
