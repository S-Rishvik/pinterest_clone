import 'package:get/get.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_random_images_response.dart';
import 'package:pinterest_clone/domain/usecases/get_random_images_usecase.dart';
import 'package:pinterest_clone/presentation/utils/view_state.dart';

class UpdatesController extends GetxController{
  final updatesChips = ['Updates','Messages'];

  final GetRandomImagesUseCase _getRandomImagesUseCase;
  UpdatesController(this._getRandomImagesUseCase);

  final selectedChip = 0.obs;
  final viewState = ViewState<List<GetRandomImagesResponse>>.idle().obs;

  void getRandomImages(int count) async {
    viewState.value = ViewState.loading();
    final safeResult = await _getRandomImagesUseCase.getRandomImages(count);
    handleGetRandomImagesSafeResult(safeResult);
  }

  void handleGetRandomImagesSafeResult(SafeResult<List<GetRandomImagesResponse>> safeResult){
    safeResult.when(success: (getImagesResponse){
      viewState.value = ViewState.success(getImagesResponse);
    }, error: (exception){
      viewState.value = ViewState.error(exception.toString());
    });
  }
}