import 'package:meta/meta.dart';

@immutable
abstract class StrutturaState {}

class Loading extends StrutturaState {}

class Loaded extends StrutturaState {}
