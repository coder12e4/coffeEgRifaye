import 'dart:convert';

import 'package:coffie_delivary/core/colors.dart';
import 'package:coffie_delivary/core/url.dart';
import 'package:coffie_delivary/service/login.dart';
import 'package:coffie_delivary/view/catalogo.dart';
import 'package:coffie_delivary/view/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final emailLogconroller = TextEditingController();
final passconroller = TextEditingController();
late SharedPreferences prefs;

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPrefs();
  }

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 600.h,
                  color: purple,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 440.h),
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                ),
              ),
              Positioned(
                top: 160.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 450.h,
                  decoration: const BoxDecoration(
                      color: basegray,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 80.h),
                        Text(
                          'Login ',
                          style: GoogleFonts.baloo2(
                              color: purple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.h),
                        Textfield(
                            comtroller: emailLogconroller, hinttext: 'Email'),
                        SizedBox(height: 30.h),
                        Textfield(
                            comtroller: passconroller, hinttext: 'Password'),
                        SizedBox(height: 40.h),
                        Container(
                            height: 40.h,
                            width: 200.w,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(baseGray300),
                                    shape: MaterialStatePropertyAll(
                                        ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))))),
                                onPressed: () {
                                  loginUser(emailLogconroller.text.trim(),
                                      passconroller.text.trim(), context);
                                  // emailLogconroller.clear();
                                  // passconroller.clear();
                                },
                                child: Text('Login',
                                    style: GoogleFonts.baloo2(
                                        color: yellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)))),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Don\'t have an account ?',
                                  style: GoogleFonts.baloo2(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: ' SignUp',
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
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }

  void loginUser(email, password, context) async {
    print('before login post');
    try {
      Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      const loginuri = baseurl + login;
      final encodedLoginBody = jsonEncode(loginData);

      var response = await http.post(
        Uri.parse(loginuri),
        body: encodedLoginBody,
        headers: {'Content-Type': 'application/json'},
      );
      print('after login post');

      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse.toString());
      if (decodedResponse['token'] != null) {
        print('statuscode login post');
        final myToken = decodedResponse['token'];
        setState(() {
          prefs.setString('token', myToken);
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => catalogePage(token: decodedResponse),
        ));

        // Add further logic to handle the response data as needed
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        // Handle other status codes or errors as needed
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle the exception, log or show a user-friendly message if necessary
    }
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
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
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
