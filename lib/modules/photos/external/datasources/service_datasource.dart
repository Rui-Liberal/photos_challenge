import 'package:dio/dio.dart';
import 'package:photos_challenge/modules/photos/data/datasources/photo_datasource.dart';
import 'package:photos_challenge/modules/photos/data/models/photo_model.dart';
import 'package:photos_challenge/modules/photos/domain/errors/errors.dart';

class ServiceDatasource implements PhotoDatasource{
  final Dio dio;

  ServiceDatasource(this.dio);

  @override
  Future<List<PhotoModel>> getAll() async {
    final response = await dio.get("https://jsonplaceholder.typicode.com/photos");

    if(response.statusCode == 200){
      final list = (response.data as List).map((e) => PhotoModel.fromMap(e)).toList();

      return list;
    }
    else{
      throw DataSourceError();
    }
  }
}