import 'package:http/http.dart';
import 'dart:convert';


class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else
      print(response.statusCode);
  }
}
