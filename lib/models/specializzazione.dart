class Specializzazione {
  int id;
  String nome;

  Specializzazione.fromJson(Map<String, dynamic> json)
      : id = json['IDSpecializzazione'],
        nome = json['Nome'];
}
