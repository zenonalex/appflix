import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

mixin AppTypography {
  static const collectionTitle = TextStyle(
    fontSize: 20,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const movieTitle = TextStyle(
    fontSize: 14,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const movieDate = TextStyle(
    fontSize: 14,
    color: AppColors.textPlaceholder,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
  );
  static const highlightButtonText = TextStyle(
    fontSize: 18,
    color: AppColors.primary,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
}