// Navigation Controller
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }
}