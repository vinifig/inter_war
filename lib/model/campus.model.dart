enum Campus {
  bauru, // <3
  none
}

extension CampusMethods on Campus {
  String get value => toString().split(".")[1];
}

final List<String> campusesValues =
    Campus.values.map((campus) => campus.toString().split(".")[1]).toList();
