import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  final num id;
  final String type;
  final String webformatURL;
  final num views;
  final num downloads;
  final num collections;
  final num likes;
  final num comments;
  final String user;
  final String userImageURL;
  final String tags;

  Photo({
    required this.id,
    required this.type,
    required this.webformatURL,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user,
    required this.userImageURL,
    required this.tags,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
