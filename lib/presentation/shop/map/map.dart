import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedMarker;
  List<String> products = [];

  void _onMarkerTapped(LatLng point, List<String> markerProducts) {
    setState(() {
      selectedMarker = point;
      products = markerProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center:
                  LatLng(-8.8390, 13.2894), // Coordinates for Luanda, Angola
              zoom: 12.0, // Adjusted zoom level for better focus
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', // URL for grayish tiles
                userAgentPackageName: 'com.example.app',
                subdomains: [
                  'a',
                  'b',
                  'c',
                  'd'
                ], // Add subdomains for the tile server
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(
                        -8.8277, 13.2456), // Coordinates for the first market
                    child: GestureDetector(
                      onTap: () => _onMarkerTapped(LatLng(-8.8277, 13.2456),
                          ['Product 1', 'Product 2', 'Product 3']),
                      child: Column(
                        children: [
                          Icon(Icons.location_on,
                              size: 40.0, color: Colors.red),
                          Text('Market 1',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(
                        -8.8463, 13.3050), // Coordinates for the second market
                    child: GestureDetector(
                      onTap: () => _onMarkerTapped(LatLng(-8.8463, 13.3050),
                          ['Product 4', 'Product 5', 'Product 6']),
                      child: Column(
                        children: [
                          Icon(Icons.location_on,
                              size: 40.0, color: Colors.red),
                          Text('Market 2',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(
                        -8.8400, 13.2300), // Coordinates for the third market
                    child: GestureDetector(
                      onTap: () => _onMarkerTapped(LatLng(-8.8400, 13.2300),
                          ['Product 7', 'Product 8', 'Product 9']),
                      child: Column(
                        children: [
                          Icon(Icons.location_on,
                              size: 40.0, color: Colors.red),
                          Text('Market 3',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 140,
                  child: AppAppBar(title: const Text('Explorar'), actions: [
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                            label: Text('Todos'), onSelected: (bool value) {}),
                        SizedBox(width: 8),
                        FilterChip(
                            label: Text('Frio'), onSelected: (bool value) {}),
                        SizedBox(width: 8),
                        FilterChip(
                            label: Text('Limpeza'),
                            onSelected: (bool value) {}),
                        SizedBox(width: 8),
                        FilterChip(
                            label: Text('Construção'),
                            onSelected: (bool value) {}),
                        SizedBox(width: 8),
                        FilterChip(
                            label: Text('Pintura'),
                            onSelected: (bool value) {}),
                        SizedBox(width: 8),
                        FilterChip(
                            label: Text('Eletrodom.'),
                            onSelected: (bool value) {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (selectedMarker != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(products[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          // RichAttributionWidget(
          //   attributions: [
          //     TextSourceAttribution(
          //       'OpenStreetMap contributors',
          //       onTap: () =>
          //           launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
