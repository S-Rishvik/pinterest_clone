import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';
import 'package:pinterest_clone/domain/entities/get_random_images_response.dart';
import 'package:pinterest_clone/domain/repositories/images_repository.dart';
import 'package:pinterest_clone/domain/sources/image_source.dart';

class ImagesRepositoryImpl implements ImagesRepository{
  ImageSource imageSource;
  ImagesRepositoryImpl(this.imageSource);

  @override
  Future<SafeResult<GetImagesResponse>> getImagesByKeyword(GetImagesRequest getImagesRequest) {
    return imageSource.getImagesByKeyword(getImagesRequest);
  }

  @override
  Future<SafeResult<List<GetRandomImagesResponse>>> getRandomImages(int count) {
    return imageSource.getRandomImages(count);
  }
}
