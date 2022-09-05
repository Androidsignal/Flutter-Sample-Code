import 'package:flutter/material.dart';

class Body1Text extends StatelessWidget {
  final String text;
  final Color textColor;
  final num fontSize;
  final num maxLine;

  const Body1Text({
    Key key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:  MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodyText2.copyWith(
          color: textColor
        ),
        maxLines: maxLine,
      ),
    );
  }
}

class Body2Text extends StatelessWidget {
  final String text;
  final Color textColor;
  final num fontSize;
  final num maxLine;

  const Body2Text({
    Key key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:  MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold
        ),
        maxLines: maxLine,
      ),
    );
  }
}


class SubTitleText extends StatelessWidget {
  final String text;
  final Color textColor;
  final num fontSize;
  final num maxLine;

  const SubTitleText({
    Key key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:  MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.subtitle2.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500
        ),
        maxLines: maxLine,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color textColor;
  final num fontSize;
  final num maxLine;

  const TitleText({
    Key key,
    this.text,
    this.textColor,
    this.fontSize,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:  MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme?titleMedium.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500
        ),
        maxLines: maxLine,
      ),
    );
  }
}
