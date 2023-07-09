import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../providers/now_playing_movies_notifier.dart';
import 'movie_card_widget.dart';

class NowPlayingMovieCarouselWidget extends HookConsumerWidget {
  const NowPlayingMovieCarouselWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovie = ref.watch(nowPlayingMoviesProvider);
    return nowPlayingMovie.when(
      data: (movies) {
        return CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) {
            return MovieCardWidget(movie: movies[index]);
          },
          options: CarouselOptions(
            height: 290.h,
            initialPage: 0,
            viewportFraction: 0.45,
            autoPlay: true,
            enableInfiniteScroll: true,
            // enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
      error: (error, stackTrace) => Container(child: Assets.svg.notFound.svg()),
      loading: () => Center(child: Assets.animations.loading.lottie()),
    );
  }
}
