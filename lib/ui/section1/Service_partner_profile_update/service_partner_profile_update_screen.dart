import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:tokenapp/data/models/service_partner/profile/service_partner_profile_update_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/section1/Service_partner_profile_update/service_partner_profile_update_controller.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:image_picker/image_picker.dart';

class ServicePartnerProfileUpdateScreen extends StatefulWidget {
  
  final ServicePartnerProfileResponse profileResponse;
  
  const ServicePartnerProfileUpdateScreen({Key? key, required this.profileResponse}) : super(key: key);

  @override
  _ServicePartnerProfileUpdateScreenState createState() => _ServicePartnerProfileUpdateScreenState(profileResponse);
}

class _ServicePartnerProfileUpdateScreenState extends State<ServicePartnerProfileUpdateScreen> {
  var mainWidth;
  var maxLines = 3;

  final ServicePartnerProfileResponse profileResponse;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyAddressController = TextEditingController();
  final TextEditingController contactPersonNameController = TextEditingController();
  final TextEditingController contactPersonPositionController = TextEditingController();
  final TextEditingController contactPersonPhoneController = TextEditingController();
  final TextEditingController contactPersonNRICController = TextEditingController();
  final TextEditingController businessIdNumController = TextEditingController();

  File? _image;

  final picker = ImagePicker();

  final _controller = ServicePartnerProfileUpdateController();

  _ServicePartnerProfileUpdateScreenState(this.profileResponse);

  void _getImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _image = tmpFile;
    });
  }

  @override
  initState(){
    super.initState();

    nameController.text = profileResponse.data!.name;
    emailController.text = profileResponse.data!.email;
    companyAddressController.text = profileResponse.data!.address;
    phoneNumberController.text = profileResponse.data!.phone;
    contactPersonNameController.text = profileResponse.data!.contactPersonName;
    contactPersonPositionController.text = profileResponse.data!.contactPersonPosition;
    contactPersonNRICController.text = profileResponse.data!.contactPersonNric;
    businessIdNumController.text = profileResponse.data!.businessIdentificationNumber;
    contactPersonPhoneController.text = profileResponse.data!.contactPersonPhone;

  }

  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: primaryDark,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(dp20),
          children: [
            _captureImage(profileResponse.data!.image),
            VSpacer40(),
            TextFieldHeadline(headline: 'Company Name'),
            VSpacer10(),
            CommonTextField(controller: nameController),
            VSpacer40(),
            // TextFieldHeadline(headline: 'Email Address'),
            // VSpacer10(),
            // CommonTextField(controller: emailController),
            // VSpacer40(),
            TextFieldHeadline(headline: 'Phone Number'),
            VSpacer10(),
            CommonTextField(
              controller: phoneNumberController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Address'),
            VSpacer10(),
            _getAddress(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Name'),
            VSpacer10(),
            CommonTextField(controller: contactPersonNameController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Position'),
            VSpacer10(),
            CommonTextField(controller: contactPersonPositionController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Phone'),
            VSpacer10(),
            CommonTextField(
              controller: contactPersonPhoneController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'NRIC'),
            VSpacer10(),
            CommonTextField(
              controller: contactPersonNRICController,
              type: TextInputType.text,
            ),
            VSpacer40(),
            TextFieldHeadline(
              headline: 'Business Identification Number',
            ),
            VSpacer10(),
            CommonTextField(
              controller: businessIdNumController,
              type: TextInputType.text,
            ),
            VSpacer40(),
            PositiveButton(text: "Update Now", onClicked: () {

              showLoader();

              var request = ServicePartnerProfileUpdateRequest(
                name: nameController.text,
                email: emailController.text,
                phone: phoneNumberController.text,
                address: companyAddressController.text,
                businessIdentificationNumber: businessIdNumController.text,
                contactPersonName: contactPersonNameController.text,
                contactPersonPosition: contactPersonPositionController.text,
                contactPersonPhone: contactPersonPhoneController.text,
                contactPersonNric: contactPersonNRICController.text,
              );

              updateProfile(request);

            }),
          ],
        ),
      ),
    );
  }

  updateProfile(ServicePartnerProfileUpdateRequest request) async{
    var response = await _controller.updateProfile(request, _image);

    Get.back();
    if(response.data!=null){
      Get.back();
    }
    ToastUtil.show(response.msg);
  }

  _captureImage(String imageUrl) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _image != null
              ? CircleAvatar(
                  radius: dp35,
                  backgroundImage: Image.file(_image!, fit: BoxFit.cover).image,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(dp100),
                  ),
                  child: CachedNetworkImage(
                    height: dp70,
                    width: dp70,
                    imageUrl: getImagePath(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
          TextButton(
            onPressed: () => _getImage(),
            child: Container(
              height: dp40,
              width: dp100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: accent,
                ),
              ),
              child: Center(
                child: Text(
                  'Upload Logo',
                  style: TextStyle(color: accent),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: dp40,
              width: dp80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: grey,
                ),
              ),
              child: Center(
                child: Text(
                  'Remove',
                  style: TextStyle(color: grey),
                ),
              ),
            ),
          ),
        ],
      );

  _getAddress() => TextFormField(
        controller: companyAddressController,
        style: TextStyle(
          color: black,
          fontSize: dp18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(dp10),
            borderSide: BorderSide(color: grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(dp10),
            borderSide: BorderSide(color: accent),
          ),
        ),
        cursorColor: grey,
      );
}
