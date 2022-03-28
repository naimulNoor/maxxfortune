import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/outlined_material_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:logger/logger.dart';

import 'booking_controller.dart';

class InvoiceScreen extends StatefulWidget {

  final BookingResponse bookingResponse;

  const InvoiceScreen({Key? key, required this.bookingResponse}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  final BookingController controller = Get.find();

  @override
  void initState() {
    Logger().d("in invoice ${widget.bookingResponse.data}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: BackButton(
          color: black_5,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(dp20),
        children: [
          LargeHeadlineWidget(headline: "Invoice"),
          VSpacer40(),
          TextFieldHeadline(headline: "Order ID"),
          VSpacer10(),
          TextFieldValueWidget(headline: '#${widget.bookingResponse.data?.id}'),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Seat"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data?.bookedSeat}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Distance"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data?.distance?.toStringAsFixed(2)}km"),
          VSpacer20(),
          TextFieldHeadline(headline: "Cost per km"),
          VSpacer10(),
          TextFieldValueWidget(headline: 'S\$${controller.pricePerKm}/km'),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Travel Number"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${daysDiff(widget.bookingResponse.data!.startDate, widget.bookingResponse.data!.endDate)+1}"),
          VSpacer20(),
          // TextFieldHeadline(headline: "Child Name"),
          // VSpacer10(),
          // TextFieldValueWidget(headline: 'John Doe WIlliam'),
          // VSpacer20(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldHeadline(headline: "Start Date"),
                  VSpacer10(),
                  TextFieldValueWidget(headline: "${speakDate(widget.bookingResponse.data!.startDate)}"),
                ],
              ),
              HSpacer40(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldHeadline(headline: "Time"),
                  VSpacer10(),
                  TextFieldValueWidget(headline: "${widget.bookingResponse.data!.pickupTime.substring(0,5)}"),
                ],
              )
            ],
          ),
          VSpacer20(),
          TextFieldHeadline(headline: "End Date"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${speakDate(widget.bookingResponse.data!.endDate)}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.pickupAddress}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.bookingInformation!.pickupPostalCode}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.bookingInformation!.pickupRemarks ?? "--"}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.dropoffAddress}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.bookingInformation!.dropoffPostalCode}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.bookingResponse.data!.bookingInformation!.dropoffRemarks ?? "--"}"),
          VSpacer20(),
          Container(
            height: dp2,
            width: double.infinity,
            color: light_grey,
          ),
          VSpacer20(),
          // TextFieldHeadline(headline: "Payment Method"),
          // VSpacer10(),
          // TextFieldValueWidget(headline: 'Visa-Debit Card'),
          // VSpacer20(),
          // TextFieldHeadline(headline: "Card No"),
          // VSpacer10(),
          // TextFieldValueWidget(headline: '****  **** **** **22'),
          // VSpacer20(),
          // Container(
          //   height: dp2,
          //   width: double.infinity,
          //   color: light_grey,
          // ),
          VSpacer20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: TextFieldHeadline(headline: "Total Amount")),
              Flexible(child: TextFieldValueWidget(headline: "S\$${widget.bookingResponse.data?.price?.toStringAsFixed(2)}")),
            ],
          ),
          VSpacer40(),
          OutlinedMaterialButton(
            onClick: (){},
            text: "Save Invoice",
          ),
          VSpacer40(),
          VSpacer40(),
        ],
      ),
    );
  }
}
