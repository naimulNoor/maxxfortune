import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/data/models/booking/info_request.dart';
import 'package:tokenapp/ui/book_a_bus/address_screen.dart';
import 'package:tokenapp/ui/book_a_bus/booking_controller.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/positive_button.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  final BookingController bookingController = Get.find();

  final logger = Logger();

  double distance = 0.0;

  String timeFormat="AM";

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController selectedTimeController = TextEditingController();



  @override
  void initState() {
    bookingController.getChildList();
    if(bookingController.startDate!=null){
      startDateController.text = speakDate(bookingController.startDate!);
    }
    if(bookingController.endDate!=null){
      endDateController.text=speakDate(bookingController.endDate!);
    }
    if(bookingController.pickedTime!=null){
      selectedTime = bookingController.pickedTime;
      NumberFormat formatter = new NumberFormat("00");
      selectedTimeController.text =  "${formatter.format(selectedTime?.hour)}:${formatter.format(selectedTime?.minute)}";
    }
    super.initState();
  }

  _childWidget(TextEditingController controller, List<String> suggestions){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TextFieldHeadline(headline: "Child Name*"),
        VSpacer20(),
        CommonTextField(
          controller: controller,
          hint: "Child Name",
        ),
        // AutoCompleteTextField(
        //   controller: controller,
        //   hint: "Child Name",
        //   suggestions: suggestions,
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (){
          var currentState = bookingController.childListResponse.value;
          if(currentState==null){
            return LoadingWidget();
          }else{
            List<String> suggestion = currentState.data!=null ? currentState.data!.map((e) => e.name).toList()
            : [];
            return Container(
              padding: EdgeInsets.all(dp20),
              child: ListView(
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldHeadline(headline: "Seat"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                dp5,
                              ),
                            ),
                            border: Border.all(color: light_grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (bookingController.seat > 1) bookingController.seat--;
                                  if (bookingController.childWidgetList.length > 1) {
                                    bookingController.childWidgetList.removeLast();
                                    bookingController.childControllerList.removeLast();
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: accent,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: light_grey,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: dp20),
                              child: Text(
                                bookingController.seat.toString(),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: light_grey,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  bookingController.seat++;
                                  var controller = TextEditingController();
                                  bookingController.childControllerList.add(controller);
                                  bookingController.childWidgetList.add(_childWidget(
                                      bookingController.childControllerList.last, suggestion));
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: accent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: bookingController.childWidgetList,
                  ),
                  VSpacer20(),
                  TextFieldHeadline(headline: "Start Date*"),
                  VSpacer20(),
                  _datePicker(startDateController, "Start date", 1),
                  VSpacer20(),
                  TextFieldHeadline(headline: "End Date*"),
                  VSpacer20(),
                  _datePicker(endDateController, "End Date", 2),
                  VSpacer20(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldHeadline(headline: "Pickup Time*"),
                            VSpacer20(),
                            _timePicker(selectedTimeController),
                          ],
                        ),
                      ),
                      /*HSpacer20(),
                Container(
                  padding: EdgeInsets.only(left: dp10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: grey
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(dp10),
                    ),
                  ),
                  child: DropdownButton<String>(
                    style: GoogleFonts.manrope(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                    ),
                    value: timeFormat,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    underline: Container(),
                    items: <String>['AM', 'PM'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.manrope(
                            color: darkText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        timeFormat=value!;
                      });
                    },
                  ),
                ),*/
                    ],
                  ),
                  VSpacer20(),
                  PositiveButton(
                    text: "Next",
                    onClicked: () {
                      bookingController.newChild.clear();
                      bookingController.existingChild.clear();

                      for (var controller1 in bookingController.childControllerList){
                        if(controller1.text.isNotEmpty){
                          bookingController.newChild.add(controller1.text);
                        }
                      }

                      // for (var controller in childControllerList)
                      // {
                      //   Datum? child = currentState.data!.firstWhere(
                      //           (element) => element.name==controller.text,
                      //       orElse: (){
                      //     return Datum(
                      //       id: -1,
                      //       userId: -1,
                      //       name: controller.text,
                      //       createdAt: DateTime.now(),
                      //       updatedAt: DateTime.now(),
                      //     );
                      //   });
                      //   if(child.id==-1){
                      //     if(child.name.isNotEmpty)
                      //       newChild.add(controller.text);
                      //   }else existingChild.add(child.id);
                      // }

                      if(validate()){

                        var infoRequest = InfoRequest(
                          childNames: bookingController.newChild,
                          childId: bookingController.existingChild,
                          startDate: formatDate(bookingController.startDate!),
                          endDate: formatDate(bookingController.endDate!),
                          pickupTime: "${selectedTimeController.text}:00",
                          dropOffTime: bookingController.dropOffTime ?? "00:00:00",
                        );

                       // print(infoRequest.toJson());

                        Get.to(
                          AddressScreen(
                            infoRequest: infoRequest,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  bool validate(){

    // if(newChild.isEmpty && existingChild.isEmpty){
    //   ToastUtil.show("Please select at least one child");
    //   return false;
    // }

    if(bookingController.newChild.isEmpty){
        ToastUtil.show("Please select at least one child");
        return false;
    }

    print("StartDate ${bookingController.startDate}");
    print("EndDate ${bookingController.endDate}");
    print("time ${bookingController.pickedTime}");

    if(bookingController.startDate == null || bookingController.endDate == null){
        ToastUtil.show("Please select start date");
        return false;
    }

    if(bookingController.pickedTime == null){
      ToastUtil.show("Please select pickup time");
      return false;
    }

    return true;
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context, int type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (ctx, child){
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: accent),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1950),
        lastDate: DateTime(2201)
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        if(type==1) {
          if(calculateDifference(picked)>=0){
            bookingController.startDate = picked;
            bookingController.endDate = picked;
            startDateController.text=speakDate(picked);
            endDateController.text=speakDate(picked);
          }else{
            ToastUtil.show("Start date can not be before ${speakDate(DateTime.now())}");
          }
        } else {
          if(bookingController.startDate!=null) {
            if (calculateDifference(picked, d2: bookingController.startDate) >= 0) {
              bookingController.endDate = picked;
              endDateController.text = speakDate(picked);
            }else{
              ToastUtil.show("End date can not be before ${speakDate(bookingController.startDate!)}");
            }
          }else{
            ToastUtil.show("Select start date first");
          }
        }
        selectedDate = picked;
      });
  }

  int calculateDifference(DateTime date, {DateTime? d2}) {
    late DateTime now;
    if(d2==null)
      now = DateTime.now();
    else now = d2;
    return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  }
  
  DateTime formatDate(DateTime date){
    var outputFormat = DateFormat('yyyy-MM-dd');
    return DateTime.parse(outputFormat.format(date));
  }

  _datePicker(TextEditingController controller, String hint, int type){
    return TextField(
      onTap: (){
        _selectDate(context, type);
      },
      readOnly: true,
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

  _timePicker(TextEditingController controller){

    return TextField(
      onTap: (){
        _selectTime();
      },
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.access_time_outlined,
          color: accent,
        ),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: "Select time",
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

  _selectTime() async{
    selectedTime = await showTimePicker(
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
      initialTime: TimeOfDay.now(),
      context: context,
    );
    bookingController.pickedTime = selectedTime;
    NumberFormat formatter = new NumberFormat("00");
    selectedTimeController.text =  "${formatter.format(selectedTime?.hour)}:${getMinutes(formatter.format(selectedTime?.minute))}";
    bookingController.dropOffTime =  "${formatter.format((selectedTime?.hour)??0+1)}:${getMinutes(formatter.format(selectedTime?.minute))}:01";
  }

  getMinutes(String minutes){
    var hr = int.parse(minutes[0]);
    var mn = int.parse(minutes[1]);

    if(mn==0) return "$hr$mn";
    if(mn>5) return "${hr+1}0";
    else return "${hr}5";
  }

}
