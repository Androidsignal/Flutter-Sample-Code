import 'dart:convert';
import 'package:code_sample_demo/common/gloabels.dart';
import 'package:http/http.dart';

class GetRequest {
  static final GetRequest _singleton = GetRequest._internal();

  factory GetRequest() {
    return _singleton;
  }

  GetRequest._internal();

  Future callApi(String url) async {
    final response = await get(Uri.parse(url), headers: headers);
    return jsonDecode(response.body);
  }
}
