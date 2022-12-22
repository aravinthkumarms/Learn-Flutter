import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleBar({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.headLineStyle2),
          InkWell(
            child: Text(subTitle,
                style: Styles.textStyle.copyWith(color: Styles.primaryColor)),
            onTap: () {
              print("Text");
            },
          )
        ],
      ),
    );
  }
}
