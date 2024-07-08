import 'package:flutter/material.dart';

import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../utils/movie_list_type.dart';

class MovieTypeButton extends StatefulWidget {
  final MovieListType selectedType;
  final MovieListType extraType;
  final Function(MovieListType) onPressed;

  const MovieTypeButton({
    super.key,
    required this.selectedType,
    required this.extraType,
    required this.onPressed,
  });

  @override
  State<MovieTypeButton> createState() => _MovieTypeButtonState();
}

class _MovieTypeButtonState extends State<MovieTypeButton> {
  var shouldExpand = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: shouldExpand ? 270 : 150,
          height: AppSpacing.size08,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSpacing.size04),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget.onPressed(widget.extraType);
                  },
                  child: Text(
                    widget.extraType.label,
                    style: AppTypography.invertedtButtonText,
                  ),
                ),
                const SizedBox(width: AppSpacing.size05),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              shouldExpand = !shouldExpand;
            });
          },
          child: Container(
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
                    widget.selectedType.label,
                    style: AppTypography.highlightButtonText,
                  ),
                  const Icon(Icons.arrow_right_outlined, color: AppColors.primary),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
