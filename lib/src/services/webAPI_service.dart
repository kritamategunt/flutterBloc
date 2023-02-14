import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/youtube_response.dart';

class WebApiService {
  Future<List<Youtube>> feed() async {
    final dio = Dio();
    final result = await dio.get(
        ("https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs"));


    final youtubeResponse = youtubeResponseFromJson(result.data);
    print(youtubeResponse.youtubes[0].title);
    return youtubeResponse.youtubes;
  }
}
