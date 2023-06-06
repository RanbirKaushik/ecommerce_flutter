import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';

class CustomIconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  const CustomIconAndText({Key? key, required this.icon, required this.iconColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text),
        SizedBox(width: Dimensions.width5,),

      ],
    );
  }
}
