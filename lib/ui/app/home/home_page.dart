import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

import '../../ninja/dialog_scratch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<HomePage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;




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
        bottomNavigationBar: WidgetNavigation("home",0),
        body:SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
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
                  SizedBox(height: 40,),
                  WidgetTopBar(
                      count: "1.5K",
                      leftIcon:Container(),
                      centerImage:AssetConstants.max_fortune,
                      rightSection:Row()
                  ),
                  SizedBox(height: 23,),
                  WidgetDynamicSlideBar(128.0),
                  _scratchCouponCount()
                ],
              ),
            ),
          ),
      ),
    );
  }

  Widget _scratchCouponCount() {
    return Container(
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              ),
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             WidgetScratchCuponItem(
              bgImage: "",
              title: "",
              couponPercentise: "",
              heaserImage:"",
              buttonText: '',
             ),
             WidgetScratchCuponItem(
            bgImage: "",
            title: "",
            couponPercentise: "",
            heaserImage:"",
            buttonText: '',
          )
            ],
          ),
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),

                image:DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    image: AssetImage("images/free_shipping_banner.png")
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              ),
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              ),
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              )
            ],
          ),
          SizedBox(height: 15,),
          WidgetDynamicSlideBar(150.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              ),
              WidgetScratchCuponItem(
                bgImage: "",
                title: "",
                couponPercentise: "",
                heaserImage:"",
                buttonText: '',
              )
            ],
          ),
        ],
      )
    );
  }

}

