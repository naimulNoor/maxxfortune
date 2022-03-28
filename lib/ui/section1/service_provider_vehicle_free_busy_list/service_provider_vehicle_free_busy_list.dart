import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_free_busy_list/service_provider_vehicle_free_busy_list_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_free_busy_list/widgets/vehicle_free_busy_item.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';


class ServiceProviderVehicleFreeBusyList extends StatefulWidget {
  const ServiceProviderVehicleFreeBusyList();

  @override
  _ServiceProviderVehicleFreeBusyListState createState() => _ServiceProviderVehicleFreeBusyListState();
}

class _ServiceProviderVehicleFreeBusyListState extends State<ServiceProviderVehicleFreeBusyList> {

  final _controller = ServiceProviderVehicleFreeBusyListController();

  @override
  void initState() {
    super.initState();
    _controller.getVehicleList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Padding(
                padding: EdgeInsets.all(dp20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeHeadlineWidget(
                      headline: "Vehicle free/busy list",
                    ),
                    VSpacer10(),
                    SizedBox(
                      width: constraints.maxWidth * 0.6,
                      child: TextFieldHeadline(
                        headline: "It’s time to rock n role!"
                            " Let’s get started now.",
                      ),
                    ),
                    VSpacer40(),
                    Expanded(
                      child: Obx((){
                        var response = _controller.vehicleListResponse.value;

                        if(response==null){
                          return LoadingWidget();
                        }else{
                          if(response.data==null){
                            return ErrorScreen();
                          }
                          else{
                            var allVehiclesList = response.data!.vehicles;
                            var busyList = response.data!.vehicles.where((element) => element.availableStatus=="Busy").toList();
                            var freeList = response.data!.vehicles.where((element) => element.availableStatus=="Free").toList();
                            return Column(
                              children: [
                                Container(
                                  child: TabBar(
                                    indicatorColor: accent,
                                    labelColor: accent,
                                    unselectedLabelColor: grey,
                                    tabs: [
                                      Tab(
                                        text: "All",
                                      ),
                                      Tab(
                                        text: "Free",
                                      ),
                                      Tab(
                                        text: "Busy",
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: greyBorder,
                                  height: 2,
                                ),
                                VSpacer20(),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                        itemCount: allVehiclesList.length,
                                        itemBuilder: (ctx, idx) {
                                          return VehicleFreeBusyItem(
                                            vehicle: allVehiclesList[idx],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: freeList.length,
                                        itemBuilder: (ctx, idx) {
                                          return VehicleFreeBusyItem(
                                            vehicle: freeList[idx],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: busyList.length,
                                        itemBuilder: (ctx, idx) {
                                          return VehicleFreeBusyItem(
                                            vehicle: busyList[idx],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      }),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
