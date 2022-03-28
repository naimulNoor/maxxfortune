import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/general_user/profile/general_user_profile_response.dart';
import 'package:tokenapp/data/models/general_user/profile/profile_update_request.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/edit_profile/edit_profile_controller.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {

  final Data user;

  const EditProfileScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState(user);
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _controller = EditProfileController();
  final Data user;
  var mainWidth;
  var maxLines = 3;
  TextEditingController dateController = TextEditingController();
  File? _image;
  File? _careTakerImage;
  final picker = ImagePicker();

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var addressController = TextEditingController();
  var nricController = TextEditingController();
  var careTakerNameController = TextEditingController();
  var careTakerNumberController = TextEditingController();

  _EditProfileScreenState(this.user);

  @override
  void initState() {

    fullNameController.text=user.name;
    emailController.text=user.email;
    phoneNumberController.text=user.phone;
    addressController.text=user.address;
    nricController.text=user.nric ?? "";
    careTakerNameController.text = user.caretakerName ?? "";
    careTakerNumberController.text=user.caretakerPhone ?? "";
    if(user.dateOfBirth != null)
      dateController.text = speakDate(user.dateOfBirth!);

    super.initState();
  }

  void _getImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _image = tmpFile;
    });
  }

  void _getCareTakerImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _careTakerImage = tmpFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(dp20),
          children: [
            VSpacer20(),
            _captureImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Full Name'),
            VSpacer10(),
            CommonTextField(controller: fullNameController),
            VSpacer40(),
            TextFieldHeadline(
              headline: 'Email Address',
            ),
            VSpacer10(),
            CommonTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
            ),
            VSpacer40(),
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
            TextFieldHeadline(headline: 'NRIC'),
            VSpacer10(),
            CommonTextField(controller: nricController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Date of Birth'),
            VSpacer10(),
            _datePicker(dateController, "Date of Birth", 1),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Image'),
            VSpacer10(),
            _captureCareTakerImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Full Name'),
            VSpacer10(),
            CommonTextField(controller: careTakerNameController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Mobile Number'),
            VSpacer10(),
            CommonTextField(
              controller: careTakerNumberController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            PositiveButton(
              text: "Update Now",
              onClicked: () {
                showLoader();
                var request = UpdateProfileRequest(
                  name: fullNameController.text,
                  address: addressController.text,
                  phone: phoneNumberController.text,
                  nric: nricController.text,
                  dateOfBirth: selectedDate,
                  caretakerPhone: careTakerNumberController.text,
                  caretakerAddress: "N/A",
                  caretakerName: careTakerNameController.text
                );
                update(request);
              },
            ),
            VSpacer40(),
          ],
        ),
      ),
    );
  }

  update(UpdateProfileRequest request) async{
    var response = await _controller.updateUserProfile(_image, _careTakerImage, request);
    Get.back();
    ToastUtil.show(response.msg);
    if(response.data!=null){
      Get.back();
    }
  }

  _datePicker(TextEditingController controller, String hint, int type){
    return TextField(
      readOnly: true,
      onTap: (){
        _selectDate(context);
      },
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.date_range,
          color: accent,
        ),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
            color: light_grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
      ),
      cursorColor: accent,
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (ctx, child){
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: accent),
              // buttonTheme: ButtonThemeData(
              //     textTheme: acce
              // ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = speakDate(selectedDate);
      });
  }

  String formatDate(DateTime date){
    var outputFormat = DateFormat('MM.dd.yyyy');
    return outputFormat.format(date);
  }

  _captureImage() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _image != null
          ? CircleAvatar(
        radius: dp35,
        backgroundImage: Image.file(_image!, fit: BoxFit.cover).image,
      )
          : CircleAvatar(
        radius: dp35,
        backgroundImage: Image.network(getImagePath(user.image ?? ""), fit: BoxFit.cover).image,
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
              'Upload Photo',
              style: TextStyle(color: accent),
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          setState(() {
            _image=null;
          });
        },
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

  _captureCareTakerImage() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _careTakerImage != null
          ? CircleAvatar(
        radius: dp35,
        backgroundImage: Image.file(_careTakerImage!, fit: BoxFit.cover).image,
      )
          : CircleAvatar(
        radius: dp35,
        backgroundImage: Image.network(getImagePath(user.caretakerImage ?? ""), fit: BoxFit.cover).image,
      ),
      TextButton(
        onPressed: () => _getCareTakerImage(),
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
              'Upload Photo',
              style: TextStyle(color: accent),
            ),
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          setState(() {
            _careTakerImage=null;
          });
        },
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
    controller: addressController,
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
