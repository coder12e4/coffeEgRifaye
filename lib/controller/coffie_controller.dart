import 'package:coffie_delivary/view/catalogo.dart';
import 'package:coffie_delivary/view/home_page.dart';
import 'package:coffie_delivary/view/register.dart';

import 'package:get/get.dart';

class CoffieController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splashwite();
  }

  Future splashwite() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.to(RegisterPage()));
  }
}
