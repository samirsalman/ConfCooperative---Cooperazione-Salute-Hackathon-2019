import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:confsalute/models/struttura.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import './bloc.dart';

class StoricoBloc extends Bloc<StoricoEvent, StoricoState> {
  @override
  StoricoState get initialState => LoadingStorico();

  var res;
  Struttura struct;

  @override
  Stream<StoricoState> mapEventToState(
    StoricoEvent event,
  ) async* {
    if (event is GetData) {
      await getData();
      yield (Loaded());
    }
  }

  Future getData() async {
    Response response = await http.get(
      "http://salutewebapi.azurewebsites.net/api/prenotazioni/persona/2",
    );
    Response responseStruct = await http.get(
      "http://salutewebapi.azurewebsites.net/api/struttura/4",
    );

    res = json.decode(response.body);

    struct = Struttura.fromJson(json.decode(responseStruct.body));

    print(res);
    return struct;
  }
}
