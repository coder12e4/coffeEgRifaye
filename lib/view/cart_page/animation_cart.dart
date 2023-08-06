import 'package:coffie_delivary/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationCart extends StatelessWidget {
  const AnimationCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Container(
              height: 200,
              child: Image.asset('assets/images/urban-882.gif'),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: SizedBox(
              width: 300.w,
              child: Text(
                textAlign: TextAlign.center,
                'Uhu! Pedido confirmado',
                style: GoogleFonts.baloo2(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: yellowDark),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: SizedBox(
              width: 280.w,
              child: Text(
                textAlign: TextAlign.center,
                'Agora é só aguardar que logo o café chegará até você!',
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: SizedBox(
              width: 250.w,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'ir para a home',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(purpleDrk),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))))),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
