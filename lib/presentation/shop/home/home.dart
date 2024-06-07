import 'package:animate_do/animate_do.dart';
import 'package:dona/common/widgets/layouts/grid_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import './send_money.dart';
import 'package:flutter/material.dart';

import 'package:dona/utils/constants/image_strings.dart';
import '../../../common/widgets/appbar/tabbar.dart';
import '../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabHight = 100;
  List<Map<String, String>> brands = [
    {"logo": AppImages.zara, "name": "Congolenses", "details": "504 products"},
    {
      "logo": AppImages.dior,
      "name": "hoji ya henda ",
      "details": "404 products"
    },
    {"logo": AppImages.adidas, "name": "Kikolo", "details": "400 products"},
    {"logo": AppImages.jordan, "name": "Kikuxi", "details": "102 products"},
    {"logo": AppImages.jordan, "name": "Trinta", "details": "1402 products"},
  ];
  List<Map<String, String>> categories = [
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
  List<dynamic> _contacts = [
    {
      'name': 'John',
      'avatar': 'assets/users/avatar-1.png',
    },
    {
      'name': 'Samantha',
      'avatar': 'assets/users/avatar-2.png',
    },
    {
      'name': 'Mary',
      'avatar': 'assets/users/avatar-3.png',
    },
    {
      'name': 'Julian',
      'avatar': 'assets/users/avatar-4.png',
    },
    {
      'name': 'Sara',
      'avatar': 'assets/users/avatar-5.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/users/avatar-6.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/users/avatar-6.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/users/avatar-6.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/users/avatar-6.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppAppBar(title: const Text('Bancadas'), actions: [
          const AppMenuIcon(
            icon: Icon(
              CupertinoIcons.add,
              size: AppSizes.iconMd,
            ),
            iconColor: AppColors.primary,
          ),
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
                  expandedHeight: tabHight + 120,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.defaultSpace),
                        child: Column(
                          children: [
                            FadeInRight(
                              duration: Duration(milliseconds: 500),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 15.0, top: 10.0),
                                child: Text(
                                  'Mais recentes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              padding: const EdgeInsets.only(left: 5),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _contacts.length,
                                itemBuilder: (context, index) {
                                  return FadeInRight(
                                    duration: Duration(
                                        milliseconds: (index * 100) + 500),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SendMoney(
                                                    name: _contacts[index]
                                                        ['name'],
                                                    avatar: _contacts[index]
                                                        ['avatar'])));
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  Colors.blueGrey[100],
                                              backgroundImage: AssetImage(
                                                  _contacts[index]['avatar']),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _contacts[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottom: AppTabBar(tabs: categories),
                )
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInRight(
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            bottom: 15.0,
                          ),
                          child: Text(
                            'Todas',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppGridLayout(
                          itemCountRow: 3,
                          mainAxisExtent: 100,
                          itemCount: _contacts.length,
                          itemBuilder: (context, index) {
                            return FadeInDown(
                              duration:
                                  Duration(milliseconds: (index * 100) + 500),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.red[100],
                                      backgroundImage: AssetImage(
                                          _contacts[index]['avatar']),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _contacts[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ]))
              ],
            )),
      ),
    );
  }

  user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: const Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SendMoney(
                      name: _contacts[index]['name'],
                      avatar: _contacts[index]['avatar'])));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 50.0]) {
    return Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}
