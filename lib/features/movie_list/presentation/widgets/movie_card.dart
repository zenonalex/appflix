import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../domain/entities/movie.dart';
import '../utils/movies_consts.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({super.key, required this.movie});

  final _formatter = DateFormat('dd MMM y');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppSpacing.size)),
            child: CachedNetworkImage(
              height: 225,
              imageUrl: MoviesConsts.cardImasgeUrl + movie.backdropPath,
              placeholder: (_, __) => Image.asset(AppImages.imagePlaceholder),
            ),
          ),
          const SizedBox(height: AppSpacing.size04),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.size02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.originalTitle,
                  style: AppTypography.movieTitle,
                ),
                Text(
                  _formatter.format(movie.releaseDate),
                  style: AppTypography.movieDate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
