import "package:http/http.dart" as http;
import 'package:imagine/api/cocoa_object.dart';
import 'dart:convert';

const URL = "https://rest.imagineapps.co/cocoa-contracts";

class CocoaApi {
  final List<Cocoa> cocoa = [];

  Future<List<Cocoa>> getCocoa() async {
    http.Response response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final Map<String, dynamic> cocoaJson = json.decode(response.body);
      cocoaJson.forEach((key, value) {
        final cocoaObject = Cocoa.fromJson(value);
        cocoa.add(cocoaObject);
      });
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return cocoa;
  }
}
