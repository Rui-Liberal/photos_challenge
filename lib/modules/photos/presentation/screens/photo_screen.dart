import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:photos_challenge/modules/photos/domain/entities/photo.dart';
import 'package:photos_challenge/modules/photos/presentation/widgets/photo_widget.dart';

class PhotoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoScreen({required this.photo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: photo.id,
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: PhotoWidget(url: photo.url)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                  ),
                  child: Text(
                    photo.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}