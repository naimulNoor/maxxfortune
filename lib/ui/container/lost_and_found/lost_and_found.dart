import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/base/widget/custom_text_form_field.dart';
import 'package:tokenapp/data/models/MessageResponse.dart';
import 'package:tokenapp/data/models/container/lostandfound/LostAndFoundModel.dart';
import 'package:tokenapp/data/models/container/lostandfound/LostAndFoundResponse.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/lost_and_found/LostAndFoundController.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class LostAndFoundView extends StatefulWidget {
  const LostAndFoundView({Key? key}) : super(key: key);

  @override
  _LostAndFoundViewState createState() => _LostAndFoundViewState();
}

class _LostAndFoundViewState extends State<LostAndFoundView> {


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


   TitleWidget({
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
                GSStrings.lost_and_found_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.lost_and_found_subtitle,
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
  late TextEditingController bookingIdController;
  late TextEditingController vehicleNumberController;
  late TextEditingController timeAndDateController;
  late TextEditingController descriptionController;

  late LostAndFoundController controller;

  @override
  void initState() {
    super.initState();
    controller=new LostAndFoundController();
    bookingIdController = TextEditingController();
    vehicleNumberController = TextEditingController();
    timeAndDateController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    bookingIdController.dispose();
    vehicleNumberController.dispose();
    timeAndDateController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              formController: bookingIdController,
              inputType: TextInputType.numberWithOptions(),
              hint: GSStrings.lost_and_found_booking_id,
              isRequiredField: true,
            ),
            CustomTextFormField(
              formController: vehicleNumberController,
              inputType: TextInputType.numberWithOptions(),
              hint: GSStrings.lost_and_found_vehicle_number,
              isRequiredField: true,
            ),
            CustomTextFormField(
              formController: timeAndDateController,
              inputType: TextInputType.datetime,
              hint: GSStrings.lost_and_found_time_and_date,
              isRequiredField: true,
            ),
            CustomTextFormField(
              formController: descriptionController,
              inputType: TextInputType.text,
              hint: GSStrings.lost_and_found_description,
              isFieldExpanded: true,
              isRequiredField: true,
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
                if(descriptionController.text.isNotEmpty && timeAndDateController.text.isNotEmpty && vehicleNumberController.text.isNotEmpty && bookingIdController.text.isNotEmpty){
                  if(bookingIdController.text.isNumericOnly){
                    _submitTask();
                  }else{
                    showToast("Booking ID must be number");
                  }

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please Filled Required Data"),
                  ));
                }


              },
            ),
            VSpacer40(),
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
                            "Your query is successfully submited",
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

  void _submitTask() {
    LostAndFoundModel model=new LostAndFoundModel(bookingIdController.text,vehicleNumberController.text,timeAndDateController.text,descriptionController.text,);
    controller.lostAndFoundServiceProvider(model).then((value) => {
      if(value is LostAndFoundResponse){
        showSuccessSheet(context)
      }else if(value is MessageResponse){
        showToast(value.msg)
      }
    });
  }

  showToast(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }


}
