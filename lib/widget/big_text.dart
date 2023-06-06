import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? textColor;
  double size;
  TextOverflow overflow;

  BigText(
      {Key? key,
      required this.text,
      this.textColor = AppColors.mainBlackColor,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font20:size,
        fontFamily: 'Roboto',
      ),
      overflow: overflow,
      maxLines: 1,
    );
  }
}
