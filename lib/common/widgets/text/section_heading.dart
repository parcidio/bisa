import "package:flutter/material.dart";

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = "View all",
    this.showActionButton = true,
    this.isSmall=false,
    this.onPressed,
    this.isMedium =false,
  });

  final Color? textColor;
  final bool showActionButton, isSmall, isMedium;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isSmall ? Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: textColor)
              : 
              Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle,
          style: isSmall ? Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: textColor)
              :               
              Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          
          ))
      ],
    );
  }  
}
