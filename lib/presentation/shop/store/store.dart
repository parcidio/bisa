import 'package:dona/app.dart';
import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/appbar/tabbar.dart';
import 'package:dona/common/widgets/brand/brand_card_horizontal.dart';
import 'package:dona/common/widgets/custom_shapes/containers/searchbar_container.dart';
import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:dona/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/presentation/shop/store/widgets/category_tabs.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List brands = [
      {"logo": AppImages.zara, "name": "Zara", "details": "504 products"},
      {"logo": AppImages.dior, "name": "Dior", "details": "404 products"},
      {"logo": AppImages.adidas, "name": "Adidas", "details": "400 products"},
      {"logo": AppImages.jordan, "name": "Jordan", "details": "102 products"},
    ];
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
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(       
        appBar: AppAppBar(title:  const Text('Store'), actions: [
          AppCartMenuIcon(
            onPressed: () {},
            iconColor: AppColors.black,
          )
        ]),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: AppHelperFuncions.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.white,
                  expandedHeight: 520,
                  flexibleSpace:  ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                            Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.defaultSpace),
                    child:
                           CarouselSlider(
  options: CarouselOptions(
    height: 200,
    aspectRatio: 16 / 9,
    viewportFraction: 0.5,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeFactor: 0.3,
    scrollDirection: Axis.horizontal,
  ),
  items: [1, 2, 3, 4, 5].map((item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm), // Adjust the radius as needed
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3JtMzYyLTAxYS1tb2NrdXAuanBn.jpg",
              ),
            ),
          ),
        );
      },
    );
  }).toList(),
),
 ),
                         Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                    child: Column(children: [                 
                          const AppSectionHeading(
                            title: "Featured brands",
                          ),
                          const SizedBox(
                            height: AppSizes.spaceBetweenItems/10,
                          ),
                          AppGridLayout(
                            itemCount: brands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return AppBrandCardHorizontal(
                                  brandIcon: brands[index]['logo'],
                                  brandName: brands[index]['name'],
                                  details: brands[index]['details']);
                            }),     
                        ]),
                  ),   ],) ,
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
