import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  final int itemCount;
  final double carouselHeight, aspectRatio;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final ExtendedIndexedWidgetBuilder? itemBuilder;
  final Color indicatorBackgroundColor, indicatorActiveColor;
  final CarouselController? carouselController;

  const CustomCarouselSlider({
    Key? key,
    required this.itemBuilder,
    this.carouselController,
    this.itemCount = 1,
    this.aspectRatio = 16 / 9,
    this.carouselHeight = 200.0,
    this.onPageChanged,
    this.indicatorBackgroundColor = Colors.white,
    this.indicatorActiveColor = colorLightGreen1,
  }) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int selectedPageIndex;
  late CarouselController _carouselController;

  @override
  void initState() {
    selectedPageIndex = 0;
    _carouselController = widget.carouselController ?? CarouselController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.itemCount,
          options: CarouselOptions(
            scrollPhysics: BouncingScrollPhysics(),
            height: widget.carouselHeight,
            enableInfiniteScroll: false,
            reverse: false,
            aspectRatio: widget.aspectRatio,
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(
                () {
                  selectedPageIndex = index;
                },
              );

              if (widget.onPageChanged != null) {
                widget.onPageChanged!;
              }
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: widget.itemBuilder,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: AnimatedSmoothIndicator(
            count: widget.itemCount,
            effect: WormEffect(
              dotWidth: 10.0,
              dotHeight: 10.0,
              paintStyle: PaintingStyle.fill,
              dotColor: widget.indicatorBackgroundColor,
              activeDotColor: widget.indicatorActiveColor,
            ), // your pref
            activeIndex: selectedPageIndex, // erred effect
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
          ),
        ),
      ],
    );
  }
}
