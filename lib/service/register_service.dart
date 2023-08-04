import 'dart:convert';
import 'dart:developer';
import 'package:coffie_delivary/core/url.dart';
import 'package:http/http.dart' as http;

void registerUser(String name, String email, String mobileNum, String dob,
    String password) async {
  print('First');

  try {
    Map<String, dynamic> bodyData = {
      "name": name,
      "email": email,
      "mobileNumber": mobileNum,
      "dob": dob,
      "password": password
    };

    final uri = baseurl + register;
    final encodedBody = jsonEncode(bodyData);
    print('before post');
    var response = await http.post(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
      body: encodedBody,
    );

    if (response.statusCode == 200) {
      print('after post');

      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse['msg']);
      // Add further printic to handle the response data as needed
    } else {
      print('Failed to register user. Status code: ${response.statusCode}');
      // Handle other status codes or errors as needed
    }
  } catch (e) {
    print('Error occurred: $e');
    // Handle the exception, log or show a user-friendly message if necessary
  }
}
// void registeruser(name, email, mobilenum, dob, password) async {
//   Map<String, dynamic> bodydata = {
//     "name": name,
//     "email": email,
//     "mobileNumber": mobilenum,
//     "dob": dob,
//     "password": password
//   };
//   final uri = baseurl + register;

//   final encodedBody = jsonEncode(bodydata);

//   var response = await http.post(Uri.parse(uri),
//       headers: {'Content-Type': 'application/json'}, body: encodedBody);
//   final decodedResponse = jsonDecode(response.body);
//   log(decodedResponse['msg']);
// }