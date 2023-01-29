import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

       margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 3.0,
      color: Colors.red,
    );
  }
}
