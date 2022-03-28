import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/base/widget/custom_app_promotion_widget.dart';
import 'package:tokenapp/base/widget/custom_bus_time_widget.dart';
import 'package:tokenapp/data/models/container/AboutUsModel.dart';
import 'package:tokenapp/data/models/service/ServiceModel.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/about_us/AboutUsController.dart';
import 'package:tokenapp/utils/app_theme.dart';

import 'OurServiceController.dart';

class OurServiceView extends StatefulWidget {
  const OurServiceView({Key? key}) : super(key: key);

  @override
  _OurServiceViewState createState() => _OurServiceViewState();
}

class _OurServiceViewState extends State<OurServiceView> {



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(),
            Expanded(
              child: BodyWidget(),
            ),
          ],
        ),
      ),
    );
  }


}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_two.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.our_service_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.our_service_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  int status = 0;
  OurServiceController controller =new OurServiceController();
  AboutUsController aboutUsController =new AboutUsController();
  CoreTheme coreTheme=new CoreTheme();
  bool flag=true;
  List<ServiceData> morningData = List<ServiceData>.empty(growable: true);
  List<ServiceData> eveningData = List<ServiceData>.empty(growable: true);


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          getService(),
          getAboutUsData(),
        ]),
        builder: (context, snapshot) {
          print(snapshot.data);
          if(snapshot.hasData){
            if(snapshot.data![0] is ServiceModel){
              if(flag){
                filterData(snapshot.data![0] as ServiceModel);
              }
              return Container(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          SessionWidget(
                            index: 0,
                            imagePath: "images/ic_morning.png",
                            title: GSStrings.morning,
                            isSelected: status == 0,
                            onClick: (index){
                              setState(() {
                                status = index;
                              });
                            },
                          ),
                          SizedBox(width: 16.0),
                          SessionWidget(
                            index: 1,
                            imagePath: "images/ic_evening.png",
                            title: GSStrings.evening,
                            isSelected: status == 1,
                            onClick: (index){
                              setState(() {
                                status = index;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height:  MediaQuery.of(context).size.height+400,
                        width: MediaQuery.of(context).size.width,

                        child: Column(
                          children: [
                           Expanded(
                               child: status==0?getFilterMorningServiceList(snapshot.data![0] as ServiceModel,status):getFilterEveningServiceList(snapshot.data![0] as ServiceModel,status)),
                               CustomAppPromotionWidget(data:snapshot.data![1])
                          ],
                        )


                    ),

                    /*CustomBusTimeWidget(
                    backgroundImagePath: "images/ic_demo_bus_hour_two.png",
                  ),*/
                    //CustomAppPromotionWidget(data: new AboutUsModel(data: data),), //TODO:: roni comment out
                  ],
                ),
              );
            }

          }
          return coreTheme.appProgressIndicator(context);


        }
      ),
    );
  }




  apiCalling() async {
    var responses = await Future.wait([
     getService()
    ]);
    var response1 = responses.first;
    var response2 =  responses[1];
  }



  Future<ServiceModel> getService() async{

    var response = await controller.FaqServiceProvider();
    print("response${response.data}");
    return response;
  }
  Future<AboutUsModel> getAboutUsData() async{

    var response = await aboutUsController.AboutUsServiceProvider();
    print("response${response.data}");
    return response;
  }


  Widget getFilterMorningServiceList(ServiceModel snapshot, int status) {
    if(morningData.isEmpty){
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 500,
                  width: 200,
                  child: Center(child: Text("No Service Today"))),
            ],
          ));
    } else{
      return  ListView.builder(
          itemCount:morningData.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                title: morningData[i].title,
                subtitle: morningData[i].subTitle,
                moneyOne: morningData[i].pricingOne.value.toString(),
                moneyTwo:morningData[i].pricingTwo.value.toString(),
                moneyThree: morningData[i].pricingThree.value.toString(),
                distanceOne: morningData[i].pricingOneDistance,
                distanceTwo: morningData[i].pricingTwoDistance,
                distanceThree: morningData[i].pricingThreeDistance,
              ),
            );
          }
      );
    }

  }
  Widget getFilterEveningServiceList(ServiceModel snapshot, int status) {

    if(eveningData.isEmpty){
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                  width: 200,
                  child: Center(child: Text("No Service Today"))),
            ],
          ));
    }
    else{
      return  ListView.builder(
          itemCount:eveningData.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                title: eveningData[i].title,
                subtitle: eveningData[i].subTitle,
                moneyOne: eveningData[i].pricingOne.value.toString(),
                moneyTwo:eveningData[i].pricingTwo.value.toString(),
                moneyThree: eveningData[i].pricingThree.value.toString(),
                distanceOne: eveningData[i].pricingOneDistance,
                distanceTwo: eveningData[i].pricingTwoDistance,
                distanceThree: eveningData[i].pricingThreeDistance,
              ),
            );
          }
      );
    }

  }

   filterData(ServiceModel snapshot) {
    print("snapshot${snapshot}");
    for (int i=0;i<snapshot.data.length;i++){
      if (snapshot.data[i].serviceType=="Morning"){
        morningData.add(snapshot.data[i]);
      }else{
        eveningData.add(snapshot.data[i]);
      }
    }
    flag=false;

  }
}

class SessionWidget extends StatelessWidget {
  final String title, imagePath;
  final bool isSelected;
  final int index;
  final Function(int index) onClick;

  const SessionWidget({
    Key? key,
    this.imagePath = "images/ic_morning.png",
    this.title = GSStrings.morning,
    required this.isSelected,
    required this.index,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(index);
      },
      child: Container(
        width: 112.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          color: isSelected ? GSColors.green_secondary : GSColors.gray_normal.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              this.imagePath,
              height: 18.0,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white :  GSColors.green_secondary,
            ),
            SizedBox(width: 6.0),
            Text(
              this.title,
              textAlign: TextAlign.start,
              style: GSTextStyles.make15xw600Style(
                color: isSelected ? Colors.white :  GSColors.green_secondary,
                fontFamily: GSFonts.appFont,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
