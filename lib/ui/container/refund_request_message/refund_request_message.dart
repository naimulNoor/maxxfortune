import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';

class RefundRequestMessageView extends StatefulWidget {
  const RefundRequestMessageView({Key? key}) : super(key: key);

  @override
  _RefundRequestMessageViewState createState() =>
      _RefundRequestMessageViewState();
}

class _RefundRequestMessageViewState extends State<RefundRequestMessageView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image.asset(
                "images/ic_refund_request_background.png",
                fit: BoxFit.cover,
              ),
            ),
            BodyWidget(),
          ],
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(),
          CustomFilledButton(
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 30.0,
              right: 30.0,
            ),
            fontSize: 18.0,
            padding: const EdgeInsets.all(16.0),
            borderRadius: 8.0,
            borderColor: GSColors.green_secondary,
            backgroundColor: Colors.transparent,
            textColor: GSColors.green_secondary,
            title: "My Booking List",
            onTap: () {
              Get.back();
              Get.back();
              Get.back();
            },
          ),
        ],
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
              Image.asset(
                "images/ic_refund_request_message.png",
                width: 76.0,
                height: 82.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Text(
                  "Refund request successfully sent",
                  textAlign: TextAlign.center,
                  style: GSTextStyles.make28xw700Style(
                    color: GSColors.gray_primary,
                  ),
                ),
              ),
              Text(
                "Refund request for payment ID #8907123 has been successfully sent",
                textAlign: TextAlign.center,
                style: GSTextStyles.make16xw400Style(
                  color: GSColors.gray_secondary,
                ),
              ),
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
