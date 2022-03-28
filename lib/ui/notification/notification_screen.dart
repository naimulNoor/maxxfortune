import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/child_list_response.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_controller.dart';

class NotificationScreenPage extends StatefulWidget {
  const NotificationScreenPage({Key? key}) : super(key: key);

  @override
  _NotificationScreenPageState createState() => _NotificationScreenPageState();
}

class _NotificationScreenPageState extends State<NotificationScreenPage> {

  final NotificationController notificationController = NotificationController();

  var hp, wp;

  @override
  void initState() {
    notificationController.getAllChildList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;
    wp = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dp20),
        child: Obx((){
          var response = notificationController.allChildListResponse.value;

          if(response!=null){
            if(response.data.isNotEmpty){
              var childList = response.data;

              return Column(
                children: [
                  VSpacer20(),
                  childList.isNotEmpty
                    ? TitleWidget(childListResponse: response,)
                    : Container(),
                  Expanded(
                    child: ListView.builder(
                        itemCount: childList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ChildWidget(
                            key: new UniqueKey(),
                            childData: childList[index],
                            notificationController: notificationController,
                          );
                        }),
                  ),
                ],
              );
            }else return Expanded(
              child: Container(
                child: Center(
                  child: Text("No booking found"),
                ),
              ),
            );
          }else  return Expanded(
            child: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }),
      ),
    );
  }
  
}

class ChildWidget extends StatefulWidget {
  
  final Datum childData;
  final NotificationController notificationController;
  
  const ChildWidget({Key? key, required this.childData, required this.notificationController}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState(childData, notificationController);
}

class _ChildWidgetState extends State<ChildWidget> {

  final Datum data;
  final NotificationController notificationController;

  bool isExpanded = false;

  _ChildWidgetState(this.data, this.notificationController);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: data.isFinished==1 ? gradientDark : light_grey_white,
      padding: EdgeInsets.symmetric(horizontal: dp10, vertical: dp10),
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   "#${data.bookingId}",
                      //   style: TextStyle(
                      //     color:data.isFinished==1 ? white : black,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text(
                        "${data.ride!.destination}",
                        style: TextStyle(
                            color:data.isFinished==1 ? white : grey,
                            fontSize: dp12),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                  Widget yesButton = TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Get.back();
                      if(data.bookingTravelId!=null)
                        notificationController
                          .updateChild(data.bookingTravelId!);
                    },
                  );

                  Widget noButton = TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Get.back();
                    },
                  );


                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are you sure you want to end this ride?"),
                    actions: [
                      yesButton,
                      noButton
                    ],
                  );


                  if(data.isFinished == 0){
                    showDialog(context: context, builder: (context){
                      return alert;
                    });
                  }
                },
                child: CircleAvatar(
                  radius: dp20,
                  backgroundColor:data.isFinished==1 ? primaryDark : greyBorder,
                  child: Icon(
                    Icons.check,
                    color:data.isFinished==1 ? white : black,
                  ),
                ),
              ),
            ],
          ),
          isExpanded ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpacer10(),
              Text(
                "Child List",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  color:data.isFinished==1 ? white : black,
                  fontWeight: FontWeight.bold
                ),
              ),
              for(var child in data.children)
                Text(
                  "${child.name}",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color:data.isFinished==1 ? white : black,
                  ),
                )
            ],
          ) :  Container(),
        ],
      ),
    );
  }
}


class TitleWidget extends StatelessWidget {

  final ChildListResponse childListResponse;

  const TitleWidget({
    Key? key,
    required this.childListResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: dp10,
            vertical: dp10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${childListResponse.data[0].ride?.name ?? ""}",
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start time",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                              color: GSColors.gray_secondary,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "${childListResponse.data[0].ride!.startTime}",
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make16xw400Style(
                            color: GSColors.gray_secondary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "End time",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                            color: GSColors.gray_secondary,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "${childListResponse.data[0].ride!.endTime}",
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make16xw400Style(
                            color: GSColors.gray_secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

