import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/view/fetchdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousilwidget extends StatelessWidget {
  const Carousilwidget({
    super.key,
    required this.respowidth,
  });

  final double respowidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15.w,
      top: 130.h,
      child: Container(
        height: 300.h,
        width: respowidth,
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: 0,
              disableCenter: false,
              scrollPhysics: const BouncingScrollPhysics(),
              padEnds: false,
              viewportFraction: 0.6,
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => dataload(),
                    ));
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        top: 28.h,
                        child: Container(
                            margin: const EdgeInsets.only(left: 25),
                            width: 180.w,
                            height: 202.h,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 212, 212),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(15)),
                            ),
                            child: const Column(
                              children: [],
                            )),
                      ),
                      Positioned(
                          top: 0,
                          left: 65.w,
                          child: Image.asset('assets/images/Image (1).png')),
                      Positioned(
                        top: 85.h,
                        left: 90.w,
                        child: Container(
                          width: 50.w,
                          decoration: const BoxDecoration(
                              color: purpleWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              'DOCE',
                              style: GoogleFonts.baloo2(
                                  color: purpleDrk,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 110.h,
                          left: 67.w,
                          child: Text(
                            'Mocaccino',
                            style: GoogleFonts.baloo2(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          )),
                      Positioned(
                          top: 140.h,
                          left: 35.w,
                          child: Container(
                            width: 160.w,
                            child: Center(
                              child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  text:
                                      'Cafe expresso com o dobro de leite e espuma cremosa',
                                ),
                                style: GoogleFonts.baloo2(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 180.h,
                          left: 70.h,
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    color: yellow,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                                text: 'RS ',
                                children: [
                                  TextSpan(
                                      text: '9,90',
                                      style: TextStyle(
                                          color: yellowDark,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ))
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}