import 'package:flutter/material.dart';
import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';

class PhotoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoScreen({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage photoPlaceholder = const AssetImage('assets/photo_test.jpeg');

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Hero(
              tag: photo.id,
              child: Image.network(
                photo.url,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  return Image(image: photoPlaceholder);
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.error),
                        Text('Erro ao carregar imagem...')
                      ]
                    ),
                  );
                },
              )
              
              /*
              FadeInImage(
                image: NetworkImage(photo.url),
                placeholder: photoPlaceholder
              )
              */
            ),
          ),
          Text(photo.title)
        ],
      ),
    );
  }
}