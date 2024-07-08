import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/foundations/colors/app_colors.dart';
import '../../core/foundations/spacings/app_spacing.dart';
import '../../core/foundations/typography/app_typography.dart';

class VoteIndicator extends StatelessWidget {
  final double voteAverage;

  const VoteIndicator({
    super.key,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = voteAverage * 10;

    return Container(
      width: AppSpacing.size08,
      height: AppSpacing.size08,
      decoration: const BoxDecoration(
        color: AppColors.main,
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        painter: _VoteIndicatorPainter(
          percentage: percentage,
          lineWidth: AppSpacing.size,
        ),
        child: Center(
            child: Text(
          voteAverage.toStringAsFixed(1),
          style: AppTypography.voteIndicatorText,
        )),
      ),
    );
  }
}

class _VoteIndicatorPainter extends CustomPainter {
  final double percentage;
  final double lineWidth;

  _VoteIndicatorPainter({
    required this.percentage,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = percentage == 0.0 ? AppColors.main : Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    final foregroundPaint = Paint()
      ..color = percentage >= 70
          ? AppColors.higRate
          : percentage >= 50
              ? AppColors.mediumRate
              : AppColors.lowRate
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(rect, startAngle, sweepAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
