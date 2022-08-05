import 'package:dartz/dartz.dart';
import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';
import 'package:photos_challenge/modules/photos/domain/errors/errors.dart';
import 'package:photos_challenge/modules/photos/domain/repositories/photo_repository.dart';

abstract class GetAllPhotos{
  Future<Either<Failure, List<Photo>>> call();
}

class GetAllPhotosImpl implements GetAllPhotos{
  final PhotoRepository repository;

  GetAllPhotosImpl(this.repository);

  @override
  Future<Either<Failure, List<Photo>>> call() async{
    return repository.allPhotos();
  }
}