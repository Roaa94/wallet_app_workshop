import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  const DashedBorderContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1,
    this.dash = 10,
    this.gap = 10,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double dash;
  final double gap;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: DashedBorderPainter(
          dashColor: borderColor ?? Theme.of(context).dividerColor,
          borderRadius: borderRadius ?? BorderRadius.zero,
          dash: dash,
          gap: gap,
          borderWidth: borderWidth,
        ),
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double dash;
  final double gap;
  final Color dashColor;
  final BorderRadius borderRadius;
  final double borderWidth;

  DashedBorderPainter({
    this.dash = 5.0,
    this.gap = 3.0,
    this.dashColor = Colors.black,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = dashColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    _drawDashedPath(
      canvas,
      paint,
      RRect.fromLTRBAndCorners(
        0,
        0,
        size.width,
        size.height,
        bottomLeft: borderRadius.bottomLeft,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomRight: borderRadius.bottomRight,
      ),
    );
  }

  void _drawDashedPath(Canvas canvas, Paint paint, RRect rrect) {
    final Path path = Path()..addRRect(rrect);
    final double dashLength = dash + gap;

    for (PathMetric metric in path.computeMetrics()) {
      final double totalLength = metric.length;

      for (double distance = 0;
          distance < totalLength;
          distance += dashLength) {
        final double start = distance;
        final double end = min(distance + dash, totalLength);
        final Path extractPath = metric.extractPath(start, end);
        canvas.drawPath(extractPath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
