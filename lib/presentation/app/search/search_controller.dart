import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';
import 'package:pinterest_clone/domain/usecases/get_images_by_keyword_use_case.dart';
import 'package:pinterest_clone/presentation/utils/view_state.dart';

class SearchController extends GetxController{
  GetImagesByKeywordUseCase getImagesByKeywordUseCase;
  SearchController(this.getImagesByKeywordUseCase);

  final viewState = ViewState<GetImagesResponse>.idle().obs;

  final searchState = SearchState.Idle.obs;

  TextEditingController textEditingController = TextEditingController();

  void getImagesByKeyWord(String keyword) async {
    viewState.value = ViewState.loading();
    var safeResult = await getImagesByKeywordUseCase.getImagesByKeyword(GetImagesRequest(keyword, '1', '10'));
    handleGetImagesByKeywordSafeResult(safeResult);
  }

  void handleGetImagesByKeywordSafeResult(SafeResult<GetImagesResponse> safeResult){
    safeResult.when(success: (getImagesResponse){
      viewState.value = ViewState.success(getImagesResponse);
    }, error: (exception){
      viewState.value = ViewState.error(exception.toString());
    });
  }

  void setIdleState(){
    viewState.value = ViewState.idle();
  }
}

enum SearchState{Idle, Typing, Searched}