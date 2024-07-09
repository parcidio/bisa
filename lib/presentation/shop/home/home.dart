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

class Service {
  final String name;
  final String imageURL;

  Service(this.name, this.imageURL);
}

class _HomeScreenState extends State<HomeScreen> {
  int tabHight = 100;
  List<Service> services = [
    Service('Cleaning',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Plumber',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service('Electrician',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service('Painter',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    Service('Gardener',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service('Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    Service('Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
    Service('Driver',
        'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
    Service('Cook',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                child: Text(
                  'Which service \ndo you need?',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ]),
      ),
    );
  }
}
