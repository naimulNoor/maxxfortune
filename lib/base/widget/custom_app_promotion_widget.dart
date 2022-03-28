import 'package:flutter/material.dart';
import 'package:tokenapp/data/models/container/AboutUsModel.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:launch_review/launch_review.dart';


class CustomAppPromotionWidget extends StatelessWidget {
  String title="";
  late AboutUsModel data;


  CustomAppPromotionWidget({required this.data}){
    this.title = GSStrings.app_promotion_title;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 64.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: GSTextStyles.make20xw700Style(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: InkWell(
                onTap: (){
                  LaunchReview.launch(androidAppId:data.data.first.playStoreLink, iOSAppId: data.data.first.appStoreLink);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(

                      child: Image.asset(
                        "images/ic_download_ios_app.png",
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    InkWell(
                      child: Image.asset(
                        "images/ic_download_android_app.png",
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
