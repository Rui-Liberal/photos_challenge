import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/events/event.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/photo_list_bloc.dart';
import 'package:photos_challenge/modules/photos/presentation/screens/states/state.dart';

class PhotosListScreen extends StatefulWidget {
  const PhotosListScreen({Key? key}) : super(key: key);

  @override
  State<PhotosListScreen> createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  final bloc = Modular.get<PhotoListBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Fotos'),
        actions: [
          IconButton(
            onPressed: () => bloc.add(GetPhotoListEvent()),
            icon: const Icon(Icons.refresh)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<PhotoListState>(
              stream: bloc.stream,
              builder: (context, snapshot){
                final state = bloc.state;

                if(state is PhotoListStart){
                  return const Center(
                    child: Text('Atualize a página...'),
                  );
                }

                if(state is PhotoListError){
                  return const Center(
                    child: Text('Houve um erro a carregar a página...'),
                  );
                }

                if(state is PhotoListLoading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                final list = (state as PhotoListSuccess).list;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final photo = list[index];
                    return ListTile(
                      title: Text(photo.title),
                      leading: Hero(
                        tag: photo.id,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/photo_test.jpeg') //NetworkImage(photo.url),
                        )
                      ),
                      onTap: () => Modular.to.pushNamed('/photo', arguments: photo),
                    );
                  }
                );
              },
            )
          )
        ],
      ),
    );
  }
}