import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/ui/common_widgets/large_headline_widget.dart';
import 'package:tokenapp/ui/common_widgets/text_field_headline.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/service_provider_vehicle_list_controller.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/registration_Items_list.dart';
import 'package:tokenapp/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';

class ServiceProviderVehicleList extends StatefulWidget {
  const ServiceProviderVehicleList();

  @override
  _ServiceProviderVehicleListState createState() =>
      _ServiceProviderVehicleListState();
}

class _ServiceProviderVehicleListState extends State<ServiceProviderVehicleList> {

  ServiceProviderVehicleListController _controller = Get.find();


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
                      headline: "My vehicles list",
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
                            var pendingList = response.data!.vehicles.where((element) => element.status==0).toList();
                            var approvedList = response.data!.vehicles.where((element) => element.status==1).toList();
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
                                        text: "Pending",
                                      ),
                                      Tab(
                                        text: "Approved",
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
                                      RegistrationItemsList(
                                        vehicleList: allVehiclesList,
                                      ),
                                      RegistrationItemsList(
                                        vehicleList: pendingList,
                                      ),
                                      RegistrationItemsList(
                                        vehicleList: approvedList,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        }

                      }),
                    ),
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
