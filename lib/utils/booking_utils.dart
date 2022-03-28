import 'package:flutter/material.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';

import 'colors.dart';

String getType(Booking booking){
  if(booking.isFinished==0){
    if(booking.isPaid==0)
      return "Pending";
    else return "On Going";
  }return "Finished";
}

Color getColor(Booking booking){
  if(booking.isFinished==0){
    if(booking.isPaid==0)
      return GSColors.pending_Color;
    else return GSColors.ongoing_Color;
  }else return finishedChipColor;
}