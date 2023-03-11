import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10).r,
      width: double.infinity,
      height: 3.0.h,
      color: Colors.red,
    );
  }
}
