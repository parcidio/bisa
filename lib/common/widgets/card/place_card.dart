import 'package:dona/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class AppPlaceCard extends StatelessWidget {
  const AppPlaceCard({
    Key? key,
    required this.placeName,
    required this.compras,
    required this.entregas,
    this.showBorder = true,
    required this.horario,
  }) : super(key: key);

  final String placeName, horario;
  final String compras, entregas;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AppRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(AppSizes.sm),
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalhes de entregas",
              // overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppSizes.defaultSpace / 2),
            Container(
              width: 450,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                // Ensure the container has a fixed height
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                        -8.8390, 13.2894), // Coordinates for Luanda, Angola
                    zoom: 12.0, // Adjusted zoom level for better focus
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', // URL for grayish tiles
                      userAgentPackageName: 'com.example.app',
                      // Add subdomains for the tile server
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.placemark,
                      size: AppSizes.iconMd,
                    ),
                    SizedBox(width: 4),
                    Text(
                      placeName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      size: AppSizes.iconMd,
                    ),
                    SizedBox(width: 4),
                    Text(
                      compras,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: AppSizes.iconMd,
                    ),
                    SizedBox(width: 4),
                    Text(
                      horario,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.cube_box,
                      size: AppSizes.iconMd,
                    ),
                    SizedBox(width: 4),
                    Text(
                      entregas,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
