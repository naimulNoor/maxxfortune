import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokenapp/base/widget/custom_filled_button.dart';
import 'package:tokenapp/core/ui/error_screen.dart';
import 'package:tokenapp/core/ui/loading_widget.dart';
import 'package:tokenapp/data/models/booking/my_booking_list_response.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/my_booking_details_one/my_booking_details_one.dart';
import 'package:tokenapp/ui/container/my_booking_details_two/my_booking_details_two.dart';
import 'package:tokenapp/ui/container/my_bookings/my_bookings_controller.dart';
import 'package:tokenapp/utils/booking_utils.dart' as bu;
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/date_time_utils.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBookingsView extends StatefulWidget {
  const MyBookingsView({Key? key}) : super(key: key);

  @override
  _MyBookingsViewState createState() => _MyBookingsViewState();
}

class _MyBookingsViewState extends State<MyBookingsView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
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
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.my_bookings_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.my_bookings_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make16xw400Style(
                    color: GSColors.gray_secondary,
                  ),
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

class _BodyWidgetState extends State<BodyWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  final _controller = MyBookingsController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    _controller.getMyBookingList();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){

      var response = _controller.bookingListResponse.value;

      if(response==null){
        return LoadingWidget();
      }else {
        if (response.data == null) {
          return ErrorScreen();
        }
        else {

          List<Booking> allList = response.data?.bookings ?? [];
          List<Booking> pendingList = response.data?.bookings.where((element) => element.isFinished==0 && element.isPaid==0).toList() ?? [];
          List<Booking> ongoingList = response.data?.bookings.where((element) => element.isFinished==0 && element.isPaid==1).toList() ?? [];
          List<Booking> approvedList = response.data?.bookings.where((element) => element.isFinished==1 && element.isPaid==1).toList() ?? [];

          return Column(
            children: [
              TabBar(
                physics: BouncingScrollPhysics(),
                isScrollable: false,
                labelColor: GSColors.green_secondary,
                unselectedLabelColor: GSColors.gray_secondary,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                indicatorColor: GSColors.green_secondary,
                controller: _tabController,
                labelStyle: GSTextStyles.make16xw600Style(
                  color: GSColors.green_secondary,
                ),
                unselectedLabelStyle: GSTextStyles.make16xw600Style(
                  color: GSColors.gray_secondary,
                ),
                tabs: [
                  TabBarCustomTab(title: "All"),
                  TabBarCustomTab(title: "Pending"),
                  TabBarCustomTab(title: "On Going"),
                  TabBarCustomTab(title: "Finished"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    BookingListWidget(bookingList: allList,),
                    BookingListWidget(bookingList: pendingList,),
                    BookingListWidget(bookingList: ongoingList,),
                    BookingListWidget2(bookingList: approvedList,),
                  ],
                ),
              ),
            ],
          );
        }
      }
    });
  }
}

class BookingListWidget extends StatelessWidget {

  final List<Booking> bookingList;

  const BookingListWidget({
    Key? key,
    required this.bookingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return BookingItemWidget(type: 0, booking: bookingList[index],);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 30.0);
      },
      itemCount: bookingList.length,
    );
  }
}

class BookingListWidget2 extends StatelessWidget {

  final List<Booking> bookingList;

  const BookingListWidget2({
    Key? key,
    required this.bookingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return BookingItemWidget(type: 1,booking: bookingList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 30.0);
      },
      itemCount: bookingList.length,
    );
  }
}

class BookingItemWidget extends StatelessWidget {

  final int type;
  final Booking booking;

  const BookingItemWidget({
    Key? key,
    required this.type,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(6.0),
        ),
        border: const Border.fromBorderSide(
          const BorderSide(
            color: GSColors.gray_normal,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemHeaderWidget(type: type, booking: booking,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              height: 2.0,
              color: GSColors.gray_normal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemBodyWidget(type: type, booking: booking,),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {

  final int type;
  final Booking booking;

  const BookingItemBodyWidget({
    Key? key,
    required this.type,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: GSColors.green_secondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: DottedLine(
                        dashLength: 8.0,
                        dashColor: GSColors.gray_primary.withOpacity(0.3),
                        direction: Axis.vertical,
                        lineLength: 60,
                      ),
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: GSColors.green_secondary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSubtitleWidget(
                      title: "Pickup point",
                      subtitle: "${booking.pickupAddress}",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: TitleSubtitleWidget(
                        title: "Drop-off point",
                        subtitle: "${booking.dropoffAddress}",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleSubtitleWidget(
              title: "Start Date",
              subtitle: speakDate(booking.startDate),
            ),
            TitleSubtitleWidget(
              title: "End Date",
              subtitle: speakDate(booking.endDate),
            ),
          ],
        ),
        CustomFilledButton(
          margin: const EdgeInsets.only(
            top: 16.0,
          ),
          fontSize: 14.0,
          padding: const EdgeInsets.all(12.0),
          borderRadius: 8.0,
          borderColor: GSColors.green_secondary,
          backgroundColor: Colors.transparent,
          textColor: GSColors.green_secondary,
          title: "Booking Details",
          onTap: () {
              Get.to(MyBookingDetailsOneView(booking: booking,));
          },
        ),
      ],
    );
  }
}

class BookingItemHeaderWidget extends StatelessWidget {

  final int type;
  final Booking booking;

  const BookingItemHeaderWidget({
    Key? key,
    required this.type,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking ID",
              style: GSTextStyles.make14xw400Style(
                fontFamily: GSFonts.appFont,
                color: GSColors.gray_primary,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "#${booking.id}",
                style: GSTextStyles.make20xw700Style(
                  color: GSColors.gray_primary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: bu.getColor(booking).withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(dp20),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Text(
            bu.getType(booking),
            style: GSTextStyles.make13xw700Style(
              color: bu.getColor(booking),
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            this.title,
            textAlign: TextAlign.start,
            style: GSTextStyles.make14xw400Style(
              color: GSColors.gray_secondary,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(
          this.subtitle,
          textAlign: TextAlign.start,
          style: GSTextStyles.make16xw500Style(
            color: GSColors.text_regular,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }
}

class TabBarCustomTab extends StatelessWidget {
  final String title;

  const TabBarCustomTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: dp14,
        ),
      ),
    );
  }
}
