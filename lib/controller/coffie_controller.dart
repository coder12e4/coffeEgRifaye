import 'package:coffie_delivary/view/homepage/catalogo.dart';
import 'package:coffie_delivary/view/homepage/home_page.dart';
import 'package:coffie_delivary/view/auth/register.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoffieController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    splashwite();
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  Future splashwite() async {
    final token = await getToken();
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.to(
        JwtDecoder.isExpired(token) == false
            ? catalogePage(token: token)
            : RegisterPage()));
  }
}
