import 'package:dona/common/widgets/button_group/button_group.dart';
  import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Column(
      children: [
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.spaceBetweenItems/2,),
            AppSectionHeading(title: 'Selecione o tamanho', buttonTitle: 'Mais', isSmall: true, textColor: AppColors.darkGrey),           
            SizedBox(height: AppSizes.spaceBetweenItems/2,),
            AppButtonGroup(itemList: ["30", "32", "34", "40", "41", "42"])
           ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.spaceBetweenItems/2,),
            AppSectionHeading(title: 'Selecione a cor', buttonTitle: 'Mais', isSmall: true, textColor: AppColors.darkGrey),           
            SizedBox(height: AppSizes.spaceBetweenItems/2,),
            AppButtonGroup(itemList: ["vermelho", "verde", "preto", "branco"])
            ]),
          ],
    );
  }
}
