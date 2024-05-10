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
        // appBar: AppBar(title: Text("Title"),bottom: PreferredSize( preferredSize: Size.fromHeight(100), child:  AppSearchContainer(
        //                     text: 'Encontre os',
        //                     secondText: 'Melhores Produtos',
        //                     showBorder: true,
        //                     showBackground: true,
        //                     padding: EdgeInsets.zero,
        //                   )),),
        appBar: AppAppBar(title:  Text('Store'), actions: [
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
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Searchbar
                          // const SizedBox(
                          //   height: AppSizes.spaceBetweenItems,
                          // ),
                          // // const AppSearchContainer(
                          // //   text: 'Search in store',
                          // //   showBorder: true,
                          // //   showBackground: false,
                          // //   padding: EdgeInsets.zero,
                          // // ),
                          const SizedBox(
                            height: AppSizes.spaceBetweenSections,
                          ),
                          // Featured brands
                          const AppSectionHeading(
                            title: "Featured brands",
                          ),
                          const SizedBox(
                            height: AppSizes.spaceBetweenItems / 1.5,
                          ),

                          AppGridLayout(
                              itemCount: brands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return AppBrandCardHorizontal(
                                    brandIcon: brands[index]['logo'],
                                    brandName: brands[index]['name'],
                                    details: brands[index]['details']);
                              })
                        ]),
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
