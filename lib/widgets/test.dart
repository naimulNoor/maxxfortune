import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/app_style.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/constants.dart';
import 'package:tokenapp/data/models/MessageResponse.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsModel.dart';
import 'package:tokenapp/data/models/container/contactus/ContactUsResponse.dart';
import 'package:tokenapp/ui/app/auth/forgetpassword/forgetpass_page.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/contact_us/ContactUsController.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/reges_format.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:tokenapp/widgets/widget_textfrom_field_two.dart';
import 'package:tokenapp/widgets/widget_textstyle.dart';
import 'package:tokenapp/widgets/widget_upload_multiphoto.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateInformationPage extends StatefulWidget {
  const UpdateInformationPage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<UpdateInformationPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phonController;
  late TextEditingController nameController;


  ContactUsController controller=new ContactUsController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.text="";

    passwordController = TextEditingController();
    passwordController.text="";

    confirmPasswordController = TextEditingController();
    confirmPasswordController.text="";

    phonController = TextEditingController();
    phonController.text="";

    nameController = TextEditingController();
    nameController.text="";
  }

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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetUploadMultiPhotos(),
                  WidgetTextFormField(
                    formController: passwordController,
                    hintText: "PASSWORD",
                    margin:EdgeInsets.fromLTRB(30, 27, 30, 16),
                    inputType: TextInputType.text,
                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: passwordController,
                    hintText: "PASSWORD",
                    margin:EdgeInsets.fromLTRB(30, 0, 30, 16),
                    inputType: TextInputType.text,
                    hint: GSStrings.contact_us_full_name,
                  ),
                  WidgetTextFormField(
                    formController: passwordController,
                    hintText: "PASSWORD",
                    margin:EdgeInsets.fromLTRB(30, 0, 30, 16),
                    inputType: TextInputType.text,
                    hint: GSStrings.contact_us_full_name,
                  ),


                  WidgetButton(
                    title:"Update Information",
                    margin:EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (ForgetPassPage()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

