import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../commons/widgets/custom_app_bar.dart';
import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';
import '../../../../core/navigation/router.gr.dart';
import '../../../../di.dart';
import '../../utils/movie_list_type.dart';
import '../bloc/movie_list_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_type_button.dart';
import '../widgets/search_field.dart';

@RoutePage()
class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _movieListBloc = sl<MovieListBloc>();
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  @override
  void initState() {
    _movieListBloc.add(const GetMovieListEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        _movieListBloc.add(GetMovieListEvent(type: _movieListBloc.state.movieListType));
      }
    });
    super.initState();
  }

  MovieListType _resolveExtraType(MovieListType selectedType) {
    return selectedType == MovieListType.popular ? MovieListType.topRated : MovieListType.popular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Image.asset(AppImages.headerBackGround),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.size04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.size06),
                        const Text("Welcome.", style: AppTypography.headerTextBold),
                        const Text(
                          "Millions of movies, TV show and people to discover. Explore now.",
                          style: AppTypography.headerText,
                        ),
                        const SizedBox(height: AppSpacing.size04),
                        SearchField(
                          controller: _textController,
                          onSearchClick: (term) {
                            _movieListBloc.add(GetMovieListEvent(type: MovieListType.search, term: term));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: AppSpacing.size04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.size04),
                    child: BlocBuilder<MovieListBloc, MovieListState>(
                        bloc: _movieListBloc,
                        builder: (context, state) {
                          return MovieTypeButton(
                            selectedType: state.movieListType,
                            extraType: _resolveExtraType(state.movieListType),
                            onPressed: (type) {
                              _movieListBloc.add(GetMovieListEvent(type: type));
                            },
                            onResetSearch: () {
                              _movieListBloc.add(ResetSearchListEvent());
                              _textController.clear();
                            },
                          );
                        }),
                  ),
                  const SizedBox(height: AppSpacing.size04),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SvgPicture.asset(AppImages.listBackGround, fit: BoxFit.fitWidth),
                      BlocBuilder<MovieListBloc, MovieListState>(
                          bloc: _movieListBloc,
                          builder: (context, state) {
                            if (state.status == MovieListStatus.empty) {
                              return const Text(
                                "🎬 Ops! Não encontramos nenhum filme. 🍿",
                                style: AppTypography.collectionTitle,
                              );
                            }

                            return SizedBox(
                              height: 350,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                itemCount: state.movies.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: index == 0 ? AppSpacing.size04 : 0.0,
                                      right: AppSpacing.size04,
                                    ),
                                    child: MovieCard(
                                      movie: state.movies[index],
                                      onPressed: () {
                                        AutoRouter.of(context).push(
                                          MovieDetailsRoute(
                                            movieId: state.movies[index].id,
                                            posterPath: state.movies[index].posterPath,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }
}
