import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';

abstract class ImagesRepository{
  Future<SafeResult<GetImagesResponse>> getImagesByKeyword(GetImagesRequest getImagesRequest);
}