import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/common/widgets/icons/circular_icon.dart';
import 'package:dona/utils/constants/image_strings.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:logger/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/tabbar.dart';
import '../../../common/widgets/avatar/avatar.dart';
import '../../../common/widgets/brand/brand_card_horizontal.dart';
import '../../../common/widgets/custom_shapes/containers/searchbar_container.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../common/widgets/progress_bar/circular_progress.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../cart/cart.dart';
import '../product/product_form.dart';
import '../store/widgets/category_tabs.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int tabHeight = 100;

    final supabase = Supabase.instance.client;

    Future<List<Map<String, dynamic>>> fetchCategories() async {
      final response = await supabase
          .from('category')
          .select('*, product(*)')
          .eq('is_active', true)
          .not('product', 'is', null);

      List<Map<String, dynamic>> categories = response.map((item) {
        return {
          "title": item['title'].toString(),
          "icon": item['icon'].toString(),
          "products": item['product'],
        };
      }).toList();
      Logger logger = Logger();
      logger.e(response);
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

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: const Center(child: AppCircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories available'));
        } else {
          final categories = snapshot.data!;
          return DefaultTabController(
            length: categories.length,
            child: Scaffold(
              body:
                  StoreScreenBody(categories: categories, tabHeight: tabHeight),
            ),
          );
        }
      },
    );
  }
}

class StoreScreenBody extends StatefulWidget {
  final List<Map<String, dynamic>> categories;
  final int tabHeight;

  StoreScreenBody({required this.categories, required this.tabHeight});

  @override
  _StoreScreenBodyState createState() => _StoreScreenBodyState();
}

class _StoreScreenBodyState extends State<StoreScreenBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) setState(() => _isVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) setState(() => _isVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void setCartItemToMinimal(bool state) {
    _isOpen = state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showSearchBar: false,
        title: const Text('Praça'),
        actions: [
          // const AppMenuIcon(
          //   icon: Icon(
          //     CupertinoIcons.cube_box,
          //     size: AppSizes.iconMd,
          //   ),
          //   iconColor: AppColors.black,
          // ),
          const AppMenuIcon(
            icon: Icon(
              CupertinoIcons.location_north_line,
              size: AppSizes.iconMd,
            ),
            iconColor: AppColors.black,
          ),
          const SizedBox(
            width: AppSizes.spaceBetweenItems,
          ),
          AvatarWidget(),

          const SizedBox(
            width: AppSizes.spaceBetweenItems,
          ),
        ],
      ),
      body: NestedScrollView(
        controller: _scrollController,
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
              expandedHeight: widget.tabHeight + 70,
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
                          secondText: 'melhores preços...',
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
                                  child: AppCircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
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
                                        const Duration(milliseconds: 1000),
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
                tabs: widget.categories.toList(),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            TabBarView(
              children: widget.categories.map((category) {
                return AppCategoryTab(
                  products: category['products'],
                );
              }).toList(),
            ),
            AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _isVisible ? 1.0 : 0.0,
                child: SlidingUpPanel(
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
                    minHeight: AppSizes.appPanelHight / 2,
                    margin: const EdgeInsets.all(AppSizes.defaultItems),
                    color: AppColors.primary,
                    parallaxEnabled: false,
                    backdropEnabled: false,
                    onPanelClosed: () => setCartItemToMinimal(false),
                    onPanelOpened: () => setCartItemToMinimal(true),
                    collapsed: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      const Align(
                                        widthFactor: 0.3,
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.white,
                                          radius: 60,
                                          child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: AssetImage(
                                                AppImages.productImage1,
                                              )),
                                        ),
                                      )
                                  ],
                                ),
                                SizedBox(
                                  width: AppSizes.spaceBetweenSections,
                                ),
                                AppCircularIcon(
                                  onPressed: () {},
                                  icon: CupertinoIcons.bag_fill,
                                ),
                              ],
                            ),
                          ]),
                    ),
                    panel: AppCartScreen())),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> fetchBrands() async {
    final supabase = Supabase.instance.client;

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
}
