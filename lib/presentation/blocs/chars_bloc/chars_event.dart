part of 'chars_bloc.dart';

@immutable
abstract class CharsEvent {}

class GetCharsList extends CharsEvent {
  final String? name;
  GetCharsList({this.name});
}
