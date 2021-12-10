import 'package:flutter/cupertino.dart';
import 'package:pinterest_clone/domain/entities/get_random_images_response.dart';
import 'package:pinterest_clone/presentation/app/home/widgets/image_card.dart';

class StandardGrid extends StatelessWidget {
  List<GetRandomImagesResponse> list;
  int crossAxisCount;

  StandardGrid(this.list, this.crossAxisCount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 32,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) =>
            ImageCard(url: list[index].urls?.regular),
      ),
    );
  }
}
