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
  static const searchHintText = TextStyle(
    fontSize: 18,
    color: AppColors.textPlaceholder,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
    height: 1.35,
  );
  static const searchText = TextStyle(
    fontSize: 18,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
    height: 1.35,
  );
  static const searchButtonText = TextStyle(
    fontSize: 14,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const highlightButtonText = TextStyle(
    fontSize: 18,
    color: AppColors.primary,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const invertedtButtonText = TextStyle(
    fontSize: 18,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const voteIndicatorText = TextStyle(
    fontSize: 14,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const headerText = TextStyle(
    fontSize: 30,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
    height: 1,
  );
  static const headerTextBold = TextStyle(
    fontSize: 45,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const title = TextStyle(
    fontSize: 20,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
  );
  static const subtitleBold = TextStyle(
    fontSize: 18,
    color: AppColors.primaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
  static const cardTitle = TextStyle(
    fontSize: 14,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.normal,
  );
  static const cardTitleBold = TextStyle(
    fontSize: 14,
    color: AppColors.secondaryText,
    fontFamily: "PTSans",
    fontWeight: FontWeight.bold,
  );
}