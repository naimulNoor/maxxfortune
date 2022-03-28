import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/data/models/booking/booking_details_response.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/book_a_bus/invoice_screen.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/my_booking_details_one/my_booking_controller.dart';
import 'package:tokenapp/ui/container/provide_feedback/provide_feedback.dart';
import 'package:tokenapp/ui/container/refund_request/refund_request.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';

import 'invoice_screen_for_booking.dart';

class MyBookingDetailsOneView extends StatefulWidget {

  final Booking booking;

  const MyBookingDetailsOneView({Key? key, required this.booking}) : super(key: key);

  @override
  _MyBookingDetailsOneViewState createState() =>
      _MyBookingDetailsOneViewState(booking);
}

class _MyBookingDetailsOneViewState extends State<MyBookingDetailsOneView> {

  final Booking booking;

  _MyBookingDetailsOneViewState(this.booking);

  final controller = MyBookingController();

  @override
  void initState() {
    controller.getBookingDetails(booking.id);
    controller.getInvoice(booking.id);
    super.initState();
  }

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
          child: Obx((){

            var currentResponse = controller.bookingDetails.value;

            if(currentResponse==null)
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingWidget(),
                ],
              );
            else return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                child: BodyWidget(
                  controller: controller,
                  booking: currentResponse,
                  bookingResponse: booking,
                ),
            );
          }),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {

  final MyBookingController controller;
  final BookingDetailsResponse booking;
  final Booking bookingResponse;

  const BodyWidget({Key? key, required this.booking, required this.bookingResponse, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackButton(),
          ],
        ),
        TitleWidget(),
        BookingItemWidget(controller: controller, booking: booking, bookingResponse: bookingResponse,),
        LocationInfoWidget(booking : booking, bookingResponse: bookingResponse,),
        getType(booking)=="Pending" ?
        Container() : VehicleInfoWidget(response: booking,),
        getType(booking)=="Finished" ? CustomFilledButton(
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
            Get.to(ProvideFeedbackView(booking: booking,));
          },
        ): CustomFilledButton(
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          fontSize: 18.0,
          padding: const EdgeInsets.all(16.0),
          borderRadius: 8.0,
          borderColor: GSColors.gray_secondary.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          textColor: GSColors.gray_secondary,
          title: "Cancel & Refund",
          onTap: () {
            Get.to(
                RefundRequestView(
              bookingDetailsResponse: booking,
            ));
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

  final BookingDetailsResponse booking;
  final Booking bookingResponse;

  const LocationInfoWidget({
    Key? key,
    required this.booking,
    required this.bookingResponse,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              HSpacer20(),
              Text(
                "Pickup Info",
                style: GSTextStyles.make18xw600Style(
                  color: GSColors.text_regular,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0, right: dp20, left: dp20),
                child: DottedLine(
                  dashLength: 8.0,
                  dashColor: GSColors.green_secondary.withOpacity(0.3),
                  direction: Axis.vertical,
                  lineLength: dp230,
                ),
              ),
              HSpacer20(),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSubtitleWidget(
                      title: "Pickup Point",
                      subtitle: "${booking.data?.pickupAddress}",
                      margin: const EdgeInsets.only(
                        bottom: 24.0,
                        top: 24.0,
                      ),
                    ),
                    TitleSubtitleWidget(
                      title: "Postal Code",
                      subtitle: "${booking.data?.bookingInformation?.pickupPostalCode}",
                      margin: const EdgeInsets.only(bottom: 24.0),
                    ),
                    TitleSubtitleWidget(
                      title: "Pickup Remark",
                      subtitle: "${booking.data?.bookingInformation?.pickupRemarks ?? "--"}",
                      margin: const EdgeInsets.only(bottom: 48.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
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
              HSpacer20(),
              Text(
                "Drop-Off Info",
                style: GSTextStyles.make18xw600Style(
                  color: GSColors.text_regular,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: dp60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSubtitleWidget(
                  title: "Drop-Off Point",
                  subtitle: "${booking.data?.dropoffAddress}",
                  margin: const EdgeInsets.only(
                    bottom: 24.0,
                    top: 24.0,
                  ),
                ),
                TitleSubtitleWidget(
                  title: "Postal Code",
                  subtitle: "${booking.data?.bookingInformation?.dropoffPostalCode}",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Drop-Off Remark",
                  subtitle: "${booking.data?.bookingInformation?.dropoffRemarks ?? "--"}",
                  margin: const EdgeInsets.only(bottom: 0.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: dp10,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldHeadline(
                        headline: "Comments",
                      ),
                      VSpacer10(),
                      TextFieldValueWidget(headline: bookingResponse.comment ?? ""),
                    ],
                  ),
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

  final BookingDetailsResponse response;

  const VehicleInfoWidget({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                // Container(
                //   margin: const EdgeInsets.only(bottom: 20.0),
                //   width: double.maxFinite,
                //   child: Image.network(
                //     "${response.data?.existRideInfo?.}",
                //     height: 192.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                TitleSubtitleWidget(
                  title: "Vehicle number",
                  subtitle: "${response.data?.vehicleInfo?.vehicleNumber ?? ""}",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Driver name",
                  subtitle: "${response.data?.vehicleInfo?.driverName ?? ""}",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Driver phone",
                  subtitle: "${response.data?.vehicleInfo?.driverPhone ?? ""}",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Bus Attendant name",
                  subtitle: "${response.data?.vehicleInfo?.attendantName ?? ""}",
                  margin: const EdgeInsets.only(bottom: 24.0),
                ),
                TitleSubtitleWidget(
                  title: "Bus Attendant contact",
                  subtitle: "${response.data?.vehicleInfo?.attendantPhone ?? ""}",
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

  final MyBookingController controller;
  final BookingDetailsResponse booking;
  final Booking bookingResponse;

  const BookingItemWidget({
    Key? key,
    required this.booking,
    required this.bookingResponse,
    required this.controller,
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
            child: BookingItemHeaderWidget(booking: booking,),
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
            child: BookingItemBodyWidget(controller: controller, booking: booking, bookingResponse: bookingResponse,),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {

  final MyBookingController controller;
  final BookingDetailsResponse booking;
  final Booking bookingResponse;

  const BookingItemBodyWidget({
    Key? key, required this.booking,
    required this.bookingResponse,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TitleSubtitleWidget(
        //   title: "Child Name",
        //   subtitle: "Violet Norman",
        // ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Pickup Time",
                subtitle: "${booking.data?.pickupTime.substring(0,5)}",
              ),
            ),
            Expanded(
              flex: 2,
              child: TitleSubtitleWidget(
                title: "Booked Seat",
                subtitle: "${booking.data?.bookedSeat}",
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
                subtitle: speakDate(booking.data!.startDate),
              ),
            ),
            Expanded(
              flex: 2,
              child: TitleSubtitleWidget(
                title: "End Date",
                subtitle: speakDate(booking.data!.endDate),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: (){
            if(controller.invoiceResponse.value!=null)
             Get.to(InvoiceScreenForBooking(invoiceResponse: controller.invoiceResponse.value!,));
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
                  "S\$${booking.data?.price?.toStringAsFixed(2)}",
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

  final BookingDetailsResponse booking;

  const BookingItemHeaderWidget({
    Key? key, required this.booking,
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
                "#${booking.data?.id}",
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
            color: getColor(booking).withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(dp20),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Text(
            getType(booking),
            style: GSTextStyles.make13xw700Style(
              color: getColor(booking),
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
String getType(BookingDetailsResponse booking){
  if(booking.data?.isFinished==0){
    if(booking.data?.isPaid==0)
      return "Pending";
    else return "On Going";
  }return "Finished";
}

Color getColor(BookingDetailsResponse booking){

  if(booking.data?.isFinished==0){
    if(booking.data?.isPaid==0)
      return GSColors.pending_Color;
    else return GSColors.ongoing_Color;
  }else return finishedChipColor;

}

