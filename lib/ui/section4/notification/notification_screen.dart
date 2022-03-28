import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/section4/widgets/notification_item.dart';
import 'package:tokenapp/utils/spacers.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          VSpacer40(),
          Sec4NotificationItem(
            type: 1,
            condition: 1,
            datetime: "March 28,2019   10:00PM",
            msg:
                "Booking ID: #907097 Refund text of the printing and typesetting.",
          ),
          Sec4NotificationItem(
            type: 2,
            condition: 2,
            datetime: "March 27,2019   01:00AM",
            msg: "Top up \$200 to your wallet from bank A",
          ),
          Sec4NotificationItem(
            type: 3,
            condition: 3,
            datetime: "March 25,2019   March 25,2019",
            msg: "Transfer \$721 to Alex Hartman",
          ),
          Sec4NotificationItem(
            type: 3,
            condition: 1,
            datetime: "March 20,2019   10:00PM",
            msg: "Transfer \$700 to Alex Hartman",
          ),
          Sec4NotificationItem(
            type: 3,
            condition: 1,
            datetime: "March 10,2019   10:00PM",
            msg: "Transfer \$200 to Alex Hartman",
          ),
          Sec4NotificationItem(
            type: 3,
            condition: 1,
            datetime: "March 10,2019   10:00PM",
            msg: "Transfer \$200 to Alex Hartman",
          ),
          VSpacer40(),
        ],
      ),
    );
  }
}
