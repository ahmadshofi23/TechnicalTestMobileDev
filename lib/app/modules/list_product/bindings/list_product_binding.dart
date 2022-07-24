import 'package:get/get.dart';

import '../controllers/list_product_controller.dart';

class ListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListProductController>(
      () => ListProductController(),
    );
  }
}
