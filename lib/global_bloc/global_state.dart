import 'package:meta/meta.dart';

@immutable
abstract class GlobalState {}

class SplashScreen extends GlobalState {}
class Authorized extends GlobalState {}
class NotAuthorized extends GlobalState {}
