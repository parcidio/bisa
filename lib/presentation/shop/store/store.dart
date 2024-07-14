import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/tabbar.dart';
import '../../../common/widgets/brand/brand_card_horizontal.dart';
import '../../../common/widgets/custom_shapes/containers/searchbar_container.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../store/widgets/category_tabs.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int tabHeight = 100;

    final supabase = Supabase.instance.client;

    Future<List<Map<String, String>>> fetchCategories() async {
      final response =
          await supabase.from('category').select().eq('is_active', true);
      List<Map<String, String>> categories = response.map((item) {
        return {
          "title": item['title'].toString(),
          "icon": item['icon'].toString(),
        };
      }).toList();
      return categories;
    }

    Future<List<Map<String, String>>> fetchBrands() async {
      final response =
          await supabase.from('market_location').select().eq('is_active', true);
      List<Map<String, String>> brands = response.map((item) {
        return {
          "logo": item['logo'].toString(),
          "name": item['name'].toString(),
          "product": "${item['products_number']} products",
          "demand": "${item['demand']} compras",
        };
      }).toList();
      return brands;
    }

    return FutureBuilder<List<Map<String, String>>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories available'));
        } else {
          final categories = snapshot.data!;
          return DefaultTabController(
            length: categories.length,
            child: Scaffold(
              appBar: AppAppBar(
                showSearchBar: false,
                title: const Text('Praça'),
                actions: [
                  const AppMenuIcon(
                    icon: Icon(
                      CupertinoIcons.cube_box,
                      size: AppSizes.iconMd,
                    ),
                    iconColor: AppColors.black,
                  ),
                  const AppMenuIcon(
                    icon: Icon(
                      CupertinoIcons.bag,
                      size: AppSizes.iconMd,
                    ),
                    iconColor: AppColors.black,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBetweenItems,
                  ),
                  AdvancedAvatar(
                    statusSize: 5,
                    size: AppSizes.iconLg,
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
                ],
              ),
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
                      expandedHeight: tabHeight + 70,
                      flexibleSpace: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.defaultSpace / 2),
                            child: Column(
                              children: [
                                const AppSearchContainer(
                                  text: 'Encontre os ',
                                  secondText: 'melhores precos...',
                                  showBorder: true,
                                  showBackground: true,
                                  padding: EdgeInsets.zero,
                                ),
                                FutureBuilder<List<Map<String, String>>>(
                                  future: fetchBrands(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        color: AppColors.primary,
                                        strokeWidth: AppSizes.xs,
                                      ));
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else {
                                      final brands = snapshot.data ?? [];
                                      return CarouselSlider(
                                        options: CarouselOptions(
                                            viewportFraction: 0.8,
                                            initialPage: 0,
                                            animateToClosest: true,
                                            enableInfiniteScroll: true,
                                            autoPlay: true,
                                            autoPlayInterval:
                                                const Duration(seconds: 5),
                                            autoPlayAnimationDuration:
                                                const Duration(
                                                    milliseconds: 1000),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enlargeFactor: 0,
                                            scrollDirection: Axis.horizontal,
                                            pauseAutoPlayInFiniteScroll: true,
                                            pauseAutoPlayOnManualNavigate: true,
                                            pauseAutoPlayOnTouch: true,
                                            padEnds: true,
                                            enlargeCenterPage: false),
                                        items: brands.map((item) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return AppBrandCardHorizontal(
                                                brandIcon: item['logo']!,
                                                brandName: item['name']!,
                                                product: item['product']!,
                                                demand: item['demand']!,
                                              );
                                            },
                                          );
                                        }).toList(),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      bottom: AppTabBar(
                        tabs: categories.toList(),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: categories.map((category) {
                    return const AppCategoryTab(
                      brandIcon: AppImages.adidas,
                      brandName: "",
                      brandDetail: "504 products",
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
