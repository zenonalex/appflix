import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/images/app_images.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../di.dart';
import '../bloc/movie_list_bloc.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_type_button.dart';

@RoutePage()
class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final _movieListBloc = sl<MovieListBloc>();

  @override
  void initState() {
    _movieListBloc.add(const GetMovieListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.main,
            title: SvgPicture.asset(
              AppImages.logo,
              height: 30,
            ),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Image.asset(AppImages.headerBackGround),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: AppSpacing.size04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.size04),
                  child: MovieTypeButton(title: 'Trending', onPressed: () {}),
                ),
                const SizedBox(height: AppSpacing.size04),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(AppImages.listBackGround, fit: BoxFit.fitWidth),
                    BlocConsumer<MovieListBloc, MovieListState>(
                        bloc: _movieListBloc,
                        listener: (context, state) {},
                        builder: (context, state) {
                          return SizedBox(
                            height: 350,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movies.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? AppSpacing.size04 : 0.0,
                                    right: AppSpacing.size04,
                                  ),
                                  child: MovieCard(movie: state.movies[index]),
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
    );
  }
}
