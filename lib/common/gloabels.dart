import 'package:code_sample_demo/api/get_request.dart';
import 'package:code_sample_demo/api/post_request.dart';
import 'package:code_sample_demo/common/progress_dialog.dart';
import 'package:code_sample_demo/localizations/string_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/firebase_utils.dart';
import 'image_constant.dart';

StringKeys stringKeys = StringKeys();
GetRequest getRequest = GetRequest();
PostRequest postRequest = PostRequest();
ImageConstant imageConstant = ImageConstant();
Future<SharedPreferences> preference = SharedPreferences.getInstance();

Future navigateAndPush(BuildContext context, Widget page) {
  var route = MaterialPageRoute(builder: (BuildContext context) => page);
  return Navigator.of(context).push(route);
}

Future navigateAndReplace(BuildContext context, Widget page) {
  var route = MaterialPageRoute(builder: (BuildContext context) => page);
  return Navigator.of(context).pushReplacement(route);
}

Future navigateAndRemove(BuildContext context, Widget page) {
  var route = MaterialPageRoute(builder: (BuildContext context) => page);
  return Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
}



Map<String, String> headers = {
  'Content-Type': 'application/json',
  'user_session_token': null,
};

String baseUrl = 'https://begratefulapp.ca/api/';

FirebaseUtils firebaseUtils;