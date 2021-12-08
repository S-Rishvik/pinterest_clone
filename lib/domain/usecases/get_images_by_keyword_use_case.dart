import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';
import 'package:pinterest_clone/domain/repositories/images_repository.dart';

class GetImagesByKeywordUseCase{
  ImagesRepository imagesRepository;
  GetImagesByKeywordUseCase(this.imagesRepository);

  Future<SafeResult<GetImagesResponse>> getImagesByKeyword(GetImagesRequest getImagesRequest){
    return imagesRepository.getImagesByKeyword(getImagesRequest);
  }
}