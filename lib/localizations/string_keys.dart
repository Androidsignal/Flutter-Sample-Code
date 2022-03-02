class StringKeys {
  static final StringKeys _singleton = StringKeys._internal();

  String firebaseAuth = 'firebaseAuth';
  String httpFunctions = 'httpFunctions';
  String codeGallery = 'codeGallery';
  String socialLogin = 'socialLogin';
  String googleLogin = 'googleLogin';
  String facebookLogin = 'facebookLogin';

  factory StringKeys() {
    return _singleton;
  }

  StringKeys._internal();


}