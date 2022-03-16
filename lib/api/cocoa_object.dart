class Cocoa {
  late String id, mes, ultimo, hora, grafico;
  late int variable, apertura, maximo, minimo, volumen;

  Cocoa(
      {required this.id,
      required this.mes,
      required this.ultimo,
      required this.hora,
      required this.grafico,
      required this.variable,
      required this.apertura,
      required this.maximo,
      required this.minimo,
      required this.volumen});

  static Cocoa fromJson(Map<String, dynamic> cocoaJson) {
    return Cocoa(
        id: cocoaJson["Unnamed: 0"].toString(),
        mes: cocoaJson["Mes"],
        ultimo: cocoaJson["Último"],
        hora: cocoaJson["Hora"],
        grafico: cocoaJson["Gráfico"],
        variable: cocoaJson["Var."],
        apertura: cocoaJson["Apertura"],
        maximo: cocoaJson["Máximo"],
        minimo: cocoaJson["Mínimo"],
        volumen: cocoaJson["Volumen"]
        );
  }
}
