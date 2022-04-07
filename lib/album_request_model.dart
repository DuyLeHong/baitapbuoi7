import 'package:json_annotation/json_annotation.dart';

part 'album_request_model.g.dart';

@JsonSerializable()
class AlbumRequestModel {
  @JsonKey(name: 'title')
  final String title;

  AlbumRequestModel({required this.title});

  Map<String, dynamic> toJson() => _$AlbumRequestModelToJson(this);
}
