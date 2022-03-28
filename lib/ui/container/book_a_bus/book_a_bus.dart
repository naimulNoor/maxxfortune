import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/data/models/container/FaqModel.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/about_us/about_us.dart';
import 'package:tokenapp/ui/container/contact_us/contact_us.dart';
import 'package:tokenapp/ui/container/home/home.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tokenapp/ui/book_a_bus/info_screen.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/about_us/about_us.dart';
import 'package:tokenapp/ui/container/contact_us/contact_us.dart';
import 'package:tokenapp/ui/container/faq/faq.dart';
import 'package:tokenapp/ui/container/home/home.dart';
import 'package:tokenapp/ui/container/lost_and_found/lost_and_found.dart';
import 'package:tokenapp/ui/container/our_service/our_service.dart';
import 'package:tokenapp/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:tokenapp/ui/container/terms_and_conditions/terms_and_conditions.dart';
import 'package:tokenapp/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:tokenapp/ui/navigation_container/widgets/menu_items.dart';
import 'package:tokenapp/ui/not_logged_in_welcome/welcome/welcome_screen.dart';
import 'package:tokenapp/ui/section1/driver_login/driver_login_screen.dart';
import 'package:tokenapp/ui/section4/widgets/menu_page_button.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class BookABusView extends StatefulWidget {
  FaqModel? data;
  int categoryId;
  String name;
  BookABusView({required this.data,  required this.categoryId,required this.name});

  @override
  _BookABusViewState createState() => _BookABusViewState();
}


class _BookABusViewState extends State<BookABusView> {
  late int selectedBottomBarIndex=0;
  late Widget body;
  @override
  void initState() {
    body=_index();
    super.initState();
  }
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: GSColors.green_secondary,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [gradientDark, gradientLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
            child: Center(
              child: SvgPicture.asset(
                AssetConstants.ic_bus_svg,
              ),
            ),
          ),
          onPressed: () {
            Get.to(
              InfoScreen(),
            );
          },
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  iconString: AssetConstants.ic_home_svg,
                  isSelected: selectedBottomBarIndex == 0,
                  title: "Home",
                  index: 0,
                  onTap: _changeBottomBarIndex,
                ),
                BottomBarItem(
                  iconString: "",
                  isSelected: selectedBottomBarIndex == 1,
                  title: "Book a Bus",
                  index: 1,
                  onTap: (int position){

                  },
                ),
                BottomBarItem(
                  iconString: AssetConstants.ic_menu_svg,
                  isSelected: selectedBottomBarIndex == 2,
                  title: "Menu",
                  index: 2,
                  onTap: (int position) {
                    showMenuBottomSheet(MediaQuery.of(context).size.height, context);
                  },
                ),
              ],
            ),
          ),
        ),

        body: body
      ),
    );

  }

  showMenuBottomSheet(double height, BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dp20),
          topRight: Radius.circular(dp20),
        ),
      ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              height: height - 100,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(dp20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: dp30,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.sg/photo-1563306406-e66174fa3787",
                          ),
                        ),
                        HSpacer20(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No user logged in",
                              style: GoogleFonts.manrope(
                                color: darkText,
                                fontWeight: FontWeight.bold,
                                fontSize: dp16,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.back();
                                Get.to(
                                  NotLoggedInWelcome(),
                                );
                              },
                              child: Text(
                                "Tap to login",
                                style: GoogleFonts.manrope(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          isSelected: 3 == selectedBottomBarIndex,
                          index: 3,
                          title: "About Us",
                          icon: AssetConstants.ic_about_us_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 4 == selectedBottomBarIndex,
                          index: 4,
                          title: "Our Services",
                          icon: AssetConstants.ic_refund_request_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == selectedBottomBarIndex,
                          index: 5,
                          title: "FAQ",
                          icon: AssetConstants.ic_faq_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 6 == selectedBottomBarIndex,
                          index: 6,
                          title: "Lost & Found",
                          icon: AssetConstants.ic_lost_and_found_new_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 7 == selectedBottomBarIndex,
                          index: 7,
                          title: "Terms & Condition",
                          icon: AssetConstants.ic_notification_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == selectedBottomBarIndex,
                          index: 8,
                          title: "Privacy & Concern",
                          icon: AssetConstants.ic_privacy_and_concern_svg,
                          onClick: (index) {
                            print("8 is clicked?");
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == selectedBottomBarIndex,
                          index: 9,
                          title: "Contact Us",
                          icon: AssetConstants.ic_contact_us_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 10 == selectedBottomBarIndex,
                          index: 10,
                          title: "Driver Login",
                          icon: AssetConstants.ic_driver_login_svg,
                          onClick: (index) {
                            Get.back();
                            Get.to(
                              DriverLoginScreen(),
                            );
                          },
                        ),
                        MenuButtonOutlineStock(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  Widget _index(){
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(data:widget.data,index:widget.categoryId,name:widget.name),
          Expanded(
            child: FaqListWidget(data:widget.data,index:widget.categoryId),
          ),
          CustomFilledButton(
            margin: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 32.0,
              bottom: 35.0,
            ),
            borderRadius: 8.0,
            borderColor: GSColors.green_secondary,
            backgroundColor: Colors.transparent,
            textColor: GSColors.green_secondary,
            title: GSStrings.book_a_bus_contact_with_us,
            onTap: () {
              Get.to(
                  ContactUsView()
              );
            },
          ),
        ],
    );
  }

  void _changeBottomBarIndex(int index) {
    if (index >= 3) Get.back();

    setState(() {
      selectedBottomBarIndex = index;

      switch (index) {
        case 0:
          body = HomeView();
          break;

        case 1:
          body = AboutUsView();
          break;

        case 3:
          body = AboutUsView();
          break;

        case 4:
          body = OurServiceView();
          break;

        case 5:
          body = FaqView();
          break;

        case 6:
          body = LostAndFoundView();
          break;

        case 7:
          body = TermsAndConditionsView();
          break;

        case 8:
          body = PrivacyAndConcernView();
          break;

        case 9:
          body = ContactUsView();
          break;

        default:
          break;
      }
    });
  }
}

