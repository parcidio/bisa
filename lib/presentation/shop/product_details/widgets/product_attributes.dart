import 'package:dona/common/button_group/button_group.dart';
import 'package:dona/common/widgets/chips/choice_chip.dart';
import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/common/widgets/product/product_card/product_price_text.dart';
import 'package:dona/common/widgets/text/product_title_text.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    final controller = GroupButtonController();
    return Column(
      children: [
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Tamanho'),           
            AppButtonGroup(itemList: ["30", "32", "34", "40", "41", "42"])
           ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const AppSectionHeading(title: 'Cor'),           
            AppButtonGroup(itemList: ["vermelho", "verde", "preto", "branco"])
            ]),
          ],
    );
  }
}
