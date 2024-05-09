import 'package:dona/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class AppCurvedWidget extends StatelessWidget {
  const AppCurvedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AppCurvedEdges(), child: child);
  }
}
