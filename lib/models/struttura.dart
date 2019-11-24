class Struttura {
  int idStruttura;
  String tipo;
  String denominazione;
  String regione;
  String provincia;
  String comune;
  String localita;
  String indirizzo;
  List<dynamic> specializzazioni;
  String CAP;
  String telefono;
  double rating;
  bool isCooperativa;

  Struttura.fromJson(Map<String, dynamic> json)
      : idStruttura = json['IDStruttura'],
        tipo = json['TipoStruttura'],
        denominazione = json['Denominazione'],
        regione = json['Regione'],
        provincia = json['Provincia'],
        comune = json['Comune'],
        localita = json['Localita'],
        indirizzo = json['Indirizzo'],
        specializzazioni = json['Specializzazioni'],
        CAP = json['CAP'],
        telefono = json['Telefono'],
        rating = json['Rating'],
        isCooperativa = json['isCooperativa'];
}
