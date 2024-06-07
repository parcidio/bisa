import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/tabbar.dart';
import '../../../common/widgets/brand/brand_card_horizontal.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../store/widgets/category_tabs.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int tabHight = 100;
    List<Map<String, String>> brands = [
      {
        "logo": AppImages.greenAppLogo,
        "name": "Congolenses",
        "details": "504 products"
      },
      {
        "logo": AppImages.darkAppLogo,
        "name": "hoji ya henda ",
        "details": "404 products"
      },
      {
        "logo": AppImages.darkAppLogo,
        "name": "Kikolo",
        "details": "400 products"
      },
      {
        "logo": AppImages.darkAppLogo,
        "name": "Kikuxi",
        "details": "102 products"
      },
      {
        "logo": AppImages.darkAppLogo,
        "name": "Trinta",
        "details": "1402 products"
      },
    ];
    List<Map<String, String>> categories = [
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
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppAppBar(title: const Text('Parças'), actions: [
          const AppMenuIcon(
            icon: Icon(
              CupertinoIcons.add,
              size: AppSizes.iconMd,
            ),
            iconColor: AppColors.primary,
          ),
          const AppMenuIcon(
            icon: Icon(
              CupertinoIcons.bag,
              size: AppSizes.iconSm,
            ),
            iconColor: AppColors.black,
          ),
          const SizedBox(
            width: AppSizes.spaceBetweenItems,
          ),
          AdvancedAvatar(
            statusSize: 5,
            size: AppSizes.iconMd,
            name: 'Parcidio Andre',
            image: const NetworkImage(
                'https://avatars.githubusercontent.com/u/44862147?v=4'),
            foregroundDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            children: [
              AlignCircular(
                alignment: Alignment.topRight,
                child: Container(
                  width: 12,
                  height: 12,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.5,
                    ),
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: AppSizes.spaceBetweenItems,
          ),
        ]),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor: AppHelperFuncions.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.white,
                  expandedHeight: tabHight + 40,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.defaultSpace),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 0.6,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeFactor: 0.2,
                              scrollDirection: Axis.horizontal,
                              pauseAutoPlayInFiniteScroll: true,
                              pauseAutoPlayOnManualNavigate: true,
                              pauseAutoPlayOnTouch: true,
                              enlargeCenterPage: true),
                          items: brands.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(AppSizes
                                          .cardRadiusSm), // Adjust the radius as needed
                                      child: AppBrandCardHorizontal(
                                          brandIcon: item['logo']!,
                                          brandName: item['name']!,
                                          details: item['details']!)),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  bottom: AppTabBar(tabs: categories),
                )
              ];
            },
            body: const TabBarView(
              children: [
                AppCategoryTab(
                  brandIcon: AppImages.adidas,
                  brandName: "Adidas",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.nike,
                  brandName: "Nike",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.dior,
                  brandName: "Dior",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.zara,
                  brandName: "Zara",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.jordan,
                  brandName: "Jordan",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.nike,
                  brandName: "Nike",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.adidas,
                  brandName: "Adidas",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.zara,
                  brandName: "Zara",
                  brandDetail: "504 products",
                ),
                AppCategoryTab(
                  brandIcon: AppImages.jordan,
                  brandName: "Jordan",
                  brandDetail: "504 products",
                ),
              ],
            )),
      ),
    );
  }
}
