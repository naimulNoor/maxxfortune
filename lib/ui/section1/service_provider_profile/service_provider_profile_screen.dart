import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:tokenapp/ui/common_widgets/profile_picture_widget.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/ui/common_widgets/update_button.dart';
import 'package:tokenapp/ui/section1/Service_partner_profile_update/service_partner_profile_update_screen.dart';
import 'package:tokenapp/ui/section1/service_provider_profile/service_provider_profile_controller.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';

class ServiceProviderProfileScreen extends StatefulWidget {
  const ServiceProviderProfileScreen({Key? key}) : super(key: key);

  @override
  _ServiceProviderProfileScreenState createState() =>
      _ServiceProviderProfileScreenState();
}

class _ServiceProviderProfileScreenState
    extends State<ServiceProviderProfileScreen> {

  final ServiceProviderProfileController _controller = Get.find();

  @override
  void initState() {
    _controller.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var response = _controller.profileResponse.value;

      if(response==null){
        return LoadingWidget();
      }else{
        if(response.data==null) {
          return ErrorScreen();
        }
        else {

          var data = response.data;

          return Scaffold(
            body: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(dp20),
                children: [
                  _getLeading(data),
                  VSpacer40(),
                  Divider(),
                  VSpacer40(),
                  TextFieldHeadline(headline: 'Phone Number'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.phone ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Address'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.address ?? "",),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person Name'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonName ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person Position'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonPosition ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person Phone'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonPhone ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'NRIC'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonNric ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Business Identification Number'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.businessIdentificationNumber ?? ""),
                  VSpacer40(),
                  UpdateButton(text: 'Update My Profile', onClicked: () {
                    Get.to(ServicePartnerProfileUpdateScreen(
                      profileResponse: _controller.profileResponse.value!,
                    ))?.then((value){
                      _controller.getProfile();
                    });
                  }),
                  VSpacer60(),
                ],
              ),
            ),
          );
        }
      }

    });
  }

  _getLeading(Data? data){
    return Row(
      children: [
        ProfilePictureWidget(imgUrl: getImagePath(data?.image ?? "")),
        SizedBox(width: dp15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldValueWidget(headline: data?.name ?? ""),
            VSpacer5(),
            TextFieldHeadline(headline: data?.email ?? ""),
          ],
        ),
      ],
    );
  }
}
