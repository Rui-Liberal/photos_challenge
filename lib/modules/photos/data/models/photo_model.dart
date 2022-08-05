import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';

class PhotoModel extends Photo{
  PhotoModel({
    required super.albumId,
    required super.id,
    required super.thumbnailUrl,
    required super.title,
    required super.url
  });

  static PhotoModel fromMap(Map<String, dynamic> map) => PhotoModel(
    albumId: map['albumId'],
    id: map['id'],
    thumbnailUrl: map['thumbnailUrl'],
    title: map['title'],
    url: map['url']
  );
}