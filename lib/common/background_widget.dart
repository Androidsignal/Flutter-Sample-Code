import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Background extends StatefulWidget {
  final Widget child;

  const Background({Key key, this.child}) : super(key: key);
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
              child: Image.asset('assets/leafe.png'),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
