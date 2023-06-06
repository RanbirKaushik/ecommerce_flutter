import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? textColor;
  double size;
  double hight;
  SmallText(
      {Key? key,
        required this.text,
        this.textColor = AppColors.textColor,
        this.size = 0,
        this.hight=1.2
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.iconSize12:size,
        fontFamily: 'Roboto',
        height: hight
      ),
    );
  }
}
