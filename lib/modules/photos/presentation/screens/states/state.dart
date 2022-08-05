import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';

abstract class PhotoListState{}

class PhotoListSuccess implements PhotoListState{
  final List<Photo> list;

  PhotoListSuccess(this.list);
}

class PhotoListStart implements PhotoListState{}

class PhotoListLoading implements PhotoListState{}

class PhotoListError implements PhotoListState{}