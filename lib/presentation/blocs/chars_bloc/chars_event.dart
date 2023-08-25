part of 'chars_bloc.dart';

@immutable
abstract class CharsEvent {}

class GetCharsList extends CharsEvent {
  final String? name;
  final String? status;
  final String? gender;
  GetCharsList({
    this.status,
    this.gender,
    this.name,
  });
}
