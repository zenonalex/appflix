import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts/movies_consts.dart';
import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../domain/entities/person.dart';

class CastCard extends StatelessWidget {
  final Person person;

  const CastCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    const borderRadius = AppSpacing.size02;

    return Container(
      width: 125,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: AppSpacing.size,
            blurRadius: AppSpacing.size,
            offset: const Offset(0, AppSpacing.size),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 150,
              fit: BoxFit.fitWidth,
              imageUrl: person.profilePath != null
                  ? MoviesConsts.cardImasgeUrl + person.profilePath!
                  : MoviesConsts.placeholderImasgeUrl,
              placeholder: (_, __) => Image.asset(AppImages.imagePlaceholder),
            ),
          ),
          const SizedBox(height: AppSpacing.size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.size),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(person.name, style: AppTypography.cardTitleBold),
                Text(person.character, style: AppTypography.cardTitle),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.size),
        ],
      ),
    );
  }
}
