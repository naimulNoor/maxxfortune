import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/ui/common_widgets/outlined_material_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/vehicle_request_item.dart';
import 'package:tokenapp/ui/section1/update_vehicle/update_vehicle_screen.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'service_provider_vehicle_list_controller.dart';

class VehicleDetailsScreen extends StatefulWidget {

  final Vehicle vehicle;

  const VehicleDetailsScreen({required this.vehicle});

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState(vehicle);
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {

  final Vehicle vehicle;
  ServiceProviderVehicleListController _controller = Get.find();


  _VehicleDetailsScreenState(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: primaryDark,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: dp20, right: dp20, bottom: dp20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              VehicleRequestItem(
                vehicle: vehicle,
                status: getStatus(vehicle.status),
                showButton: false,
              ),
              VSpacer10(),
              Text(
                "Vehicle Info",
                style: GoogleFonts.manrope(
                  color: darkText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              VSpacer10(),
              Card(
                elevation: 0,
                margin: EdgeInsets.only(bottom: dp20),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: greyBorder,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      dp5,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(dp10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: getImagePath(vehicle.image),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Vehicle Capacity"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.capacity),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Driver Name"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.driverName),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Driver Phone"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.driverPhone),
                      VSpacer20(),
                      // TextFieldHeadline(headline: "Request Date"),
                      // VSpacer10(),
                      // TextFieldValueWidget(headline: speakDate(vehicle.createdAt)),
                      // VSpacer20(),
                      // TextFieldHeadline(headline: "Request Pending Duration"),
                      // VSpacer10(),
                      // TextFieldValueWidget(headline: daysBetween(vehicle.createdAt)),
                      // VSpacer20(),
                      TextFieldHeadline(headline: "Driver License Number"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.driverLicenseNumber),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Driver License Issue Date"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: speakDate(vehicle.driverLicenseValidity)),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Attendant Name"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.attendantName),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Attendant Phone"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.attendantPhone),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Attendant NRIC"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: vehicle.attendantNric),
                      VSpacer20(),
                      TextFieldHeadline(headline: "Attendant DOB"),
                      VSpacer10(),
                      TextFieldValueWidget(headline: speakDate(vehicle.attendantDob)),
                      VSpacer40(),
                      OutlinedMaterialButton(
                        color: dark_grey,
                        onClick: () {
                          Get.to(() => UpdateVehicleScreen(vehicle: vehicle,))?.then((value){
                            _controller.getVehicleList();
                          });
                        },
                        text: "Update vehicle details",
                      ),
                      VSpacer20(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getStatus(int status){
    return status==0 ? ChipStatus.PENDING : ChipStatus.APPROVED;
  }

}
