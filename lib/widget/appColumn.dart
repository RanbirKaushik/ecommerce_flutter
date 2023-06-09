import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'big_text.dart';
import 'customIconAndText.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "4.5",
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "1287",
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "Comments",
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconAndText(
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1,
                text: "Normal"),
            CustomIconAndText(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: "1.7 Km"),
            CustomIconAndText(
                icon: Icons.access_time_rounded,
                iconColor: AppColors.iconColor2,
                text: "32 min"),
          ],
        )
      ],
    );
  }
}
