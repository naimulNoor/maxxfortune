import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/common_widgets/text_field_value_widget.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_free_busy_list/widgets/vehicle_free_busy_item.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:tokenapp/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleFreeBusyDetails extends StatefulWidget {

  final Vehicle vehicle;

  const VehicleFreeBusyDetails({Key? key, required this.vehicle}) : super(key: key);

  @override
  _VehicleFreeBusyDetailsState createState() => _VehicleFreeBusyDetailsState(vehicle);
}

class _VehicleFreeBusyDetailsState extends State<VehicleFreeBusyDetails> {

  final Vehicle vehicle;

  _VehicleFreeBusyDetailsState(this.vehicle);

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
            VehicleFreeBusyItem(
              vehicle: vehicle,
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
                    // TextFieldHeadline(headline: "Vehicle Capacity"),
                    // VSpacer10(),
                    // TextFieldValueWidget(headline: "${vehicle.capacity} Person"),
                    // VSpacer20(),
                    TextFieldHeadline(headline: "Driver Name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.driverName),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver Phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.driverPhone),
                    VSpacer20(),
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
                    vehicle.availableStatus=="Busy" ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VSpacer20(),
                        TextFieldHeadline(headline: "Ride Start Sate"),
                        VSpacer10(),
                        TextFieldValueWidget(headline:vehicle.firstRunningRideInfo?.startDate != null ? speakDate(vehicle.firstRunningRideInfo!.startDate) : "--"),
                        VSpacer20(),
                        TextFieldHeadline(headline: "Pickup Location"),
                        VSpacer10(),
                        TextFieldValueWidget(headline: "${vehicle.firstRunningRideInfo?.source}"),
                        VSpacer20(),
                        TextFieldHeadline(headline: "Drop-Off Location"),
                        VSpacer10(),
                        TextFieldValueWidget(headline: "${vehicle.firstRunningRideInfo?.destination}"),
                      ],
                    ) : Container(),
                    // VSpacer20(),
                    // TextFieldHeadline(headline: "Request Date"),
                    // VSpacer10(),
                    // TextFieldValueWidget(headline: speakDate(vehicle.createdAt)),
                    // VSpacer20(),
                    // TextFieldHeadline(headline: "Request Pending Duration"),
                    // VSpacer10(),
                    // TextFieldValueWidget(headline: daysBetween(vehicle.createdAt)),
                    VSpacer40()

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
