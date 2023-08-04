import 'package:coffie_delivary/service/allproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  ScrollController scrollController = ScrollController();
  List<String> categories = ['TRADICIONAIS', 'DOCES', 'ESPECIAIS'];
  RxString selectedCategory = 'TRADICIONAIS'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController();
    Fetchdata().fetchdata();
    super.onInit();
  }

  void updateSelectedCategory(RxString category) {
    selectedCategory = category;
  }
}
