
import 'package:dona/common/widgets/custom_shapes/containers/searchbar_container.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.showAvatar = true,
    this.showSearchBar = true,
  });

  final Widget? title;
  final bool showBackArrow, showAvatar, showSearchBar;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: AppBar( 
                  automaticallyImplyLeading: false,
                  leading: showBackArrow
                      ? IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                          ))
                      : leadingIcon != null
                          ? IconButton(
                              onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                          : null,
                  title: title,
                  actions: actions,
                  bottom:   showSearchBar? const PreferredSize(
                            preferredSize: Size.fromHeight(100),
                            child:  AppSearchContainer(
                              text: 'Encontre os',
                              secondText: 'Melhores Produtos',
                              showBorder: true,
                              showBackground: true,
                              padding: EdgeInsets.zero,                           
                            ),
                            // child:  PreferredSize( preferredSize: Size.fromHeight(100), child: Text("bottom"),),
                            ): null,
                  ),
    );
  }

  @override
  Size get preferredSize => showSearchBar ? Size.fromHeight(AppDeviceUtils.getAppBarHeight()  +50): Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
