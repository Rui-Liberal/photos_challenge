import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final String url;

  const PhotoWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator()
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.redAccent.withOpacity(0.5),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error_outline_rounded,
                  size: 35,
                  color: Colors.grey
                ),
                SizedBox(height: 10,),
                Text(
                  'Erro ao carregar imagem...',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey
                  ),
                )
              ]
            ),
          ),
        );
      },
    );
  }
}