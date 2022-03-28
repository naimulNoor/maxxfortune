import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';

class GSRequestIdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Booking ID ", textAlign: TextAlign.start),
                  SizedBox(
                    height: 10,
                  ),
                  Text("#907097",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text("Pending",
                    style: TextStyle(color: GSColors.pending_Color)),
                decoration: BoxDecoration(
                    color: GSColors.pending_Color.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ],
          ),
          Divider()
        ]),
      ),
      decoration: BoxDecoration(
          //border: Border.all(),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
    );
  }
}
