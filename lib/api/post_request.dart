import 'dart:convert';
import 'dart:io';
import 'package:code_sample_demo/common/gloabels.dart';
import 'package:http/http.dart';

class PostRequest {
  static final PostRequest _singleton = PostRequest._internal();

  factory PostRequest() {
    return _singleton;
  }

  PostRequest._internal();

  Future callApi(String url, var body) async {
    if (body is Map) {
      headers.remove('Content-Type');
      body.forEach((key, value) {
        body[key] = '$value';
      });
      body['version_type'] = 'openness';
      body['group'] = '2';
      body['version'] = '1';
    }
    if (body is String) {
      headers['Content-Type'] = 'application/json';
      var map = jsonDecode(body);
      map['version_type'] = 'openness';
      map['group'] = '2';
      map['version'] = '1';
      body = jsonEncode(map);
    }
    final response = await post(Uri.parse(url), body: body, headers: headers);
    return jsonDecode(response.body);
  }

  Future multiPartRequest(String url, var body, String parameterName, File file,) async {
    if (body is Map) {
      headers.remove('Content-Type');
      body.forEach((key, value) {
        body[key] = '$value';
      });
      body['version_type'] = 'openness';
      body['group'] = '1';
      body['version'] = '1';
    }
    if (body is String) {
      headers['Content-Type'] = 'application/json';
    }
    var request = MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.fields.addAll(body);
    request.files.add(
      await MultipartFile.fromPath(parameterName, file.path,),
    );
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();
    return jsonDecode(responseString);
  }
}
