import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/brand/brand_card_category.dart';
import '../../../common/widgets/brand/brand_card_horizontal.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

const apiKey = "v3XSrX3LVo5zlCy0QWje";
const styleUrl = "https://api.maptiler.com/maps/streets-v2/style.json";

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BancadaScreen();
  }
}

class BancadaScreen extends StatefulWidget {
  const BancadaScreen({super.key});

  @override
  State createState() => MapState();
}

class MapState extends State<BancadaScreen> {
  @override
  Widget build(BuildContext context) {
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

    const List<Widget> Types = <Widget>[
      Text('Ofertas'),
      Text('Demada'),
    ];

    final List<bool> _selectedType = <bool>[true, false];
    bool isVertical = false;

    List<Map<String, String>> categories = [
      // {"icon": "", "title": "Tudo"},
      {"icon": "👟", "title": "Shoe"},
      {"icon": "👶", "title": "Baby"},
      {"icon": "👗", "title": "Clothes"},
      {"icon": "🍔", "title": "Food"},
      {"icon": "🛋️", "title": "Furniture"},
      {"icon": "🏅", "title": "Sports"},
      {"icon": "📱", "title": "Electronics"},
      {"icon": "🐾", "title": "Animals"},
      {"icon": "💄", "title": "Cosmetics"},
    ];
    return Scaffold(
      appBar: AppAppBar(
          showSearchBar: true,
          title: const Text('Bancadas'),
          actions: [
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
          ]),
      body: SlidingUpPanel(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
          minHeight: AppSizes.appPanelHight,
          margin: EdgeInsets.all(AppSizes.defaultItems),
          panel: DefaultTabController(length: 3, child: Container()),
          color: AppColors.white,
          parallaxEnabled: true,
          backdropEnabled: true,
          body: Stack(children: [
            MapLibreMap(
              styleString: "$styleUrl?key=$apiKey",
              myLocationEnabled: true,
              compassEnabled: false,
              dragEnabled: false,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(-8.838333, 13.234444), zoom: 11),
              trackCameraPosition: true,
            ),
            Positioned(
              // right: AppSizes.defaultItems,
              // bottom: AppSizes.spaceBetweenSections,
              height: AppSizes.appBarHeight,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 0.2,
                      initialPage: 0,
                      animateToClosest: true,
                      enableInfiniteScroll: true,
                      reverse: true,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0,
                      scrollDirection: Axis.horizontal,
                      pauseAutoPlayInFiniteScroll: true,
                      pauseAutoPlayOnManualNavigate: true,
                      pauseAutoPlayOnTouch: true,
                      enlargeCenterPage: false),
                  items: categories.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return AppBrandCardCategory(
                          brandIcon: item['icon']!,
                          brandName: item['title']!,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ])),
    );
  }
}
