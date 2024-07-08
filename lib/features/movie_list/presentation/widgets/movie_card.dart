import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          height: 225,
          imageUrl: "https://media.themoviedb.org/t/p/w440_and_h660_face/7rda0SRuIGA8BDC8FTYHAOyXaRj.jpg",
          placeholder: (_, __) => Image.asset(AppImages.imagePlaceholder),
        ),
        const SizedBox(height: AppSpacing.size06),
        const Text(
          "NOme do filmaasda sdas dadsas as asd asd asd as",
          style: AppTypography.movieTitle,
        ),
        const Text(
          "05 Jul 2024",
          style: AppTypography.movieDate,
        ),
      ],
    );
  }
}
