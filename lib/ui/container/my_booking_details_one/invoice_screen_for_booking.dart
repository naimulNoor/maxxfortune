import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/data/models/booking/invoice_response.dart';
import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/outlined_material_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:logger/logger.dart';

class InvoiceScreenForBooking extends StatefulWidget {

  final InvoiceResponse invoiceResponse;

  const InvoiceScreenForBooking({Key? key, required this.invoiceResponse}) : super(key: key);

  @override
  _InvoiceScreenForBookingState createState() => _InvoiceScreenForBookingState();
}

class _InvoiceScreenForBookingState extends State<InvoiceScreenForBooking> {

  final BookingController controller = Get.find();

  @override
  void initState() {
    Logger().d("in invoice ${widget.invoiceResponse.data}");
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
          TextFieldValueWidget(headline: '#${widget.invoiceResponse.data?.id}'),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Seat"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.bookedSeat}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Distance"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.distance?.toStringAsFixed(2)}km"),
          VSpacer20(),
          TextFieldHeadline(headline: "Cost per km"),
          VSpacer10(),
          TextFieldValueWidget(headline: 'S\$${controller.pricePerKm}/km'),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Travel Number"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${daysDiff(widget.invoiceResponse.data!.startDate, widget.invoiceResponse.data!.endDate)+1}"),
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
                  TextFieldValueWidget(headline: "${speakDate(widget.invoiceResponse.data!.startDate)}"),
                ],
              ),
              HSpacer40(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldHeadline(headline: "Time"),
                  VSpacer10(),
                  TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.pickupTime.substring(0,5)}"),
                ],
              )
            ],
          ),
          VSpacer20(),
          TextFieldHeadline(headline: "End Date"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${speakDate(widget.invoiceResponse.data!.endDate)}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.pickupAddress}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.bookingInformation!.pickupPostalCode}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.bookingInformation!.pickupRemarks ?? "--"}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.dropoffAddress}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.bookingInformation!.dropoffPostalCode}"),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: "${widget.invoiceResponse.data?.bookingInformation!.dropoffRemarks ?? "--"}"),
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
              Flexible(child: TextFieldValueWidget(headline: "S\$${widget.invoiceResponse.data?.price?.toStringAsFixed(2)}")),
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
