import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/widgets/custom_app_bar.dart';
import '../../../../commons/widgets/vote_indicator.dart';
import '../../../../core/consts/movies_consts.dart';
import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../../../di.dart';
import '../bloc/movie_details_bloc.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _movieDetailsBloc = sl<MovieDetailsBloc>();

  @override
  void initState() {
    _movieDetailsBloc.add(GetMovieDetailsEvent(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          bloc: _movieDetailsBloc,
          builder: (context, state) {
            if (state.status == MovieDetailsStatus.loading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.background));
            }

            return CustomScrollView(
              slivers: [
                const CustomAppBar(hasBackButton: true),
                SliverToBoxAdapter(
                  child: Container(
                    height: AppSpacing.size10,
                    color: AppColors.background,
                    child: const Center(child: Text("Details", style: AppTypography.collectionTitle)),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.center,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.35, 1.5],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          height: 180,
                          imageUrl: state.movie?.backdropPath != null
                              ? MoviesConsts.cardImasgeUrl + state.movie!.backdropPath!
                              : MoviesConsts.placeholderImasgeUrl,
                        ),
                      ),
                      Positioned(
                        left: AppSpacing.size04,
                        top: 15,
                        child: CachedNetworkImage(
                          height: 150,
                          imageUrl: state.movie!.posterPath != null
                              ? MoviesConsts.cardImasgeUrl + state.movie!.posterPath!
                              : MoviesConsts.placeholderImasgeUrl,
                          placeholder: (_, __) => Image.asset(AppImages.imagePlaceholder),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.size04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.size04),
                        Center(child: Text(state.movie!.originalTitle, style: AppTypography.title)),
                        const SizedBox(height: AppSpacing.size04),
                        Row(
                          children: [
                            VoteIndicator(voteAverage: state.movie!.voteAverage),
                            const SizedBox(width: AppSpacing.size04),
                            const Text("User score", style: AppTypography.subtitleBold),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.size04),
                        const Text("Overview", style: AppTypography.title),
                        Text(state.movie!.overview, style: AppTypography.subtitle),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
