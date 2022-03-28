import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:tokenapp/data/models/booking/address_request.dart';
import 'package:tokenapp/ui/book_a_bus/address_search_page.dart';
import 'package:tokenapp/data/models/booking/info_request.dart';
import 'package:tokenapp/data/models/google_map/geocoding_response.dart';
import 'package:tokenapp/ui/book_a_bus/widgets/outlined_text.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/ui/common_widgets/grey_button.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import 'payment_screen.dart';

class AddressScreen extends StatefulWidget {

  final InfoRequest infoRequest;

  const AddressScreen({Key? key, required this.infoRequest}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState(infoRequest);
}

const kGoogleApiKey = "AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc";

class _AddressScreenState extends State<AddressScreen> {

  String tooltipText = "Please indicate specific instructions for pick-up or drop-off. Here are some examples:\n"
  "HDB:\n"
  "a) in front of the block at lift lobby (lobby number: a, b, or c, shelter)\n"
  "b) bus stop in front of the block\n"
  "c) specific location near block (shelter, rubbish chute, loading bay, etc.)\n"
  "d) between Blk (no.) and Blk (no.) pick up shelter\n\n"
  "2. Condo\n"
  "a) general pick up point behind guardhouse\n"
  "b) at Blk (no.) lobby\n"
  "c) car park lift lobby\n";

  final InfoRequest infoRequest;

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  final BookingController _controller = Get.find();
  final logger = Logger();

  String? pickupPostCodeErrorText;
  String? dropOffPostCodeErrorText;
  final commentsController  = TextEditingController();

  String pickupPostCode = "";
  String dropOffPostCode = "";

  double distance = 0.0;

  final pickUpRemarksFocus = FocusNode();
  final dropOffRemarksFocus = FocusNode();

  _AddressScreenState(this.infoRequest);

