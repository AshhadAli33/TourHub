import 'package:flutter/material.dart';

/// Caps [child]'s width on large screens (tablet/desktop/web) so content
/// doesn't stretch edge-to-edge, while staying full-width and unchanged on
/// normal phone screens where the available width is already below [maxWidth].
class ResponsiveCenter extends StatelessWidget {
  final double maxWidth;
  final AlignmentGeometry alignment;
  final Widget child;

  const ResponsiveCenter({
    super.key,
    this.maxWidth = 480,
    this.alignment = Alignment.topCenter,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
