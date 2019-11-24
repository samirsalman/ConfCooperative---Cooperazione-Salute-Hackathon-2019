class User {
  String nome;
  String cognome;
  int eta;
  String email;
  String coopRif;
  bool nucleo;
  String id;
  int idPersona;
  String citta;
  String sesso;
  String telefono;
  int prestazioni;
  int analisi;
  int odontogliatria;



  User.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        email = json['email'],
        cognome = json['cognome'],
        eta = json['eta'],
        nucleo = json['nucleo'],
        id = json['idSussidio'],
        sesso = json['sesso'],
        coopRif = json['coopRiferimento'],
        telefono = json['telefono'],
        citta = json['citta'],
        prestazioni = json['sussidio']['prestazioni'],
        analisi = json['sussidio']['analisi'],
        odontogliatria = json['sussidio']['odontogliatria'],
        idPersona = json['idPersona'];
}
