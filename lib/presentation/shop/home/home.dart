import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/product/cart/menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Service {
  final String name;
  final String imageURL;

  Service(this.name, this.imageURL);
}

class _HomeScreenState extends State<HomeScreen> {
  int tabHight = 100;
  List<Service> services = [
    Service('limpeza',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Alfaiate', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    Service(
        'Lavandaria', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    Service('Canaliçao',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Electricidade',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service('Pinturas',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Carpintaria', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Jardinagem',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppBar(
            showSearchBar: false,
            title: const Text('Serviços'),
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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor: AppHelperFuncions.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.white,
                  expandedHeight: tabHight + 1,
                  flexibleSpace: const Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                    child: Text(
                      'Quais serviços procuras?',
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return serviceContainer(services[index].imageURL,
                              services[index].name, index);
                        }),
                  ),
                ]),
          ),
        ));
  }

  serviceContainer(String image, String name, int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (selectedService == index) {
                selectedService = -1;
              } else {
                selectedService = index;
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: selectedService == index
                  ? AppColors.primary.withOpacity(0.3)
                  : Colors.grey.shade100,
              border: Border.all(
                color: selectedService == index
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.network(image, height: 40),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ]),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