class TitleWidget extends StatelessWidget {
  FaqModel? data;
  int index;
  String name;
  TitleWidget({required this.data,  required this.index,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
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
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  child: Ink(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          GSStrings.back,
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make18xw400Style(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  top: 8.0,
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make40xw900Style(),
                ),
              ),
              Text(
                GSStrings.book_a_bus_subtitle,
                textAlign: TextAlign.start,
                style: GSTextStyles.make18xw400Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FaqListWidget extends StatefulWidget {
  FaqModel? data;
  int index;
  FaqListWidget({required this.data,  required this.index});

  @override
  _FaqListWidgetState createState() => _FaqListWidgetState();
}

class _FaqListWidgetState extends State<FaqListWidget> {
  List<QAModel> list = List<QAModel>.empty(growable: true);
  @override
  void initState() {

   getQuistenItemCount(widget.data,widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return FaqItemWidget(list:list[index],index:index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 40.0);
      },

    );
  }

  void getQuistenItemCount(FaqModel? data, int? index) {
    for (int i=0;i<data!.data.length;i++){
       if (data.data[i].categoryId==index){
         list.add(new QAModel(data.data[i].question,data.data[i].answer));
       }

    }
  }
  }





  class QAModel{
  late String qus;
  late String ans;

  QAModel(this.qus, this.ans);

  }



class FaqItemWidget extends StatelessWidget {
  final QAModel list;
  final int index;

  const FaqItemWidget({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28.0,
                margin: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "${index+1}.",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.text_bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        list.qus,
                        style: GSTextStyles.make18xw600Style(
                          color: GSColors.text_bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      list.ans,
                      style: GSTextStyles.make12xw400Style(
                        color: GSColors.text_secondary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
