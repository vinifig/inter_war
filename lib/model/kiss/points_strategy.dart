import 'package:inter_war/model/model.dart';

abstract class PointsStrategy {
  int getPoints(Campus userCampus, Kiss kiss);

  static final strategies = <PointsStrategy>[
    TuscaPointsStrategy(),
    SameCampusPointsStrategy(),
    UnespPointsStrategy(),
    UnespShinyPointsStrategy(),
    UnespFarFarAwayPointsStrategy(),
    UnespBotucatuPointsStrategy(),
    UnespBauruPointsStrategy(),
  ];
}

// todo: refactor to use int Function(bool Function(Campus userCampus, Kiss kiss) condition, int points)
// [
//  handleKissPoints(unespCondition, 10),
//  handleKissPoints(unespShinyCondition, 250),
// ]
class UnespPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    const notAppliableCampus = [Campus.usp, Campus.federal, Campus.outro];
    if (notAppliableCampus.contains(kiss.campus)) {
      return 10;
    }
    return 0;
  }
}

class UnespShinyPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    const appliableCampus = [
      Campus.saoVicente,
      Campus.saoPaulo,
      Campus.saoJoaoDaBoaVista,
      Campus.registro,
      Campus.ourinhos,
    ];
    if (appliableCampus.contains(kiss.campus)) {
      return 250;
    }
    return 0;
  }
}

class UnespFarFarAwayPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    const appliableCampus = [
      Campus.ilhaSolteira,
      Campus.presidentePrudente,
    ];
    if (appliableCampus.contains(kiss.campus)) {
      return 50;
    }
    return 0;
  }
}

class UnespBotucatuPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    if (kiss.campus == Campus.botucatu) {
      return 5;
    }
    return 0;
  }
}

class UnespBauruPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    if (kiss.campus == Campus.botucatu) {
      return 1;
    }
    return 0;
  }
}

class TuscaPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    const appliableCampus = [Campus.usp, Campus.federal];
    if (appliableCampus.contains(kiss.campus)) {
      return -50;
    }
    return 0;
  }
}

class SameCampusPointsStrategy extends PointsStrategy {
  @override
  int getPoints(Campus userCampus, Kiss kiss) {
    return userCampus == kiss.campus ? -10 : 0;
  }
}
