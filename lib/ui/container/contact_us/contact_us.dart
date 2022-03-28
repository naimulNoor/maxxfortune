import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/data/models/MessageResponse.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsResponse.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/contact_us/ContactUsController.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/reges_format.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {

  ContactUsController controller=new ContactUsController();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(),
            Expanded(
              child: FormListWidget(),
            ),
          ],
        ),
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
      height: 275.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_two.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.contact_us_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.contact_us_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormListWidget extends StatefulWidget {
  const FormListWidget({Key? key}) : super(key: key);

  @override
  _FormListWidgetState createState() => _FormListWidgetState();
}

class _FormListWidgetState extends State<FormListWidget> {
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController websiteUrlController;
  late TextEditingController feedbackController;
  late ContactUsController _contactUsController;

  @override
  void initState() {
    super.initState();
    _contactUsController=new ContactUsController();
    fullNameController = TextEditingController();
    fullNameController.text="";
    phoneNumberController = TextEditingController();
    phoneNumberController.text="";
    emailController = TextEditingController();
    emailController.text="";
    addressController = TextEditingController();
    addressController.text="NO Address";
    websiteUrlController = TextEditingController();
    websiteUrlController.text="";
    feedbackController = TextEditingController();
    feedbackController.text="";
  }

  @override
  void dispose() {
    super.dispose();

    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    addressController.dispose();
    websiteUrlController.dispose();
    feedbackController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height+300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 20.0,
              ),
              width: double.maxFinite,
              child: Text(
                GSStrings.contact_us_company_information,
                style: GSTextStyles.make28xw800Style(
                  color: GSColors.text_bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            CustomTextFormField(
              formController: fullNameController,
              inputType: TextInputType.name,
              hint: GSStrings.contact_us_full_name,
            ),
            CustomTextFormField(
              formController: phoneNumberController,
              inputType: TextInputType.number,
              hint: GSStrings.contact_us_phone_number,
            ),
            CustomTextFormField(
              formController: emailController,
              inputType: TextInputType.emailAddress,
              hint: GSStrings.contact_us_email_address,
            ),
            CustomTextFormField(
              formController: addressController,
              inputType: TextInputType.streetAddress,
              hint: GSStrings.contact_us_address,
              isRequiredField: false,
            ),
            CustomTextFormField(
              formController: websiteUrlController,
              inputType: TextInputType.url,
              hint: GSStrings.contact_us_website_url,
              isRequiredField: false,
            ),
            CustomTextFormField(
              formController: feedbackController,
              inputType: TextInputType.text,
              hint: GSStrings.contact_us_your_feedback,
              isFieldExpanded: false,
              isRequiredField:false
            ),
            CustomFilledButton(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 32.0,
                bottom: 16.0,
              ),
              borderRadius: 8.0,
              backgroundColor: GSColors.green_secondary,
              textColor: Colors.white,
              title: GSStrings.submit,
              onTap: () {
                REGEXPFormat regFormet=REGEXPFormat();
                if(websiteUrlController.text.isNotEmpty){
                  if(regFormet.hasWebsiteValidate(websiteUrlController.text)){
                    showToast("Please Filled Validate Website");
                  }
                }
                if(fullNameController.text.isNotEmpty && phoneNumberController.text.isNotEmpty && emailController.text.isNotEmpty){
                  if(regFormet.hasEmailValidate(emailController.text)){
                    submitData();
                  }else{
                    showToast("Please Filled Validate Email");
                  }

                }else{
                  showToast("Please Filled Required Data");
                }

              },
            ),

          ],
        ),
      ),
    );
  }

  void showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return new Container(
            height: 450.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.successfulIcon,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thanks for your query",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              color: GSColors.green_secondary,
                              fontSize: dp25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: dp30),
                      child: Row(
                        children: [
                          Expanded(
                            child: PositiveButton(
                              text: "Ok",
                              onClicked: (){
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  void submitData() {
    String address="";
    if(addressController.text.isNotEmpty){
      address=addressController.text;
    }else{
      address="No Address";
    }
    ContactUsModel contactUsModel=new ContactUsModel(fullNameController.text,phoneNumberController.text,emailController.text,address,websiteUrlController.text,feedbackController.text);
    _contactUsController.ContactUsServiceProvider(contactUsModel).then((value) {
      print(value);
      if(value is ContactUsResponse) {
          showSuccessSheet(context);
        }else if (value is MessageResponse){
          showToast(value.msg);
        }

    });
  }

  showToast(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }



}
