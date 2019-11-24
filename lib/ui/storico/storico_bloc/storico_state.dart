import 'package:meta/meta.dart';

@immutable
abstract class StoricoState {}

class LoadingStorico extends StoricoState {}
class Loaded extends StoricoState {}
