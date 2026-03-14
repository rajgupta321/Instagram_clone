import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostCarousel extends StatefulWidget {
  final List<String> images;

  const PostCarousel({super.key, required this.images});

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  final controller = PageController();
  bool showHeart = false;

  void onDoubleTap() {
    setState(() {
      showHeart = true;
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          showHeart = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.images.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onDoubleTap: onDoubleTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InteractiveViewer(
                      panEnabled: true,
                      minScale: 1,
                      maxScale: 4,
                      child: CachedNetworkImage(
                        imageUrl: widget.images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (_, __) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                      ),
                    ),

                    AnimatedScale(
                      scale: showHeart ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Icon(Icons.favorite, color: Colors.red, size: 100),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        if (widget.images.length > 1)
          SmoothPageIndicator(
            controller: controller,
            count: widget.images.length,
            effect: const WormEffect(
              dotHeight: 5,
              dotWidth: 5,
              spacing: 4,
              activeDotColor: Colors.black,
              dotColor: Colors.grey,
            ),
          ),
      ],
    );
  }
}
