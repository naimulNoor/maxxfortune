import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/service_partner/auth/signup/service_partner_signup_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/common_widgets/common_password_field.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/section1/service_provider_signup/service_provider_signup_controller.dart';
import 'package:tokenapp/ui/section4/successful_bottom_sheet/successful_bottom_sheet.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:image_picker/image_picker.dart';

class ServiceProviderSignupScreen extends StatefulWidget {
  const ServiceProviderSignupScreen({Key? key}) : super(key: key);

  @override
  _ServiceProviderSignupScreenState createState() => _ServiceProviderSignupScreenState();
}

class _ServiceProviderSignupScreenState extends State<ServiceProviderSignupScreen> {
  var mainWidth;
  var maxLines = 3;
  File? _image;

  final _controller = ServiceProviderSignupController();

  final picker = ImagePicker();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController companyAddressController = TextEditingController();
  final TextEditingController contactPersonNameController = TextEditingController();
  final TextEditingController contactPersonPositionController = TextEditingController();
  final TextEditingController contactPersonPhoneController = TextEditingController();
  final TextEditingController contactPersonNRICController = TextEditingController();
  final TextEditingController businessIdNumController = TextEditingController();

  void _getImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _image = tmpFile;
    });
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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(dp20),
          children: [
            LargeHeadlineWidget(headline: 'Want to be a\nService Provider'),
            VSpacer40(),
            TextFieldHeadline(headline: 'Company Logo'),
            VSpacer20(),
            _captureImage(),
            VSpacer40(),
            _individualOwner(),
            VSpacer20(),
            TextFieldHeadline(headline: 'Company Name'),
            VSpacer10(),
            CommonTextField(controller: companyNameController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Office Number'),
            VSpacer10(),
            CommonTextField(
              controller: phoneNumberController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Email Address'),
            VSpacer10(),
            CommonTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Password'),
            VSpacer10(),
            CommonPasswordField(controller: passwordController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Confirm Password'),
            VSpacer10(),
            CommonPasswordField(controller: confirmPasswordController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Company Address'),
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
            TextFieldHeadline(headline: 'Contact Person Phone',),
            VSpacer10(),
            CommonTextField(
              controller: contactPersonPhoneController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person NRIC'),
            VSpacer10(),
            CommonTextField(
              controller: contactPersonNRICController,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Business Identification Number'),
            TextFieldHeadline(headline: '(NRIC for individual owner)'),
            VSpacer10(),
            CommonTextField(
              controller: businessIdNumController,
            ),
            VSpacer20(),
            _agreeToTerms(),
            VSpacer40(),
            PositiveButton(
              text: "Submit",
              onClicked: () {
                showLoader();
                if(validate())
                {
                  var request = ServicePartnerSignupRequest(
                    name: companyNameController.text.trim(),
                    email: emailController.text.trim(),
                    phone: phoneNumberController.text.trim(),
                    password: passwordController.text,
                    address: companyAddressController.text.trim(),
                    businessIdentificationNumber: businessIdNumController.text.trim(),
                    contactPersonName: contactPersonNameController.text.trim(),
                    contactPersonPosition: contactPersonPositionController.text.trim(),
                    contactPersonPhone: contactPersonPhoneController.text.trim(),
                    contactPersonNric: contactPersonNRICController.text.trim(),
                  );
                  signup(request);
                }else{
                  Get.back();
                  ToastUtil.show("Please fill all fields");
                }
              },
            ),
            VSpacer40(),
          ],
        ),
      ),
    );
  }

  bool validate(){
    if(passwordController.text == confirmPasswordController.text &&
        _image!=null){
      if(!isTermsAccepted){
        ToastUtil.show("Please Accept terms and conditions");
        return false;
      }
      return true;
    }
    return false;
  }

  void signup(ServicePartnerSignupRequest request) async {
    var response = await _controller.serviceProviderSignup(request, _image!);
    if (response.success) {
      Get.back();
      modalBottomSheetMenuSuccess(context, companyNameController.text);
    } else {
      ToastUtil.show(response.msg);
      Get.back();
    }
  }

  _captureImage() => Row(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: dp35,
                  backgroundImage: Image.file(_image!, fit: BoxFit.cover).image,
                )
              : CircleAvatar(
                  radius: dp35,
                  backgroundColor: grey,
                ),
          SizedBox(width: dp15),
          TextButton(
            onPressed: () => _getImage(),
            child: Container(
              height: dp40,
              width: dp120,
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
        ],
      );

  _getAddress() => TextFormField(
        controller: companyAddressController,
        maxLines: maxLines,
        style: TextStyle(
          color: darkText,
          fontSize: dp18,
          fontWeight: FontWeight.bold,
        ),
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

  bool isTermsAccepted = false;
  _agreeToTerms() => Row(
    children: [
      Checkbox(
          fillColor: MaterialStateProperty.all(accent),
          value: isTermsAccepted,
          onChanged: (bool? value) {
            setState(() {
              isTermsAccepted = value!;
            });
          }),
      Text(
        'I agree to terms & conditions',
        style: TextStyle(fontSize: dp15, color: grey),
      ),
    ],
  );

  bool isIndividualOwner = false;
  _individualOwner() => Row(
    children: [
      Checkbox(
          fillColor: MaterialStateProperty.all(accent),
          value: isTermsAccepted,
          onChanged: (bool? value) {
            setState(() {
              isTermsAccepted = value!;
            });
          }),
      Text(
        'I am an individual owner',
        style: TextStyle(fontSize: dp15, color: grey),
      ),
    ],
  );


}
