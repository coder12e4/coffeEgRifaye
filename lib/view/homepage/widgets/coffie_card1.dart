import 'package:coffie_delivary/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class coffiecard1 extends StatelessWidget {
  final String selectedCategory;
  const coffiecard1({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Text(''),
        // ),
        Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: Container(
            height: 120.h,
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  child: Container(
                    height: 100.h,
                    width: 300.w,
                    decoration: const BoxDecoration(
                        color: baseGrat500,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(6),
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(36))),
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 120.w,
                  child: Container(
                    width: 180.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expresso Tradicional',
                          style: GoogleFonts.baloo2(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'O tradicional café feito com água quente e grãos moídos',
                            style: GoogleFonts.baloo2(
                                fontSize: 13, color: Colors.black38)),
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
                                    style: TextStyle(
                                        color: yellowDark,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -4.h,
                    left: 10.w,
                    child: Image.asset('assets/images/Image (2).png')),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}