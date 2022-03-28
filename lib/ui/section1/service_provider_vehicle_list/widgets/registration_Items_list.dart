import 'package:flutter/material.dart';
import 'package:tokenapp/data/models/vehicles/vehicle_list_response.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/vehicle_request_item.dart';

class RegistrationItemsList extends StatefulWidget {

  final List<Vehicle> vehicleList;

  const RegistrationItemsList({required this.vehicleList});

  @override
  _RegistrationItemsListState createState() => _RegistrationItemsListState(vehicleList);
}

class _RegistrationItemsListState extends State<RegistrationItemsList> {

  final List<Vehicle> vehicleList;

  _RegistrationItemsListState(this.vehicleList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: vehicleList.length,
      itemBuilder: (ctx, idx){
        return VehicleRequestItem(
          vehicle: vehicleList[idx],
          status: getStatus(vehicleList[idx].status),
        );
      },
    );
  }

  getStatus(int status){
    return status==0 ? ChipStatus.PENDING : ChipStatus.APPROVED;
  }

}
