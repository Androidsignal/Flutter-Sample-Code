class LocalModel {
  String languageCode;
  String countryCode;

  LocalModel({this.languageCode, this.countryCode});

  LocalModel.fromJson(Map<String, dynamic> json) {
    languageCode = json['languageCode'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['languageCode'] = this.languageCode;
    data['countryCode'] = this.countryCode;
    return data;
  }
}
