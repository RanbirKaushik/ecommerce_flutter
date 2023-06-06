import 'package:e_commerce/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final double iconSize;
  const AppIcons({Key? key, required this.icon, this.iconColor = const Color(0xFF756d54), this.iconBackgroundColor = const Color(0xFFfcf4e4), this.iconSize = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(iconSize/2),
        color: iconBackgroundColor
      ),
      child: Icon(icon,color: iconColor,size: Dimensions.height16,),
    );
  }
}
