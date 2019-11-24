import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:confsalute/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import './bloc.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  @override
  GlobalState get initialState => NotAuthorized();
  User user;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    if (event is StartApp) {
      yield (SplashScreen());
      await Future.delayed(Duration(seconds: 1));
      yield (NotAuthorized());
      //check if user is logged
    }

    if (event is Login) {
      var check = await doLogin(event.id, event.password);
      if (check) {
        yield (Authorized());
      } else {
        yield (NotAuthorized());
      }
      //do login and get user informations
    }

    if (event is LogOut) {
      yield (NotAuthorized());
    }
  }

  Future<bool> doLogin(username, password) async {
    Map<String, String> params = Map();
    params["nome"] = password;

    String ogg =
        '{"nome":"admin","cognome":"admin","eta":21,"email":"alessandro@gmail.com","telefono":"34032666","citta":"Milano","sesso":"M","coopRiferimento":"confMilano ","nucleo":false,"idSussidio":"C","idPersona":0,"sussidio":{"prestazioni":500,"analisi":1000,"odontoiatria":200},"_id":"2IzeHkORKoCt9JmN"}';

    var jsonData = json.decode(ogg);

    user = User.fromJson(jsonData);
    print(jsonData[0]);

    if (username == "admin") {
      return true;
    } else {
      return false;
    }
  }

  doLogout() {}
}
