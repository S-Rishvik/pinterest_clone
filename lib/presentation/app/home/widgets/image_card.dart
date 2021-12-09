import 'package:flutter/cupertino.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';

class ImageCard extends StatelessWidget {
  ImageCard({required this.imageData});

  final Results imageData;

  @override
  Widget build(BuildContext context) {
    final url = imageData.urls?.regular;
    if(url!=null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(url, fit: BoxFit.cover),
      );
    }else{
      return Container();
    }

  }
}