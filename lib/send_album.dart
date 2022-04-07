import 'dart:convert';

import 'package:baitapbuoi6/album_request_model.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createAlbum(AlbumRequestModel albumRequestModel) async {
  // delay
  await Future.delayed(const Duration(seconds: 3));

  return http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      albumRequestModel.toJson(),
    ),
  );
}
