class LostAndFoundModel {
  late String bookingId;
  late String VehicleNumber;
  late String description;
  late String dateTime;

  LostAndFoundModel( this.bookingId, this.VehicleNumber, this.dateTime, this.description,);


  Map<String, dynamic> toJson() => {
    "booking_id": int.parse(bookingId),
    "vehicle_number": VehicleNumber,
    "date_time": dateTime,
    "description": description,
  };
}