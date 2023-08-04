// import 'dart:convert';
// import 'package:coffie_delivary/view/catalogo.dart';
// import 'package:coffie_delivary/view/login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:jwt_decoder/jwt_decoder.dart';

// import '../core/url.dart';

// void loginUser(email, password  ,context) async {
//   print('before login post');
//   try {
//     Map<String, dynamic> loginData = {
//       'email': email,
//       'password': password,
//     };

//     const loginuri = baseurl + login;
//     final encodedLoginBody = jsonEncode(loginData);

//     var response = await http.post(
//       Uri.parse(loginuri),
//       body: encodedLoginBody,
//       headers: {'Content-Type': 'application/json'},
//     );
//     print('after login post');

//     final decodedResponse = jsonDecode(response.body);
//     if (decodedResponse['token'] != null) {
//       print('statuscode login post');
//       var myToken = decodedResponse['token'];
      
//       prefs.setString('token', myToken);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => catalogePage(token: myToken),
//       ));

//       // Add further logic to handle the response data as needed
//     } else {
//       print('Failed to login. Status code: ${response.statusCode}');
//       // Handle other status codes or errors as needed
//     }
//   } catch (e) {
//     print('Error occurred: $e');
//     // Handle the exception, log or show a user-friendly message if necessary
//   }
// }
