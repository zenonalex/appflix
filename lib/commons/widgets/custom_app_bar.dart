import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/foundations/colors/app_colors.dart';
import '../../core/foundations/images/app_images.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.main,
      title: SvgPicture.asset(
        AppImages.logo,
        height: 30,
      ),
      floating: true,
    );
  }
}
