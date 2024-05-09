import 'package:dona/common/widgets/appbar/appbar.dart';
import 'package:dona/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:dona/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:dona/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:dona/common/widgets/text/section_heading.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        // header
        AppPrimaryHeaderContainer(
            child: Column(
          children: [
            AppAppBar(
              title: Text(
                'Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: AppColors.white),
              ),
            ),
            const AppUserProfileTile(),
            const SizedBox(
              height: AppSizes.spaceBetweenSections,
            )
          ],
        )),
        // Body
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Account settings
              const AppSectionHeading(
                title: 'Settings',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),
              AppSettigsMenuTile(
                title: "My address",
                subtitle: "Set shopping delivery address",
                icon: Iconsax.safe_home,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "My cart",
                subtitle: "Add, removr products and move them to checkout",
                icon: Iconsax.shopping_cart,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "My Orders",
                subtitle: "In progress and completed orders",
                icon: Iconsax.bag_tick,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "Bank account",
                subtitle: "withdraw balance to a registed bank account",
                icon: Iconsax.bank,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "My coupons",
                subtitle: "List of all the discounted coupons",
                icon: Iconsax.discount_shape,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "Notification",
                subtitle: "Manage your notification message",
                icon: Iconsax.notification,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "Account Privacy",
                subtitle: "Manage data usage",
                icon: Iconsax.security_card,
                onTap: () {},
              ),

              // App Settings
              const SizedBox(height: AppSizes.spaceBetweenSections),
              const AppSectionHeading(
                title: 'App Settings',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),
              AppSettigsMenuTile(
                title: "Load data",
                subtitle: "Upload  data to your Cloud Firebase",
                icon: Iconsax.safe_home,
                onTap: () {},
              ),
              AppSettigsMenuTile(
                title: "Geolocation",
                subtitle: "Set recommendations based on your location",
                icon: Iconsax.safe_home,
                onTap: () {},
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              AppSettigsMenuTile(
                title: "Dark mode",
                subtitle: "Set the appearance of the app to dark mode",
                icon: Iconsax.safe_home,
                onTap: () {},
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              // Logout Button
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Logout'),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections * 2,
              ),
            ],
          ),
        )
      ])),
    );
  }
}
