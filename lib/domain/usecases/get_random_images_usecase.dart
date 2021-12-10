import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_random_images_response.dart';
import 'package:pinterest_clone/domain/repositories/images_repository.dart';

class GetRandomImagesUseCase{
  ImagesRepository imagesRepository;
  GetRandomImagesUseCase(this.imagesRepository);

  Future<SafeResult<List<GetRandomImagesResponse>>> getRandomImages(int count){
    return imagesRepository.getRandomImages(count);
  }
}