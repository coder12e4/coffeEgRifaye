import 'package:get/get.dart';

class ProduController extends GetxController {
  List liters = ['114ml', '140ml', '227ml'].obs;
  String get seloctedliter =>
      liters.fold('114ml', (previousValue, element) => previousValue = element);

  // void updateSelectedliter(String liter) {
  //  seloctedliter = liter;
  // }
}
