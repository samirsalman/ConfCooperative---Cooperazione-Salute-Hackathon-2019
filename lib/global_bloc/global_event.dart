import 'package:meta/meta.dart';

@immutable
abstract class GlobalEvent {}

class Login extends GlobalEvent {
  String id;
  String password;

  Login(this.id, this.password);
}

class LogOut extends GlobalEvent {}

class Register extends GlobalEvent {
  String nome;
  String cognome;
  String id;
  String password;
  String email;

  Register(this.nome, this.cognome, this.email, this.id, this.password);
}

class StartApp extends GlobalEvent {}
