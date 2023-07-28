import 'package:coffie_delivary/controller/coffie_controller.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final coffiecontroller = Get.put(CoffieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: purple,
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Image.asset('assets/images/Logo.png')),
      ),
    );
  }
}
