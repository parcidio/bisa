import 'package:carousel_slider/carousel_slider.dart';
import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_attributes.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_meta_data.dart';
import 'package:dona/presentation/shop/product_details/widgets/product_rating_share.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/widgets/card/place_card.dart';
import '../../../common/widgets/chart/linechart.dart';
import '../../../common/widgets/flat_cards/leadtime_flat_card.dart';
import '../../../common/widgets/infinite_draggable_slider/infinite_dragable_slider.dart';
import '../../../common/widgets/infinite_draggable_slider/magazine_cover_image.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../common/widgets/product/product_card/product_card_vertical.dart';
import '../../../common/widgets/scale/scale.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../domain/entities/entities.dart';
import '../../../utils/constants/colors.dart';
import 'widgets/product_description.dart';

class AppProductDetails extends StatelessWidget {
  const AppProductDetails(
      {super.key, required this.productId, required this.product});

  final String productId;
  final Map<String, dynamic> product;

  void _showWeightSelector(BuildContext context) async {
    await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const WeightSelectorBottomSheet(
        pricePerKg: 200.05,
        unit: 'kg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List products = [
      {
        "name": "Produto 1",
        "place": "Praça 1",
        "rating": 4.5,
        "price": 100,
        "cent": 99,
        "previousPrice": 120,
        "previousCent": 99,
        "discount": 16.5,
      },
      {
        "name": "Produto 2",
        "place": "Praça 2",
        "rating": 4.0,
        "price": 80,
        "cent": 49,
        "previousPrice": 90,
        "previousCent": 49,
        "discount": 11.0,
      },
      {
        "name": "Produto 3",
        "place": "Mercado 1",
        "rating": 4.8,
        "price": 150,
        "cent": 0,
        "previousPrice": 180,
        "previousCent": 0,
        "discount": 16.7,
      },
      {
        "name": "Produto 4",
        "place": "Praça 3",
        "rating": 4.2,
        "price": 60,
        "cent": 99,
        "previousPrice": 75,
        "previousCent": 99,
        "discount": 19.7,
      },
      {
        "name": "Produto 5",
        "place": "Mercado 2",
        "rating": 4.7,
        "price": 110,
        "cent": 49,
        "previousPrice": 130,
        "previousCent": 49,
        "discount": 15.4,
      },
      {
        "name": "Produto 6",
        "place": "Praça 4",
        "rating": 4.3,
        "price": 90,
        "cent": 0,
        "previousPrice": 100,
        "previousCent": 0,
        "discount": 10.0,
      },
      {
        "name": "Produto 7",
        "place": "Mercado 3",
        "rating": 4.6,
        "price": 70,
        "cent": 49,
        "previousPrice": 85,
        "previousCent": 49,
        "discount": 17.5,
      },
      {
        "name": "Produto 8",
        "place": "Praça 5",
        "rating": 4.1,
        "price": 55,
        "cent": 99,
        "previousPrice": 65,
        "previousCent": 99,
        "discount": 15.2,
      },
      {
        "name": "Produto 9",
        "place": "Mercado 4",
        "rating": 4.9,
        "price": 130,
        "cent": 0,
        "previousPrice": 150,
        "previousCent": 0,
        "discount": 13.3,
      },
      {
        "name": "Produto 10",
        "place": "Praça 6",
        "rating": 4.4,
        "price": 85,
        "cent": 49,
        "previousPrice": 95,
        "previousCent": 49,
        "discount": 10.5,
      },
    ];

    return Scaffold(
      appBar:
          const AppAppBar(showSearchBar: false, showBackArrow: true, actions: [
        AppMenuIcon(
          icon: Icon(
            CupertinoIcons.bag,
            size: AppSizes.iconMd,
          ),
          iconColor: AppColors.black,
        ),
      ]),
      // bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // promo slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              child: InfiniteDragableSlider(
                iteamCount: Magazine.fakeMagazinesValues.length,
                itemBuilder: (context, index) => MagazineCoverImage(
                    magazine: Magazine.fakeMagazinesValues[index]),
              ),
            ),
            // const AppProductImageSlider(),
            // product details
            Padding(
              padding: const EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Price, Title, Stock and Brand
                  AppProductMetaData(
                    name: product['name'],
                    place: product['mean_description'],
                    stock: int.parse(product['stock_quantity'].toString()),
                    price: double.parse(product['price'].toString()),
                  ),

                  // Rating and Share button
                  const AppRatingShare(),
                  // Description
                  // AppProductDescription(
                  //   description: product['long_description'],
                  //   otherproperties: [
                  //     product['other_properties'] == null
                  //         ? {}
                  //         : product['other_properties']
                  //   ],
                  // ),
                  // Attributes
                  // const AppProductAttribute(),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showWeightSelector(context),
                      child: const Text('Estimativa por peso'),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),
                  // Checkout Button
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //         onPressed: () {},
                  //         child: const Text("Comprar agora"))),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),

                  // Description

                  const SizedBox(
                    height: AppSizes.spaceBetweenItems,
                  ),

                  const LeadTimeCard(
                    deliveryDays: 3,
                    dispatchDays: 0,
                    quantity: 2,
                  ),

                  const Divider(),
                  const AppPlaceCard(
                    placeName: 'Luanda',
                    compras: 'Segunda - Sexta',
                    entregas: '> 10 itens',
                    horario: '6h-16h',
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBetweenItems / 2,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mais informacoes",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const AppSectionHeading(
                      title: 'Produtos relacionados',
                      buttonTitle: '',
                      isSmall: true,
                      textColor: AppColors.darkGrey),
                ],
              ),
            ),

            LineChartSample3(),

            const Padding(
              padding: EdgeInsets.only(
                  right: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: AppSectionHeading(
                  title: 'Produtos relacionados',
                  buttonTitle: 'Mais',
                  isSmall: true,
                  textColor: AppColors.darkGrey),
            ),
            Container(
              color: AppColors.light,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.spaceBetweenItems),
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 300,
                      viewportFraction: .3,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
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
                  items: products.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes
                                  .cardRadiusSm), // Adjust the radius as needed
                              child: AppProductCardVertical(
                                productId: "",
                                name: "Nome de teste",
                                price: 10,
                                rate: 1,
                                product: {},
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
