import 'package:dio/dio.dart';
import 'package:lesson_40_rick_and_morty/data/models/episode_model.dart';

class GetEpisodeDataRepo {
  final Dio dio;
  GetEpisodeDataRepo({required this.dio});

  Future<EpisodeModel> getEpisodeData({required String url}) async {
    final Response response = await dio.get(url);
    return EpisodeModel.fromJson(response.data);
  }
}
