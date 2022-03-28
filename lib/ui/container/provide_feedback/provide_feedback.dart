import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/data/models/booking/booking_details_response.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/data/models/booking/rating_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/provide_feedback/feedback_controller.dart';
import 'package:tokenapp/ui/provide_feedback_message.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';

class ProvideFeedbackView extends StatefulWidget {

  final BookingDetailsResponse booking;

  const ProvideFeedbackView({Key? key, required this.booking}) : super(key: key);

  @override
  _ProvideFeedbackViewState createState() => _ProvideFeedbackViewState(booking);
}

class _ProvideFeedbackViewState extends State<ProvideFeedbackView> {

  final BookingDetailsResponse booking;

  _ProvideFeedbackViewState(this.booking);

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
            child: BodyWidget(booking: booking,),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {

  final BookingDetailsResponse booking;

  const BodyWidget({Key? key, required this.booking}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState(booking);
}

class _BodyWidgetState extends State<BodyWidget> {
  late TextEditingController reasonController;

  final _controller = FeedbackController();
  final BookingDetailsResponse booking;

  double _rating = 0.0;
  var hp;

  _BodyWidgetState(this.booking);

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: RatingBar.builder(
              initialRating: 5,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: GSColors.green_normal,
              ),
              unratedColor: GSColors.gray_normal,
              onRatingUpdate: (double rating) {
                _rating = rating;
                print(rating);
              },
            ),
          ),
        ),
        CustomTextFormField(
          hintText: "Write Review",
          formController: reasonController,
          inputType: TextInputType.text,
          hint: "Your experience with us",
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
            top: 20.0,
            left: 30.0,
            right: 30.0,
          ),
          fontSize: 18.0,
          padding: const EdgeInsets.all(16.0),
          borderRadius: 8.0,
          borderColor: Colors.transparent,
          backgroundColor: GSColors.green_secondary,
          textColor: Colors.white,
          title: "Submit Feedback",
          onTap: () {
            showLoader();
            var request = RatingRequest(
                id: booking.data?.id ?? -1,
                rating: _rating,
                verbatim: "rating",
            );
            rateBooking(request, hp);
          },
        ),
      ],
    );
  }

  rateBooking(RatingRequest request, height) async{
    var response = await _controller.rateBooking(request);
    Get.back();
    if(response.success){
      _showMessage(height);
    }else{
      ToastUtil.show(response.msg);
    }
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
              height: height,
              child: ProvideFeedbackMessageView(),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Rate Your Experience",
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 16.0),
              //   child: Text(
              //     "Refund request for payment ID #8907123 has been successfully sent",
              //     textAlign: TextAlign.center,
              //     style: GSTextStyles.make16xw400Style(
              //       color: GSColors.gray_secondary,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
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
