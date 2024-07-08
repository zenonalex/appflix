import 'package:flutter/material.dart';

import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';

class MovieTypeButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  const MovieTypeButton({super.key, required this.title, required this.onPressed});

  @override
  State<MovieTypeButton> createState() => _MovieTypeButtonState();
}

class _MovieTypeButtonState extends State<MovieTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: AppSpacing.size08,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(AppSpacing.size04),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: AppTypography.highlightButtonText,
            ),
            const Icon(Icons.arrow_right_outlined, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
