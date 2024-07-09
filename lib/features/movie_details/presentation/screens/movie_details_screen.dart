import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../commons/widgets/custom_app_bar.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(hasBackButton: true),
        ],
      ),
    );
  }
}
