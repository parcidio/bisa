import 'package:animate_do/animate_do.dart';
import 'package:dona/common/widgets/custom_shapes/containers/searchbar_container.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
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
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.arrow_left,
              ))
          : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
      title: FadeInRight(
          duration: const Duration(milliseconds: 500),
          child: Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: title)),
      actions: actions,
      bottom: showSearchBar
          ? const PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppSearchContainer(
                text: 'Encontre os ',
                secondText: 'melhores precos...',
                showBorder: true,
                showBackground: true,
                padding: EdgeInsets.zero,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => showSearchBar
      ? Size.fromHeight(AppDeviceUtils.getAppBarHeight() + 50)
      : Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
