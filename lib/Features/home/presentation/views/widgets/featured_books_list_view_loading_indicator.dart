import 'package:bookly_app_clean_arch/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_app_clean_arch/core/widgets/custom_fading_animation.dart';
import 'package:flutter/material.dart';

class featuredBooksListViewLoadingIndicator extends StatelessWidget {
  const featuredBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
