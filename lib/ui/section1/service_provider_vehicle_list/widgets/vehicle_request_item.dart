import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

import '../vehicle_details_screen.dart';


class VehicleRequestItem extends StatefulWidget {

  final Vehicle vehicle;
  final ChipStatus status;
  final bool showButton;

  const VehicleRequestItem({required this.status, this.showButton = true, required this.vehicle});

  @override
  _VehicleRequestItemState createState() => _VehicleRequestItemState(vehicle);
}

class _VehicleRequestItemState extends State<VehicleRequestItem> {

  final Vehicle vehicle;

  _VehicleRequestItemState(this.vehicle);

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
                      "Request ID",
                      style: GoogleFonts.manrope(
                        color: darkText,
                      ),
                    ),
                    Text(
                      "#${vehicle.id}",
                      style: GoogleFonts.manrope(
                        color: darkText,
                        fontSize: dp20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                StatusChip(chipStatus: widget.status)
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VehicleInfoWidget(
                            title: "Vehicle number",
                            value: "${vehicle.vehicleNumber}",
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Driver name",
                            value: vehicle.driverName,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          VehicleInfoWidget(
                            title: "Request date",
                            value: /*"19 May, 2021"*/speakDate(vehicle.createdAt)
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Registered since",
                            value: daysBetween(vehicle.createdAt).toString(), //todo
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          widget.showButton ? Padding(
            padding: const EdgeInsets.all(dp20),
            child: OutlinedMaterialButton(
              onClick: () {
                Get.to(VehicleDetailsScreen(vehicle: vehicle,));
              },
              text: "Vehicle Details",
            ),
          ) : Container(
            height: dp10,
          ),
        ],
      ),
    );
  }
}
