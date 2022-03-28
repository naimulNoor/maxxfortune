import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/ui/book_a_bus/invoice_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/provide_feedback/provide_feedback.dart';
import 'package:tokenapp/utils/spacers.dart';

class MyBookingDetailsTwoView extends StatefulWidget {
  const MyBookingDetailsTwoView({Key? key}) : super(key: key);

  @override
  _MyBookingDetailsTwoViewState createState() =>
      _MyBookingDetailsTwoViewState();
}

class _MyBookingDetailsTwoViewState extends State<MyBookingDetailsTwoView> {
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BodyWidget(),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TitleWidget(),
        BookingItemWidget(),
        LocationInfoWidget(),
        VehicleInfoWidget(),
        CustomFilledButton(
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          fontSize: 18.0,
          padding: const EdgeInsets.all(16.0),
          borderRadius: 8.0,
          borderColor: GSColors.green_secondary.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          textColor: GSColors.green_secondary,
          title: "Give Feedback",
          onTap: () {
            // Get.to(ProvideFeedbackView(booking: ,));
          },
        ),
        VSpacer40(),
      ],
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Booking Details",
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 30.0,
        right: 30.0,
        bottom: 10.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GSColors.green_normal.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: GSColors.green_secondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: DottedLine(
                    dashLength: 8.0,
                    dashColor: GSColors.green_secondary.withOpacity(0.3),
                    direction: Axis.vertical,
                    lineLength: 375,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GSColors.green_normal.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: GSColors.green_secondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pickup Info",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.text_regular,
                  ),
                  textAlign: TextAlign.start,
                ),
                TitleSubtitleWidget(
                  title: "Pickup point",
                  subtitle: "Block 372 Bukit Batok Street 31.",
                  margin: const EdgeInsets.only(
                    bottom: 24.0,
                    top: 24.0,
                  ),
                ),
                TitleSubtitleWidget(
                  title: "Postal Code",
                  subtitle: "650372 Singapore",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Pickup Remark",
                  subtitle: "#01-372, 650372 Singapore",
                  margin: const EdgeInsets.only(bottom: 48.0),
                ),
                Text(
                  "Drop-Off Info",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.text_regular,
                  ),
                  textAlign: TextAlign.start,
                ),
                TitleSubtitleWidget(
                  title: "Drop-off point",
                  subtitle: "Block 372 Bukit Batok Street 31.",
                  margin: const EdgeInsets.only(
                    bottom: 24.0,
                    top: 24.0,
                  ),
                ),
                TitleSubtitleWidget(
                  title: "Postal Code",
                  subtitle: "650372 Singapore",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Pickup Remark",
                  subtitle: "#01-372, 650372 Singapore",
                  margin: const EdgeInsets.only(bottom: 0.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleInfoWidget extends StatelessWidget {
  const VehicleInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vehicle Info",
            style: GSTextStyles.make18xw600Style(
              color: GSColors.text_regular,
            ),
            textAlign: TextAlign.start,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            padding: const EdgeInsets.all(20.0),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
              border: const Border.fromBorderSide(
                const BorderSide(
                  color: GSColors.gray_normal,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  width: double.maxFinite,
                  child: Image.asset(
                    "images/ic_demo_vehicle.png",
                    height: 192.0,
                    fit: BoxFit.cover,
                  ),
                ),
                TitleSubtitleWidget(
                  title: "Vehicle number",
                  subtitle: "Toyota GA 121893",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Driver name",
                  subtitle: "Violet Norman",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Driver phone",
                  subtitle: "+0123 456 789",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Bus Attendant name",
                  subtitle: "Doe Jons",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Bus Attendant contact",
                  subtitle: "+8926392136981",
                  margin: const EdgeInsets.all(0.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(6.0),
        ),
        border: const Border.fromBorderSide(
          const BorderSide(
            color: GSColors.gray_normal,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemHeaderWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              height: 2.0,
              color: GSColors.gray_normal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemBodyWidget(),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {
  const BookingItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSubtitleWidget(
          title: "Child Name",
          subtitle: "Violet Norman",
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Pickup Time",
                subtitle: "10:00 pm",
              ),
            ),
            Expanded(
              flex: 3,
              child: TitleSubtitleWidget(
                title: "Booked Seat",
                subtitle: "3 Seats",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Start Date",
                subtitle: "19 May, 2021",
              ),
            ),
            Expanded(
              flex: 3,
              child: TitleSubtitleWidget(
                title: "End Date",
                subtitle: "19 May, 2021",
              ),
            ),
          ],
        ),
        InkWell(
          onTap: (){
            Get.to(
                InvoiceScreen(bookingResponse: BookingResponse(
                    success: false,
                    msg: ""
                ),)
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
              border: const Border.fromBorderSide(
                const BorderSide(
                  color: GSColors.green_secondary,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.gray_secondary,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "\$299.00",
                  style: GSTextStyles.make18xw700Style(
                    color: GSColors.gray_primary,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BookingItemHeaderWidget extends StatelessWidget {
  const BookingItemHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking ID",
              style: GSTextStyles.make14xw400Style(
                fontFamily: GSFonts.appFont,
                color: GSColors.gray_primary,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "#907097",
                style: GSTextStyles.make20xw700Style(
                  color: GSColors.gray_primary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: GSColors.green_secondary.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(12.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Text(
            "Finished",
            style: GSTextStyles.make13xw700Style(
              color: GSColors.green_secondary,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.margin = const EdgeInsets.only(bottom: 16.0),
  }) : super(key: key);

  final String title;
  final String subtitle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              this.title,
              textAlign: TextAlign.start,
              style: GSTextStyles.make14xw400Style(
                color: GSColors.gray_secondary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            this.subtitle,
            textAlign: TextAlign.start,
            style: GSTextStyles.make16xw500Style(
              color: GSColors.text_regular,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
