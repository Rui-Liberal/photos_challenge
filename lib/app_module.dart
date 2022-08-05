import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photos_challenge/modules/photos/data/repositories/photo_repository_impl.dart';
import 'package:photos_challenge/modules/photos/domain/usecases/get_all_photos.dart';
import 'package:photos_challenge/modules/photos/external/datasources/service_datasource.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/photo_list_bloc.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/photo_screen.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/photos_list_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => ServiceDatasource(i())),
    Bind((i) => PhotoRepositoryImpl(i())),
    Bind((i) => GetAllPhotosImpl(i())),
    Bind((i) => PhotoListBloc(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const PhotosListScreen()),
    ChildRoute('/photo', child: (context, args) => PhotoScreen(photo: args.data))
  ];
}