import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_challenge/modules/photos/domain/usecases/get_all_photos.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/events/event.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/states/state.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState>{
  final GetAllPhotos usecase;

  PhotoListBloc(this.usecase) : super(PhotoListStart()) {
    on<GetPhotoListEvent>(_onGetPhotos);
  }

  _onGetPhotos(PhotoListEvent event, Emitter<PhotoListState> emit) async {
    emit(PhotoListLoading());
    var result = await usecase();

    result.fold(
      (left) => emit(PhotoListError()),
      (right) => { emit(PhotoListSuccess(right)),}
    );
  }
}