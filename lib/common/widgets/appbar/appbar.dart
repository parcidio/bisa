
import 'package:dona/common/widgets/custom_shapes/containers/searchbar_container.dart';
import 'package:dona/utils/constants/colors.dart';
import 'package:dona/utils/constants/sizes.dart';
import 'package:dona/utils/device/device._utility.dart';
import 'package:dona/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.showAvatar = true
  });

  final Widget? title;
  final bool showBackArrow, showAvatar;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFuncions.isDarkMode(context);
    return PreferredSize(
          preferredSize: Size.fromHeight(50.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Column(
          
          children: [
            AppBar(
                automaticallyImplyLeading: false,
                leading: showAvatar
                        ?   AdvancedAvatar(
                      statusSize: 16,
                      name: 'Parcidio Andre',
                      image: NetworkImage('https://avatars.githubusercontent.com/u/44862147?v=4'),
                      foregroundDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      decoration:  const BoxDecoration(
                        color: Colors.transparent,                 
                         shape: BoxShape.circle,
                        
                      ),
                      children: [
                     
                        AlignCircular(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 18,
                            height: 18,
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
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      
                      ],
                   
                      )
                        :
                        !showBackArrow
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
                actions: actions),
               
              const AppSearchContainer(
                              text: 'Encontre os',
                              secondText: 'Melhores Produtos',
                              showBorder: true,
                              showBackground: true,
                              padding: EdgeInsets.zero,
                            ), 
                           
               
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
