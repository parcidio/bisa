import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';
// import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/brand/brand_card_category.dart';
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
  final MapController _controller = MapController();
  Style? _style;
  Object? _error;

  get logger => Logger();

  @override
  void initState() {
    super.initState();
    _initStyle();
  }

  void _initStyle() async {
    try {
      _style = await _readStyle();
    } catch (e, stack) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(stack);
      _error = e;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget? children;
    if (_error != null) {
      children = Expanded(child: Text(_error!.toString()));
      logger.d("Map could not be loaded");
    } else if (_style == null) {
      children = const Center(
          child: CircularProgressIndicator(
        color: AppColors.primary,
        strokeWidth: AppSizes.sm,
      ));
    } else {
      children = Flexible(child: _map(_style!));
    }

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

    final List<bool> selectedType = <bool>[true, false];
    bool isVertical = false;

    List<Map<String, String>> categories = [
      // {"icon": "", "title": "Tudo"},
      {"icon": "🔥", "title": "Tudo"},
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
          margin: const EdgeInsets.all(AppSizes.defaultItems),
          panel: DefaultTabController(length: 3, child: Container()),
          color: AppColors.white,
          parallaxEnabled: true,
          backdropEnabled: true,
          body: Stack(children: [
            children,
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

  // alternates:
//   Mapbox - mapbox://styles/mapbox/streets-v12?access_token={key}
//   Maptiler - https://api.maptiler.com/maps/outdoor/style.json?key={key}
//   Stadia Maps - https://tiles.stadiamaps.com/styles/outdoors.json?api_key={key}
  Future<Style> _readStyle() => StyleReader(
          uri: "$styleUrl?key={key}",
          apiKey: apiKey,
          logger: logger.d("Map was loaded successfully"))
      .read();

  Widget _map(Style style) => FlutterMap(
        mapController: _controller,
        options: MapOptions(
            initialCenter: const LatLng(-8.838333, 13.234444),
            initialZoom: 14,
            maxZoom: 18,
            minZoom: 12,
            backgroundColor: Theme.of(context).canvasColor),
        children: [
          VectorTileLayer(
              tileProviders: style.providers,
              theme: style.theme,
              sprites: style.sprites,
              // maximumZoom: 22,
              tileOffset: TileOffset.mapbox,
              layerMode: VectorTileLayerMode.vector)
        ],
      );

  Widget _statusText() => Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: StreamBuilder(
          stream: _controller.mapEventStream,
          builder: (context, snapshot) {
            return Text(
                'Zoom: ${_controller.camera.zoom.toStringAsFixed(2)} Center: ${_controller.camera.center.latitude.toStringAsFixed(4)},${_controller.camera.center.longitude.toStringAsFixed(4)}');
          }));
}
