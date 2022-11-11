enum Campus {
  araraquara,
  assis,
  bauru,
  botucatu,
  dracena,
  franca,
  guaratingueta,
  ilhaSolteira,
  itapeva,
  jaboticabal,
  marilia,
  ourinhos,
  presidentePrudente,
  registro,
  rioClaro,
  rosana,
  saoJoaoDaBoaVista,
  saoJoseDoRioPreto,
  saoJoseDosCampos,
  saoPaulo,
  saoVicente,
  sorocaba,
  tupa,
  usp,
  federal,
  outro,
}

extension CampusMethods on Campus {
  String get value => toString().split(".")[1];
}
