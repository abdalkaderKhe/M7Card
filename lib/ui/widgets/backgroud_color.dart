import 'package:flutter/material.dart';

class BackGroundColor extends StatelessWidget {
  const BackGroundColor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Color.fromRGBO(247, 241, 253, 1),
          Color.fromRGBO(247, 241, 253, 1),
          Color.fromRGBO(241, 232, 251, 1),
          Color.fromRGBO(206, 223, 253, 1),
          Color.fromRGBO(206, 223, 253, 1),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}
