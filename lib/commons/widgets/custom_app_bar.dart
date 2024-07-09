import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/foundations/colors/app_colors.dart';
import '../../core/foundations/images/app_images.dart';

class CustomAppBar extends StatefulWidget {
  final bool hasBackButton;

  const CustomAppBar({
    super.key,
    this.hasBackButton = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: widget.hasBackButton
          ? GestureDetector(
              onTap: () {
                AutoRouter.of(context).popForced();
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.background),
            )
          : null,
      backgroundColor: AppColors.main,
      title: SvgPicture.asset(
        AppImages.logo,
        height: 30,
      ),
      floating: true,
    );
  }
}
