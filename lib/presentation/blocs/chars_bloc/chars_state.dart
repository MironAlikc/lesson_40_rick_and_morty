part of 'chars_bloc.dart';

@immutable
abstract class CharsState {}

class CharsInitial extends CharsState {}

class CharsError extends CharsState {}

class CharsLoading extends CharsState {}

class CharsSuccess extends CharsState {
  final CharacterModel model;
  CharsSuccess({required this.model});
}
