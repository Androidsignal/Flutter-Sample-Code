import 'package:code_sample_demo/common/text_util_constant.dart';
import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  
  final String imagePath;
  final String title;

  const MenuButtonWidget({Key key, this.imagePath, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
          title: TitleText(
              text: title),
          leading: IconButton(
              icon: Image.asset(imagePath),
              onPressed: null)),
      elevation: 4,
    );
  }
}
