import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/custom_shapes/curved_edges/curved_egdes_widget.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/common/widgets/images/rounded_image.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);

    return  Container(
        color: isDark ? AppColors.darkGrey : AppColors.lightGrey,
        child:             // main image
           Stack(
            children: [Image(
                      image: AssetImage(AppImages.productImage1),
                    ),
                   
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg)),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace/2, vertical: AppSizes.defaultSpace/4 ),
                          child: Text('1 / 8',),
                        ),
                      ),
                    ),
                    
                    ]
           ),
              
          
    );
  }
}
