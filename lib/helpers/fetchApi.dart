import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = '';
const isProd = bool.fromEnvironment('dart.vm.product');

setBaseUrl() {
  if (isProd) {
    baseUrl = 'https://asia-northeast1-aiinee.cloudfunctions.net/expressApp';
  } else {
    baseUrl = 'http://10.0.2.2:5001/aiinee/asia-northeast1/expressApp';
  }
}

Future<Map> fetchApi(apiName) async {
  var url = '$baseUrl/$apiName';
  var response = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var obj = await json.decode(response.body);
  return obj;
}
