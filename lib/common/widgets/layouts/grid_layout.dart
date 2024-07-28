import 'package:dona/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppGridLayout extends StatefulWidget {
  const AppGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 230,
    this.itemCountRow = 2,
    required this.itemBuilder,
  });
  final int itemCount;
  final int itemCountRow;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  State<AppGridLayout> createState() => _AppGridLayoutState();
}

class _AppGridLayoutState extends State<AppGridLayout> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.itemCount,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        cacheExtent: 10,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.itemCountRow,
          mainAxisSpacing: AppSizes.gridViewSpacing,
          crossAxisSpacing: AppSizes.gridViewSpacing,
          mainAxisExtent: widget.mainAxisExtent,
        ),
        itemBuilder: widget.itemBuilder);
  }
}
