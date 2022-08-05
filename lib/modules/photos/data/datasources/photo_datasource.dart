import 'package:photos_challenge/modules/photos/data/models/photo_model.dart';

abstract class PhotoDatasource {
  Future<List<PhotoModel>> getAll();
}