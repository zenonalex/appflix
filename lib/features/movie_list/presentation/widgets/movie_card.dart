import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../commons/widgets/vote_indicator.dart';
import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../../../commons/entities/movie.dart';
import '../utils/movies_consts.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({super.key, required this.movie});

  final _formatter = DateFormat('dd MMM y');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(AppSpacing.size)),
                child: CachedNetworkImage(
                  height: 225,
                  imageUrl: movie.posterPath != null
                      ? MoviesConsts.cardImasgeUrl + movie.posterPath!
                      : "https://i.ibb.co/jLKQ1cG/images.png",
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
                      movie.releaseDate != null ? _formatter.format(movie.releaseDate!) : 'Unknown date',
                      style: AppTypography.movieDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 209,
            left: AppSpacing.size03,
            child: VoteIndicator(voteAverage: movie.voteAverage),
          )
        ],
      ),
    );
  }
}
