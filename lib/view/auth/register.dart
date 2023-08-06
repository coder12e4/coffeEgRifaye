import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/service/register_service.dart';
import 'package:coffie_delivary/view/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final namecomtroller = TextEditingController();
final emailcomtroller = TextEditingController();
final mobilenumbercomtroller = TextEditingController();
final dobcomtroller = TextEditingController();
final passwordcomtroller = TextEditingController();
final comfpasscomtroller = TextEditingController();

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: basegray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r))),
              child: Stack(children: [
                Positioned(
                    top: 0.h,
                    left: 60.w,
                    child: Image.asset(
                      'assets/images/Coffee-Beans-Transparent-Images.png',
                      opacity: const AlwaysStoppedAnimation(0.3),
                    )),
                Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Container(
                        height: 30,
                        child: Text(
                          'Register ',
                          style: GoogleFonts.baloo2(
                              color: yellow,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                Positioned(
                    top: 80.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: namecomtroller,
                        hinttext: 'Name',
                      ),
                    )),
                Positioned(
                    top: 130.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: emailcomtroller,
                        hinttext: 'Email',
                      ),
                    )),
                Positioned(
                    top: 180.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: mobilenumbercomtroller,
                        hinttext: 'Mobile number',
                      ),
                    )),
                Positioned(
                    top: 230.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: dobcomtroller,
                        hinttext: 'D-O-B',
                      ),
                    )),
                Positioned(
                    top: 280.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: passwordcomtroller,
                        hinttext: 'New Password',
                      ),
                    )),
                Positioned(
                    top: 330.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Textfield(
                        comtroller: comfpasscomtroller,
                        hinttext: 'Conform Password',
                      ),
                    )),
                Positioned(
                    top: 10.h,
                    right: 40.w,
                    child: Container(
                      height: 70.h,
                      width: 90.w,
                      child: Image.asset('assets/images/Logo.png'),
                    ))
              ]),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
                height: 40.h,
                width: 200.w,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(basegray),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))))),
                    onPressed: () {
                      // if (comfpasscomtroller.text == passwordcomtroller.text) {
                      registerUser(
                        namecomtroller.text.trim(),
                        emailcomtroller.text.trim(),
                        mobilenumbercomtroller.text.trim(),
                        dobcomtroller.text.trim(),
                        passwordcomtroller.text.trim(),
                      );
                      namecomtroller.clear();
                      passwordcomtroller.clear();
                      dobcomtroller.clear();
                      mobilenumbercomtroller.clear();
                      emailcomtroller.clear();
                      comfpasscomtroller.clear();
                    },
                    // },
                    child: Text('Register',
                        style: GoogleFonts.baloo2(
                            color: yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Alredy have a account ?',
                      style: GoogleFonts.baloo2(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: 'Login',
                      style: GoogleFonts.baloo2(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.comtroller,
    required this.hinttext,
  });

  final TextEditingController comtroller;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: comtroller,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)))),
      ),
    );
  }
}
