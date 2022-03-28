import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/utils/constants.dart';

import '../constants.dart';

class WidgetDynamicSlideBar extends StatefulWidget {


 WidgetDynamicSlideBar();

  @override
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetDynamicSlideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 128.0,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),

        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetConstants.banner)
                    )

                  ),

              );
            },
          );
        }).toList(),
      )

    );
  }
}
