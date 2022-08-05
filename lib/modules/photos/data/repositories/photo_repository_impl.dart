import 'package:photos_challenge/modules/photos/data/datasources/photo_datasource.dart';
import 'package:photos_challenge/modules/photos/domain/errors/errors.dart';
import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';
import 'package:dartz/dartz.dart';
import 'package:photos_challenge/modules/photos/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository{
  final PhotoDatasource datasource;

  PhotoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Photo>>> allPhotos() async {
    try{
      final result = await datasource.getAll();
      return Right(result);
    } catch (e){
      return Left(DataSourceError());
    }
  }
}