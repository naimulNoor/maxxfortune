import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/booking/booking_response.dart';
import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/book_a_bus/invoice_screen.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/navigation_container/navigation_container.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QRScreen extends StatefulWidget {

 final BookingResponse bookingResponse;

 QRScreen({Key? key, required this.bookingResponse}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState(bookingResponse);
}

class _QRScreenState extends State<QRScreen> {

  final BookingResponse bookingResponse;

  final BookingController bookingController = Get.find();

  ScreenshotController screenshotController = ScreenshotController();

  String dummy = "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";

  _QRScreenState(this.bookingResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){

        var response = bookingController.payNowResponse.value;
        if(response != null){
          var image = response.data?.attributes.instructions.qrCodeDisplayImage;
          return Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Please scan the QR and make payment",
                ),
                VSpacer20(),
                Screenshot(
                  controller: screenshotController,
                  child: Image.memory(
                    base64Decode(dummy),
                    height: dp220,
                    width: dp220,
                  ),
                ),
                InkWell(
                  onTap: (){
                    saveImage();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(dp10),
                    child: Text(
                      "Download",
                      style: GoogleFonts.manrope(
                        fontSize: dp18
                      ),
                    ),
                  ),
                ),
                VSpacer20(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
                        child: PositiveButton(
                          text: "My Booking List",
                          onClicked: () {
                            Get.back();
                            Get.back();
                            Get.back();
                            Get.to(NavigationContainer(showBookingScreen: true,));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                VSpacer20(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(dp10),
                                  ),
                                )),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                  color: accent,
                                  width: 1,
                                )
                            ),
                          ),
                          onPressed: (){
                            Get.to(InvoiceScreen(bookingResponse: widget.bookingResponse));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(dp10),
                            child: Text(
                              "View Invoice",
                              style: GoogleFonts.manrope(
                                color: accent,
                                fontSize: dp20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
            ),
          );
        }
        else return Container();
      })
    );
  }

  saveImage() async{
    screenshotController.capture(
      pixelRatio: 5.0,
    ).then((image) async{
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        await ImageGallerySaver.saveFile(imagePath.path);
        ToastUtil.show("Downloaded Image");
      }
    });
  }

}
