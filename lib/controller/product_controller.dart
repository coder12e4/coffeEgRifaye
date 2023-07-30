import 'package:get/get.dart';

class ProduController extends GetxController {
  List liters = ['114ml', '140ml', '227ml'].obs;
  RxString seloctedliter = '114'.obs;

  void updateSelectedliter(RxString liter) {
    seloctedliter = liter;
  }
}
