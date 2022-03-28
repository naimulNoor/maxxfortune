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
import 'package:tokenapp/ui/app/auth/registration/registration_page.dart';
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
import 'package:tokenapp/widgets/widget_dynamic_slidebar.dart';
import 'package:tokenapp/widgets/widget_navigation_container.dart';
import 'package:tokenapp/widgets/widget_scratch_cupon_item.dart';
import 'package:tokenapp/widgets/widget_textfrom_field.dart';
import 'package:tokenapp/widgets/widget_textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tokenapp/widgets/widget_topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<HomePage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  ContactUsController controller=new ContactUsController();





  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.text="";
    passwordController = TextEditingController();
    passwordController.text="";

  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: WidgetNavigation(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                  image: AssetImage(AssetConstants.yellowbg)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetTopBar(
                      count: "1.5K",
                      leftIcon:Container(),
                      centerImage:AssetConstants.max_fortune,
                      rightSection:Row()
                  ),
                  SizedBox(height: 23,),
                  WidgetDynamicSlideBar(),
                  _scratchCouponCount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scratchCouponCount() {
    return Container(
      width: MediaQuery.of(context).size.width,

      color: Colors.grey,

      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 30),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return WidgetScratchCuponItem(
              bgImage: "",
              title: "",
              couponPercentise: "",
              heaserImage:"",
              buttonText: '',
            );
          }
      ),
    );
  }
}

