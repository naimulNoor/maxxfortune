import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/data/models/booking/booking_details_response.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/refund_request_message/refund_request_message.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';

class RefundRequestView extends StatefulWidget {

  final BookingDetailsResponse bookingDetailsResponse;

  const RefundRequestView({Key? key,
    required this.bookingDetailsResponse}) : super(key: key);

  @override
  _RefundRequestViewState createState() => _RefundRequestViewState(
    bookingDetailsResponse
  );
}

class _RefundRequestViewState extends State<RefundRequestView> {

  final BookingDetailsResponse bookingDetailsResponse;

  _RefundRequestViewState(this.bookingDetailsResponse);

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
            color: primaryDark,
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BodyWidget(bookingDetailsResponse: bookingDetailsResponse,),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {

  final BookingDetailsResponse bookingDetailsResponse;

  const BodyWidget({Key? key, required this.bookingDetailsResponse}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState(
    bookingDetailsResponse
  );
}

class _BodyWidgetState extends State<BodyWidget> {

  var hp;

  final BookingDetailsResponse bookingDetailsResponse;
  late TextEditingController reasonController;

  _BodyWidgetState(this.bookingDetailsResponse);

  @override
  void initState() {
    reasonController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    hp = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(),
        BookingItemWidget(bookingDetailsResponse: bookingDetailsResponse,),
        CustomTextFormField(
          hintText: "Why are you cancelling the ride",
          formController: reasonController,
          inputType: TextInputType.text,
          hint: "Write a Review",
          isFieldExpanded: true,
          isRequiredField: false,
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          expansionHeight: 146.0,
        ),
        CustomFilledButton(
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          fontSize: 18.0,
          padding: const EdgeInsets.all(16.0),
          borderRadius: 8.0,
          borderColor: Colors.transparent,
          backgroundColor: GSColors.green_secondary,
          textColor: Colors.white,
          title: "Submit Request",
          onTap: () {
            _showMessage(600);
          },
        ),
      ],
    );
  }

  _showMessage(double height) {
    showModalBottomSheet(
      backgroundColor: white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dp20),
          topRight: Radius.circular(dp20),
        ),
      ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              height: hp,
              child: RefundRequestMessageView(),
            ),
          ],
        );
      },
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
                GSStrings.refund_request_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.refund_request_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make16xw400Style(
                    color: GSColors.gray_secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingItemWidget extends StatelessWidget {

  final BookingDetailsResponse bookingDetailsResponse;

  const BookingItemWidget({
    Key? key, required this.bookingDetailsResponse,
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
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemHeaderWidget(bookingDetailsResponse: bookingDetailsResponse,),
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
            child: BookingItemBodyWidget(bookingDetailsResponse: bookingDetailsResponse,),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {

  final BookingDetailsResponse bookingDetailsResponse;

  const BookingItemBodyWidget({
    Key? key, required this.bookingDetailsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Pickup Time",
                subtitle: "${bookingDetailsResponse.data?.pickupTime}",
              ),
            ),
            Expanded(
              flex: 3,
              child: TitleSubtitleWidget(
                title: "Booked Seat",
                subtitle: "${bookingDetailsResponse.data?.bookedSeat} Seats",
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
                subtitle: "${speakDate(bookingDetailsResponse.data!.startDate)}",
              ),
            ),
            Expanded(
              flex: 3,
              child: TitleSubtitleWidget(
                title: "End Date",
                subtitle: "${speakDate(bookingDetailsResponse.data!.endDate)}",
              ),
            ),
          ],
        ),
        Container(
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
      ],
    );
  }
}

class BookingItemHeaderWidget extends StatelessWidget {

  final BookingDetailsResponse bookingDetailsResponse;

  const BookingItemHeaderWidget({
    Key? key, required this.bookingDetailsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            "#${bookingDetailsResponse.data?.id}",
            style: GSTextStyles.make20xw700Style(
              color: GSColors.gray_primary,
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
