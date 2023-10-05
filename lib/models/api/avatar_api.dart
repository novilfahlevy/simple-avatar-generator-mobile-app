import 'package:avatar_generator/helpers.dart';
import 'package:avatar_generator/models/api/urls.dart';
import 'package:avatar_generator/models/avatar_model.dart';
import 'package:dio/dio.dart';

class AvatarApi {
  Future<AvatarModel> getAvatar(String seed) async {
    final dio = Dio();

    Response response = await dio.get('${Urls.baseUrl}/pixel-art/json?seed=$seed');

    dio.close();

    return AvatarModel(seed: seed, svg: response.data['svg']);
  }
}