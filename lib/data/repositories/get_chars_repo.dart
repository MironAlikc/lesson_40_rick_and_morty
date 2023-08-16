import 'package:dio/dio.dart';
import 'package:lesson_40_rick_and_morty/data/models/charecter_model.dart';

class GetCharsRepo {
  final Dio dio;
  GetCharsRepo({required this.dio});

  Future<CharacterModel> getData({String? name}) async {
    final Response response = await dio.get(
      'character/',
      queryParameters: {
        "name": name,
      },
    );

    return CharacterModel.fromJson(response.data);
  }
}
