import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';

import 'image_card.dart';

class PinterestGrid extends StatelessWidget {
  GetImagesResponse getImagesResponse;

  PinterestGrid(this.getImagesResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: getImagesResponse.results.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: getImagesResponse.results[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}