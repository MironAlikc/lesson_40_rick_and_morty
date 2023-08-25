part of 'eposode_bloc.dart';

@immutable
abstract class EposodeState {}

class EposodeInitial extends EposodeState {}

class EposodeSuccess extends EposodeState {
  final EpisodeModel model;
  EposodeSuccess({required this.model});
}

class EposodeError extends EposodeState {}

class EposodeLoading extends EposodeState {}
