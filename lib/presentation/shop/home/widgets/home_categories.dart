import 'package:dona/common/widgets/images/vertical_image_text.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List categories = [
      {"icon": AppImages.shoeIcon, "title": "shoe"},
      {"icon": AppImages.babyIcon, "title": "baby"},
      {"icon": AppImages.clothIcon, "title": "clothes"},
      {"icon": AppImages.foodIcon, "title": "food"},
      {"icon": AppImages.furnitureIcon, "title": "furniture"},
      {"icon": AppImages.sportIcon, "title": "sports"},
      {"icon": AppImages.electronicIcon, "title": "electronics"},
      {"icon": AppImages.animalIcon, "title": "animals"},
      {"icon": AppImages.cosmeticIcon, "title": "cosmetics"},
    ];
    return SizedBox(
      height: 80,
      child: ListView.builder(
          // ListView.builder helps to dynamically create a list based on items on the  backend
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return AppVerticalImageText(
              image: categories[index]["icon"].toString(),
              title: categories[index]["title"],
              onTap: () {},
            );
          }),
    );
  }
}
