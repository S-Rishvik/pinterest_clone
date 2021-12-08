import 'package:get/get.dart';
import 'package:pinterest_clone/data/repositories/images_repository_impl.dart';
import 'package:pinterest_clone/data/sources/image_source_impl.dart';
import 'package:pinterest_clone/domain/repositories/images_repository.dart';
import 'package:pinterest_clone/domain/sources/image_source.dart';
import 'package:pinterest_clone/domain/usecases/get_images_by_keyword_use_case.dart';
import 'package:pinterest_clone/presentation/app/account/account_controller.dart';
import 'package:pinterest_clone/presentation/app/app_controller.dart';
import 'package:pinterest_clone/presentation/app/home/home_controller.dart';
import 'package:pinterest_clone/presentation/app/search/search_controller.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => UpdatesController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut<ImageSource>(() => ImageSourceImpl());
    Get.lazyPut<ImagesRepository>(() => ImagesRepositoryImpl(Get.find()));
    Get.lazyPut(() => GetImagesByKeywordUseCase(Get.find()));
  }

}