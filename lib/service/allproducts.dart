import 'dart:convert';
import 'dart:developer';
import 'package:coffie_delivary/core/url.dart';
import 'package:coffie_delivary/model/prodect_model.dart';
import 'package:http/http.dart' as http;

class Fetchdata {
  final client = http.Client();
  Future<Coffee?> fetchdata() async {
    Coffee? coffeeData;
    final url = Uri.parse(baseurl + getallproduct);
    final resoponse = await client.get(url);

    if (resoponse.statusCode == 200) {
      try {
        final decodedData = json.decode(resoponse.body);
        coffeeData = Coffee.fromJson(decodedData);
        log(coffeeData.data[0].description);
      } catch (e) {
        log(e.toString());
      }
    } else {
      log('occure erroe');
    }
    return coffeeData;
  }
}
