import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_styles.dart';
import '../utils/app_layout.dart';

class AppColumnLayout extends StatelessWidget {
  final String firstText;
  final String secondText;
  final MainAxisAlignment alignment;
  const AppColumnLayout(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: alignment, children: [
      Text(
        firstText,
        style: Styles.headLineStyle3.copyWith(color: Colors.black),
      ),
      Gap(AppLayout.getHeight(5)),
      Text(
        secondText,
        style: Styles.headLineStyle3.copyWith(color: Colors.black),
      )
    ]);
  }
}
