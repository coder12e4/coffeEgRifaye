import 'package:coffie_delivary/controller/product_controller.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/view/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List liters = ['114ml', '140ml', '227ml'].obs;
  String seloctedliter = '114';
  @override
  Widget build(BuildContext context) {
    final productcontroller = Get.put(ProduController());
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500.h,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 450.h,
                      color: basegray,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35.w, vertical: 18.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35.w, bottom: 10.h),
                            child: Container(
                              width: 120.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r)),
                                  color: Color.fromARGB(103, 127, 110, 110)),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Especial',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.w, right: 35.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Irlandes',
                                    style: GoogleFonts.baloo2(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 35)),
                                Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                          color: yellow,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                      text: 'RS ',
                                      children: [
                                        TextSpan(
                                            text: '9,90',
                                            style: GoogleFonts.baloo2(
                                                color: yellow,
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35.w, vertical: 20.h),
                            child: Container(
                              width: 290.w,
                              child: Text(
                                  'Babida a base de cafe, uisque irlandes, acucar e chantilly',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220.h,
                    left: 20.w,
                    child: Container(
                      // color: purple,
                      height: 400.h,
                      width: 400.w,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 55.h,
                              child: Container(
                                  child:
                                      Image.asset('assets/images/Coffee.png'))),
                          Positioned(
                              left: 130.w,
                              child: Image.asset('assets/images/Smoke.png')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, bottom: 8.h),
              child: Text(
                'Selecione o tamanho:',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ...Iterable<int>.generate(liters.length)
                    .map((int pageIndex) => Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                border: liters[pageIndex] == seloctedliter
                                    ? Border.all(color: purple)
                                    : null,
                                // color: purple,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                            child: ElevatedButton(
                              onPressed: () {
                                _updateSelectedCategory(liters[pageIndex]);
                              },
                              child: Text(liters[pageIndex]),
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(
                                    liters[pageIndex] != seloctedliter ? 1 : 0,
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    liters[pageIndex] != seloctedliter
                                        ? Color.fromARGB(255, 252, 251, 253)
                                        : Colors.white,
                                  ),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6))))),
                            ),
                          ),
                        )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: Container(
                color: Color.fromARGB(255, 246, 242, 250),
                width: 312.w,
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '-',
                      style: TextStyle(
                        color: purple,
                        fontSize: 45,
                      ),
                    ),
                    Text(
                      '1',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '+',
                      style: TextStyle(
                        color: purple,
                        fontSize: 30,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cart(),
                          ));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(purpleDrk),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))))),
                        child: Text(
                          'ADICIONAR',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ));
  }

  void _updateSelectedCategory(String liter) {
    setState(() {
      seloctedliter = liter;
    });
  }
}
