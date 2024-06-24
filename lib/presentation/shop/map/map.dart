import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

const apiKey = "v3XSrX3LVo5zlCy0QWje";
const styleUrl = "https://api.maptiler.com/maps/streets-v2/style.json";

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Map();
  }
}

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State createState() => MapState();
}

class MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
          borderRadius: BorderRadius.circular(15),
          minHeight: AppSizes.appPanelHight,
          panel: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const TabBar(
                  tabs: [
                    Tab(
                      text: "Carona",
                    ),
                    Tab(
                      text: "Entrega",
                    ),
                    Tab(
                      text: "Inter-provincial",
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ),
          color: AppColors.white,
          parallaxEnabled: false,
          backdropEnabled: true,
          body: Stack(children: [
            MapLibreMap(
              styleString: "$styleUrl?key=$apiKey",
              myLocationEnabled: true,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(-8.838333, 13.234444), zoom: 16),
              trackCameraPosition: true,
            ),
            Positioned(
                left: AppSizes.defaultItems,
                top: AppSizes.spaceBetweenSections,
                child: AdvancedAvatar(
                  statusSize: 16,
                  name: 'Parcidio Andre',
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/44862147?v=4'),
                  foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  children: [
                    AlignCircular(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ])),
    );
  }
}
