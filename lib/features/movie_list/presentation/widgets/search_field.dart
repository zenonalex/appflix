import 'package:flutter/material.dart';

import '../../../../core/foundations/colors/app_colors.dart';
import '../../../../core/foundations/spacings/app_spacing.dart';
import '../../../../core/foundations/typography/app_typography.dart';

class SearchField extends StatefulWidget {
  final Function(String) onSearchClick;

  const SearchField({super.key, required this.onSearchClick});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: AppSpacing.size10,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(AppSpacing.size05),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.size, horizontal: AppSpacing.size05),
            child: TextField(
              controller: _textController,
              style: AppTypography.searchText,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                hintText: "Search...",
                isDense: true,
                hintStyle: AppTypography.searchHintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.onSearchClick(_textController.text);
          },
          child: Container(
            width: 100,
            height: AppSpacing.size10,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.shadow, AppColors.primary],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              // color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSpacing.size05),
            ),
            child: const Center(child: Text("Search", style: AppTypography.searchButtonText)),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