  @override
  void initState() {

    // pickupPostCodeController.addListener(
    //   () {
    //     var text = pickupPostCodeController.text;
    //     if(text.length==6){
    //       var postCode = int.parse(pickupPostCodeController.text);
    //       setState(
    //         () {
    //           if(postCode>=600000 && postCode<=689999){
    //             pickupPostCodeErrorText=null;
    //             _controller.getPickupAddressFromPO(postCode.toString());
    //           }else{
    //             pickupPostCodeErrorText = "Invalid Post Code";
    //           }
    //         },
    //       );
    //     }
    //   },
    // );

    // pickupAddressController.addListener(
    //   () {
    //     var text = pickupAddressController.text;
    //     _controller.getPickupAddressFromPO(text);
    //   },
    // );
    //
    // dropOffAddressController.addListener(
    //   () {
    //     var text = pickupAddressController.text;
    //     _controller.getPickupAddressFromPO(text);
    //   },
    // );

    /*dropOffPostCodeController.addListener(() {
      var text =dropOffPostCodeController.text;
      if(text.length==6){
        var postCode = int.parse(dropOffPostCodeController.text);
        setState(() {
          if(postCode>=600000 && postCode<=689999){
            dropOffPostCodeErrorText=null;
            _controller.getDropOffAddressFromPO(postCode.toString());
          }else{
            dropOffPostCodeErrorText = "Invalid Post Code";
          }
        });
      }

    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            VSpacer20(),
            LargeHeadlineWidget(headline: "Book a Bus"),
            VSpacer40(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "01. Info",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02. Address",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "03. Payment",
                        style: GoogleFonts.manrope(
                          color: grey,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: light_grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Pickup Location*"),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Obx((){
                    return OutlinedText(
                      text: _controller.pickupAddress.value,
                      onClick: (){
                        Get.to(AddressSearchPage())?.then((value){
                          if(value!=null){
                            var result = value["result"];
                            var response = value["response"];
                            _controller.pickUpResponse = response;
                            _controller.pickupAddress.value = result.address;
                            _controller.pickupPostalCode.value = result.postal;
                            FocusScope.of(context).requestFocus(pickUpRemarksFocus);
                          }
                        });
                      },
                      //text: pickupAddressController.text,
                    );
                  }),
                ),
                // HSpacer10(),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             dp10
                //         )
                //     ),
                //   ),
                //   height: dp48,
                //   minWidth: dp48,
                //   color: accent,
                //   child: Icon(
                //     Icons.search,
                //     color: white,
                //   ),
                //   onPressed: (){
                //     _controller.getPickupAddressFromPO(pickupAddressController.text);
                //   },
                // )
              ],
            ),
            VSpacer20(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx((){

                  //  pickupPostCodeController.text = _controller.pickupPostalCode.value;

                    return OutlinedText(
                      text: _controller.pickupPostalCode.value,
                    );

                    // return PostCodeField(
                    //   errorText: pickupPostCodeErrorText,
                    //   type: TextInputType.number,
                    //   controller: pickupPostCodeController,
                    //   hint: "Postal Code",
                    // );
                  }),
                ),
                HSpacer20(),
                Spacer(),
                // Obx((){
                //   return Container(
                //     width: 180,
                //     child: TextFieldValueWidget(
                //       headline: _controller.pickupAddress.value,
                //     ),
                //   );
                // })
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(child: TextFieldHeadline(headline: "Pickup Remarks")),
                IconButton(
                  onPressed: () {
                    _controller.pickupRemarksInfo.value = !_controller.pickupRemarksInfo.value;
                  },
                  icon: Icon(
                    Icons.info_outlined,
                    color: accent,
                    size: 18,
                  ),
                ),
              ],
            ),
            Obx((){
              return _controller.pickupRemarksInfo.value ?
              Text(
                tooltipText,
                  style: GoogleFonts.manrope(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
              ) : Container();
            }),
            VSpacer10(),
            CommonTextField(
              focusNode: pickUpRemarksFocus,
              controller: _controller.pickupRemarksController,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: "Drop Off Location*"),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Obx((){
                    return OutlinedText(
                      text: _controller.dropOffAddress.value,
                      onClick: (){
                        Get.to(AddressSearchPage())?.then((value){
                          if(value!=null){
                            var result = value["result"];
                            var response = value["response"];
                            _controller.dropOffResponse = response;
                            _controller.dropOffAddress.value = result.address;
                            _controller.dropOffPostalCode.value = result.postal;
                            FocusScope.of(context).requestFocus(dropOffRemarksFocus);
                          }
                        });
                      },
                      //text: pickupAddressController.text,
                    );
                  }),
                ),
                // HSpacer10(),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             dp10
                //         )
                //     ),
                //   ),
                //   height: dp48,
                //   minWidth: dp48,
                //   color: accent,
                //   child: Icon(
                //     Icons.search,
                //     color: white,
                //   ),
                //   onPressed: (){
                //     _controller.getDropOffAddressFromPO(dropOffAddressController.text);
                //   },
                // ),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Obx((){

                    //dropOffPostCodeController.text = _controller.dropOffPostalCode.value;

                    return OutlinedText(
                      text: _controller.dropOffPostalCode.value,
                    );

                    // return PostCodeField(
                    //   type: TextInputType.number,
                    //   //errorText: dropOffPostCodeErrorText,
                    //   controller: dropOffPostCodeController,
                    //   hint: "Postal Code",
                    // );
                  }),
                ),
                HSpacer20(),
                Spacer(),
                // Obx((){
                //   return Container(
                //     width: 180,
                //     child: TextFieldValueWidget(
                //       headline: _controller.dropOffAddress.value,
                //     ),
                //   );
                // }),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(child: TextFieldHeadline(headline: "Drop Off Remarks")),
                HSpacer5(),
                IconButton(
                  onPressed: () {
                    _controller.dropOffRemarksInfo.value = !_controller.dropOffRemarksInfo.value;
                  },
                  icon: Icon(
                    Icons.info_outlined,
                    color: accent,
                    size: 18,
                  ),
                ),
              ],
            ),
            Obx((){
              return _controller.dropOffRemarksInfo.value ?
              Text(
                tooltipText,
                style: GoogleFonts.manrope(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ) : Container();
            }),
            VSpacer10(),
            CommonTextField(
              focusNode: dropOffRemarksFocus,
              controller: _controller.dropOffRemarksController,
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Write your comments"),
            VSpacer20(),
            TextFormField(
              controller: _controller.commentsController,
              maxLines: 3,
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
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: GreyButton(
                    onClick: (){
                      Get.back();
                    },
                    title: "Back",
                  ),
                ),
                HSpacer10(),
                Expanded(
                  child: PositiveButton(
                    text: "Next",
                    onClicked: () {
                      if(validate()){
                        if(validatePickupPostCode() && validateDropOffPostCode()){
                          double price = calculatePrice();

                          _controller.pricePerKm.value = price;

                          print("Price is $price");

                          var addressRequest = AddressRequest(
                            pickupPostalCode: _controller.pickupPostalCode.value,
                            pickupLocation: _controller.pickupAddress.value,
                            pickupRemarks: _controller.pickupRemarksController.text,
                            dropOffPostalCode: _controller.dropOffPostalCode.value,
                            dropOffLocation: _controller.dropOffAddress.value,
                            dropOffRemarks: _controller.dropOffRemarksController.text,
                            comments: _controller.commentsController.text,
                            distance: distance,
                            price: price*distance,
                            pricePerKm: price
                          );

                          Get.to(
                            PaymentScreen(
                              addressRequest: addressRequest,
                              infoRequest: infoRequest,
                              dropOffResponse: _controller.dropOffResponse,
                              pickupResponse: _controller.pickUpResponse,
                            ),
                          );
                        }
                      }else{
                        ToastUtil.show("Please fill required fields");
                      }
                    },
                  ),
                ),
              ],
            ),
            VSpacer40(),
            VSpacer40(),
          ],
        ),
      ),
    );
  }

  double calculatePrice(){

    var price = 5.00;

    if(_controller.pricingResponse.value!=null){
      var response = _controller.pricingResponse.value;
      if(response!.success && response.data.length>0){
        var time = infoRequest.pickupTime;
        for(var slot in response.data){
          if(isWithinTimeSlot(slot.startTime, slot.endTime, time)){
            price = slot.value.toDouble();
            break;
          }
        }
      }
    }

    return price;
  }

  bool isWithinTimeSlot(String start, String end, String pickup){
    var startTime = stringToTime(start);
    var endTime = stringToTime(end);
    var pickupTime = stringToTime(pickup);

    return (pickupTime.compareTo(startTime)>=1 && pickupTime.compareTo(endTime)<=1);
  }

  TimeOfDay stringToTime(String s){
    return TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
  }

  bool validate(){
    calculateDistance();
    // if(pickupPostCode != pickupPostCodeController.text) {
    //   ToastUtil.show("Post code does not match with pickup address");
    //   return false;
    // }
    //
    // if(dropOffPostCode != dropOffPostCodeController.text){
    //   ToastUtil.show("Post code does not match with drop off address");
    //   return false;
    // }

    return _controller.pickupAddress.isNotEmpty
        && _controller.pickupPostalCode.isNotEmpty
        && _controller.pickupRemarksController.text.isNotEmpty
        && _controller.dropOffRemarksController.text.isNotEmpty
        && _controller.dropOffAddress.isNotEmpty
        && _controller.dropOffPostalCode.isNotEmpty;

    return true;
  }

  validatePickupPostCode(){
    var text = _controller.pickupPostalCode.value;
    var pickupPostCode = int.parse(text);
    if(pickupPostCode>=600000 && pickupPostCode<=689999){
      return true;
    }else{
      ToastUtil.show("Invalid pickup post code");
      return false;
    }
  }

  validateDropOffPostCode(){
    var text = _controller.dropOffPostalCode.value;
    var dropOffPostCode = int.parse(text);
    if(dropOffPostCode>=600000 && dropOffPostCode<=689999){
      return true;
    }else{
      ToastUtil.show("Invalid pickup post code");
      return false;
    }
  }

  getPickupLocation() async{
    Prediction? p = await PlacesAutocomplete.show(
      startText: _controller.pickupAddressController.text,
      context: context,
      offset: 0,
      radius: 10000,
      types: [],
      strictbounds: false,
      apiKey: kGoogleApiKey,
      mode: Mode.fullscreen, // Mode.overlay
      language: "sg",
      components: [Component(Component.country, "sg")],
    );

    logger.d("${p?.toJson()}");
    logger.d("${p?.structuredFormatting?.toJson()}");
    logger.d("${p?.types}");
    logger.d("${p?.terms}");

    GeoCodingResponse response = await _controller.getPostCodeFromAddress(p?.description ?? "");
    if(response.results.isNotEmpty){
      logger.d(response.results.length);
      logger.d(response.results);
      logger.d(response.results[0].formattedAddress);

      var address = response.results[0].formattedAddress;
      var postCode = address.substring(response.results[0].formattedAddress.length-6);
      logger.d("the post code is $postCode");
      pickupPostCode = postCode;
    }

    if(p != null)
      setState(() {
        _controller.pickupAddressController.text=p.description ?? "" ;
      });

  }

  getDropOffLocation() async{
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        offset: 0,
        radius: 10000,
        types: [],
        strictbounds: false,
        apiKey: kGoogleApiKey,
        mode: Mode.fullscreen, // Mode.overlay
        language: "sg",
        region: "west",
        components: [
          Component(Component.country, "sg"),
        ]);

    GeoCodingResponse response = await _controller.getPostCodeFromAddress(p?.description ?? "");
    if(response.results.isNotEmpty){
      logger.d(response.results.length);
      logger.d(response.results);
      logger.d(response.results[0].formattedAddress);

      var address = response.results[0].formattedAddress;
      var postCode = address.substring(response.results[0].formattedAddress.length-6);
      logger.d("the post code is $postCode");
      dropOffPostCode = postCode;
    }


    if(p!=null){
      setState(() {
        _controller.dropOffAddressController.text=p.description ?? "";
      });
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    logger.d(response.errorMessage);
  }

  getPickupAddress() async{
    var response = await _controller.getPickupAddressFromPO(_controller.pickupPostCodeController.text.trim());

    //if(response.status=="OK"){
      setState(() {
        _controller.pickupAddressController.text = response.results[0].formattedAddress;
      });
    //}

  }


  calculateDistance(){
    if(_controller.pickUpResponse.found >= 1 && _controller.dropOffResponse.found >= 1){
      try{
        var pickupLat =
        double.parse(_controller.pickUpResponse.results[0].latitude);
        var pickupLng =
        double.parse(_controller.pickUpResponse.results[0].longitude);

        var dropOffLat =
        double.parse(_controller.dropOffResponse.results[0].latitude);
        var dropOffLng = double.parse(
            _controller.dropOffResponse.results[0].longitude);

        distance = calculateDist(
          pickupLat,
          pickupLng,
          dropOffLat,
          dropOffLng,
        );

        logger.d("distance : $distance");

      }catch(e){
        logger.d(e);
      }
    }
  }

  double calculateDist(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


}

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (this.hour < other.hour) return -1;
    if (this.hour > other.hour) return 1;
    if (this.minute < other.minute) return -1;
    if (this.minute > other.minute) return 1;
    return 0;
  }
}