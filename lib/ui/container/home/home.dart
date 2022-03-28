import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_app_promotion_widget.dart';
import 'package:tokenapp/base/widget/custom_bus_time_widget.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/our_service/our_service.dart';
import 'package:tokenapp/ui/section1/service_provider_welcome/service_provider_welcome_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int status = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(),
              OfferWidget(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0,
                  top: 64.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recommended Service",
                      style: GSTextStyles.make14xw600Style(
                        color: GSColors.green_secondary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30.0,
                        top: 8.0,
                      ),
                      child: Text(
                        "From essential services to earning opportunities. We're an all-in-one platform.",
                        style: GSTextStyles.make24xw900Style(),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      children: [
                        SessionWidget(
                          index: 0,
                          imagePath: "images/ic_morning.png",
                          title: GSStrings.morning,
                          isSelected: status == 0,
                          onClick: (index){
                            setState(() {
                              status = index;
                            });
                          },
                        ),
                        SizedBox(width: 16.0),
                        SessionWidget(
                          index: 1,
                          imagePath: "images/ic_evening.png",
                          title: GSStrings.evening,
                          isSelected: status == 1,
                          onClick: (index){
                            setState(() {
                              status = index;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: CustomBusTimeWidget(
                  backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                  title: "Off Peak Hour",
                  subtitle: "Before 6.45 AM - After 8.15 AM",
                  moneyOne: "\$12",
                  moneyTwo: "\$15",
                  moneyThree: "\$18",
                  distanceOne: "3 Km (Max)",
                  distanceTwo: "3 km - 8km",
                  distanceThree: "8km +",
                ),
              ),
              CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_two.png",
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(
                  top: 24.0,
                ),
                child: Image.asset(
                  "images/ic_demo_testimonial_one.png",
                  height: 440.0,
                  fit: BoxFit.cover,
                ),
              ),
              //CustomAppPromotionWidget(), //TODO:: roni comment out
            ],
          ),
        ),
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 32.0,
            top: 32.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                GSStrings.home_offer_and_promotion,
                textAlign: TextAlign.start,
                style: GSTextStyles.make18xw700Style(
                  color: GSColors.text_regular,
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(OurServiceView());
                },
                child: Text(
                  GSStrings.show_all,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make14xw400Style(
                    color: GSColors.green_secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 32.0,
            right: 0.0,
            top: 16.0,
          ),
          height: 250.0,
          width: double.maxFinite,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return OfferItemWidget();
            },
            separatorBuilder: (_, __) {
              return SizedBox(
                width: 20.0,
              );
            },
          ),
        ),
      ],
    );
  }
}

class OfferItemWidget extends StatelessWidget {
  const OfferItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 195.0,
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8.0),
        ),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "images/ic_background_offer_item.png",
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 125.0,
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(
              const Radius.circular(6.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Children's Day",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GSTextStyles.make18xw700Style(
                  color: GSColors.text_regular,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/ic_tick_circular.png",
                    fit: BoxFit.contain,
                    width: 20.0,
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "25% Off",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GSTextStyles.make14xw400Style(
                        color: GSColors.text_secondary,
                      ),
                    ),
                  ),
                ],
              ),
              CustomFilledButton(
                fontSize: 14.0,
                borderRadius: 6.0,
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(8.0),
                title: GSStrings.home_more_detail,
                onTap: () {
                  Get.to(OurServiceView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_one.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 48.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.home_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make48xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 32.0,
                ),
                child: Text(
                  GSStrings.home_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
              CustomFilledButton(
                margin: const EdgeInsets.all(0.0),
                borderRadius: 8.0,
                backgroundColor: GSColors.green_normal,
                textColor: Colors.white,
                title: GSStrings.home_book_a_bus,
                onTap: () {
                  Get.to(
                    InfoScreen(),
                  );
                },
              ),
              CustomFilledButton(
                margin: const EdgeInsets.only(top: 24.0),
                borderRadius: 8.0,
                borderColor: Colors.white,
                backgroundColor: GSColors.gray_primary.withOpacity(0.4),
                textColor: Colors.white,
                title: GSStrings.home_be_a_service_provider,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceProviderWelcomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SessionWidget extends StatelessWidget {
  final String title, imagePath;
  final bool isSelected;
  final int index;
  final Function(int index) onClick;

  const SessionWidget({
    Key? key,
    this.imagePath = "images/ic_morning.png",
    this.title = GSStrings.morning,
    required this.isSelected,
    required this.index,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(index);
      },
      child: Container(
        width: 112.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          color: isSelected ? GSColors.green_secondary : GSColors.gray_normal.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              this.imagePath,
              height: 18.0,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white :  GSColors.green_secondary,
            ),
            SizedBox(width: 6.0),
            Text(
              this.title,
              textAlign: TextAlign.start,
              style: GSTextStyles.make15xw600Style(
                color: isSelected ? Colors.white :  GSColors.green_secondary,
                fontFamily: GSFonts.appFont,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
