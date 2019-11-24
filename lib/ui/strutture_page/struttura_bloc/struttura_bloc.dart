import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:confsalute/models/specializzazione.dart';
import 'package:confsalute/models/struttura.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import './bloc.dart';

class StrutturaBloc extends Bloc<StrutturaEvent, StrutturaState> {
  @override
  StrutturaState get initialState => Loading();

  List<Struttura> strutture = List();
  Map<String, List<Struttura>> strutturaSpecializzazione = Map();
  List<Specializzazione> specializzazioni = List();
  List<Specializzazione> temp = List();
  Map<String, List<Struttura>> strutturaTipo = Map();
  Map<String, List<Struttura>> strutturaLuogo = Map();
  List<Struttura> cooperative = List();

  @override
  Stream<StrutturaState> mapEventToState(
    StrutturaEvent event,
  ) async* {
    if (event is GetData) {
      yield (Loading());
      await getData();
      yield (Loaded());
    }

    if (event is LoadedData) {
      yield (Loaded());
    }
  }

  Future getData() async {
    Response response = await http.get(
      "http://salutewebapi.azurewebsites.net/api/struttura",
    );

    Response responseSpec = await http.get(
      "http://salutewebapi.azurewebsites.net/api/specializzazioni",
    );

    var jsonData = json.decode(response.body);
    var jsonDataSpec = json.decode(responseSpec.body);

    for (var j = 0; j < jsonDataSpec.length; j++) {
      specializzazioni.add(Specializzazione.fromJson(jsonDataSpec[j]));
    }
    temp = List();
    temp.addAll(specializzazioni);

    for (var i = 0; i < jsonData.length; i++) {
      Struttura struttura = Struttura.fromJson(jsonData[i]);
      strutture.add(struttura);

      if (struttura.isCooperativa) {
        cooperative.add(struttura);
      }

      if (strutturaTipo[struttura.tipo] == null) {
        strutturaTipo[struttura.tipo] = [struttura];
      } else {
        strutturaTipo[struttura.tipo].add(struttura);
      }

      if (strutturaLuogo[struttura.localita] == null) {
        strutturaLuogo[struttura.localita] = [struttura];
      } else {
        strutturaLuogo[struttura.localita].add(struttura);
      }

      if (struttura.specializzazioni.length > 0) {
        print(struttura.specializzazioni);

        for (Map<dynamic, dynamic> s in struttura.specializzazioni) {
          print(s["Nome"]);
          if (strutturaSpecializzazione[s["Nome"]] == null) {
            strutturaSpecializzazione[s["Nome"]] = [struttura];
          } else {
            strutturaSpecializzazione[s["Nome"]].add(struttura);
          }
        }
      }

      this.add(LoadedData());
    }

    return jsonData;
  }

  putToSpecial() {}

  filter(word) {
    print(word);
    if (word.trim().length < 1) {
      temp = List();
      temp.addAll(specializzazioni);
      this.add(LoadedData());
    } else {
      temp.clear();
      for (Specializzazione s in specializzazioni) {
        if (s.nome.trim().toUpperCase().contains(word.trim().toUpperCase())) {
          temp.add(s);
        }
      }
      print("ARRAY : " + specializzazioni.toList().toString());
      this.add(LoadedData());
    }
  }
}
