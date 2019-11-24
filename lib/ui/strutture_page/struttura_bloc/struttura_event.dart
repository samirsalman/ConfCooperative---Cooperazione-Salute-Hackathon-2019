import 'package:meta/meta.dart';

@immutable
abstract class StrutturaEvent {}
class GetData extends StrutturaEvent {}
class LoadedData extends StrutturaEvent {}



