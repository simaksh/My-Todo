import 'package:get/get.dart';
import 'Controllers/Controller-page-one.dart';

class PageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageOneController());
  }
}