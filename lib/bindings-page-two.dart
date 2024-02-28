import 'package:get/get.dart';
import 'Controller/Controller-second-page.dart';

class PageTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageTwoController());
  }
}
