import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_40_rick_and_morty/data/models/episode_model.dart';
import 'package:lesson_40_rick_and_morty/data/repositories/get_episode_data_repo.dart';

part 'eposode_event.dart';
part 'eposode_state.dart';

class EposodeBloc extends Bloc<EposodeEvent, EposodeState> {
  EposodeBloc({required this.repo}) : super(EposodeInitial()) {
    on<GetEpisodeEvent>((event, emit) async {
      try {
        emit(
          EposodeLoading(),
        );
        final model = await repo.getEpisodeData(
          url: event.url,
        );
        emit(
          EposodeSuccess(model: model),
        );
      } catch (e) {
        emit(EposodeError());
      }
    });
  }
  final GetEpisodeDataRepo repo;
}
