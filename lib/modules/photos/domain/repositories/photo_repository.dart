import 'package:dartz/dartz.dart';
import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';
import 'package:photos_challenge/modules/photos/domain/errors/errors.dart';

abstract class PhotoRepository{
  Future<Either<Failure, List<Photo>>> allPhotos();
}