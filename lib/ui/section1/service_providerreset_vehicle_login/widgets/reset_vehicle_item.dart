import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/ui/common_widgets/outlined_material_button.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/vehicle_info_widget.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service_provider_reset_vehicle_login_screen.dart';

class ResetVehicleItem extends StatelessWidget {

  final Vehicle vehicle;
  final bool showButton;

  const ResetVehicleItem(
      {Key? key, this.showButton = true, required this.vehicle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(dp15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicle number",
                      style: GoogleFonts.manrope(
                        color: darkText,
                      ),
                    ),
                    Text(
                      "${vehicle.vehicleNumber}",
                      style: GoogleFonts.manrope(
                        color: darkText,
                        fontSize: dp20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                StatusChip(chipStatus: getStatus(vehicle.availableStatus))
              ],
            ),
          ),
          Divider(
            color: greyBorder,
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.all(dp15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VehicleInfoWidget(
                            title: "Driver Name",
                            value: vehicle.driverName,
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Attendant name",
                            value: vehicle.attendantName,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                HSpacer60(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VehicleInfoWidget(
                            title: "Registration date",
                            value: speakDate(vehicle.createdAt),
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Registered since",
                            value: daysBetween(vehicle.createdAt),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          showButton
              ? Padding(
                  padding: const EdgeInsets.all(dp20),
                  child: OutlinedMaterialButton(
                    onClick: () {
                      Get.to(ResetVehicleLoginScreen(id: vehicle.id,));
                    },
                    text: "Reset Login",
                  ),
                )
              : Container(
                  height: dp10,
                ),
        ],
      ),
    );
  }

  getStatus(String status){
    return status=="Free" ? ChipStatus.FREE : ChipStatus.BUSY;
  }

}
