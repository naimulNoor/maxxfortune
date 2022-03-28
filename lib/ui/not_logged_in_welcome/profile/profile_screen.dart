import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/ui/common_widgets/outlined_material_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/profile/profile_screen_controller.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final _controller = ProfileScreenController();
  
  @override
  void initState() {
    _controller.getGeneralUserProfile();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx((){
      
      var response = _controller.profileState.value;
      if(response==null){
        return LoadingWidget();
      }else {
        if (response.data == null) {
          return ErrorScreen();
        }else {

          var user = response.data;

          if(user!=null){
            return ListView(
              padding: EdgeInsets.all(dp20),
              children: [
                VSpacer20(),
                VSpacer20(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: dp30,
                      backgroundImage: NetworkImage(
                        getImagePath(user.image ?? ""),
                      ),
                    ),
                    HSpacer20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: GoogleFonts.manrope(
                            color: darkText,
                            fontWeight: FontWeight.bold,
                            fontSize: dp16,
                          ),
                        ),
                        Text(
                          user.email,
                          style: GoogleFonts.manrope(),
                        ),
                      ],
                    ),
                  ],
                ),
                VSpacer40(),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: light_grey,
                ),
                VSpacer40(),
                TextFieldHeadline(headline: "Phone Number"),
                VSpacer10(),
                TextFieldValueWidget(headline: user.phone),
                VSpacer20(),
                TextFieldHeadline(headline: "Address"),
                VSpacer10(),
                TextFieldValueWidget(headline: user.address),
                VSpacer20(),
                TextFieldHeadline(headline: "NRIC"),
                VSpacer10(),
                TextFieldValueWidget(headline: user.nric ?? 'N/A'),
                VSpacer20(),
                TextFieldHeadline(headline: "Date of Birth"),
                VSpacer10(),
                TextFieldValueWidget(headline: user.dateOfBirth != null ? speakDate(user.dateOfBirth!) : "N/A"),
                VSpacer20(),
                TextFieldHeadline(headline: "Caretaker Info"),
                VSpacer10(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: dp30,
                      backgroundImage: NetworkImage(
                        getImagePath(user.caretakerImage ?? ""),
                      ),
                    ),
                    HSpacer20(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.caretakerName ?? "",
                          style: GoogleFonts.manrope(
                            color: darkText,
                            fontWeight: FontWeight.bold,
                            fontSize: dp16,
                          ),
                        ),
                        Text(
                          user.caretakerPhone ?? "N/A",
                          style: GoogleFonts.manrope(),
                        ),
                      ],
                    ),
                  ],
                ),
                VSpacer20(),
                OutlinedMaterialButton(onClick: (){
                  Get.to(EditProfileScreen(user: user,))?.then((value){
                    _controller.getGeneralUserProfile();
                  });
                }, text: "Update My Profile"),
              ],
            );
          }else{
            return ErrorScreen();
          }
        }
      }
    });
  }
}
