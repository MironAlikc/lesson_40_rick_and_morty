part of 'eposode_bloc.dart';

@immutable
abstract class EposodeEvent {}

class GetEpisodeEvent extends EposodeEvent {
  final String url;
  GetEpisodeEvent({required this.url});
}
