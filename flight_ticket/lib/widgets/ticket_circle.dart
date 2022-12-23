import 'package:flutter/material.dart';

class CircleAroundHole extends StatelessWidget {
  const CircleAroundHole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: DecoratedBox(
          decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 10, color: Colors.black),
      )),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 10, color: Colors.black),
      ),
    );
  }
}
