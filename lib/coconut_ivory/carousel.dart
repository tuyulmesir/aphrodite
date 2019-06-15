import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// An image carousel, which takes a list of imageUrl.
class Carousel extends StatelessWidget {
  final List<String> images;

  const Carousel({
    Key key,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(imageUrl: images[index], fit: BoxFit.cover);
      },
      itemCount: images.length,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          size: 10.0,
          space: 8.0,
          color: Colors.grey,
          activeColor: Colors.white,
        ),
      ),
    );
  }
}
