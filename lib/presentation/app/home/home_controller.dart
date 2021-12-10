import 'package:get/get.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';
import 'package:pinterest_clone/domain/usecases/get_images_by_keyword_use_case.dart';
import 'package:pinterest_clone/presentation/utils/view_state.dart';

class HomeController extends GetxController {

  GetImagesByKeywordUseCase getImagesByKeywordUseCase;

  HomeController(this.getImagesByKeywordUseCase);

  final viewState = ViewState<GetImagesResponse>.idle().obs;

  var selectedChip = 0.obs;
  var chips = [
    'Art',
    'Abstract',
    'Fashion',
    'Paintings',
    'Landscapes',
    'Personality',
    'Design'
  ];

  void getImagesFromSelectedChip() async {
    viewState.value = ViewState.loading();
    var safeResult = await getImagesByKeywordUseCase.getImagesByKeyword(GetImagesRequest(chips[selectedChip.value], '1', '10'));
    handleGetImagesByKeywordSafeResult(safeResult);
  }

  void handleGetImagesByKeywordSafeResult(SafeResult<GetImagesResponse> safeResult){
    safeResult.when(success: (getImagesResponse){
      viewState.value = ViewState.success(getImagesResponse);
    }, error: (exception){
      viewState.value = ViewState.error(exception.toString());
    });
  }

}
