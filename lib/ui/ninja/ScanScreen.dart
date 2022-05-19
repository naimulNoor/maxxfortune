import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokenapp/routes.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';


import '../../Utils/CustomClipPath.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppCustomColors.pageStartColor,
          AppCustomColors.pageEndColor,
        ],begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _appBar(),
                _body(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// App Bar
  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: const Icon(Icons.arrow_back,
                color: AppCustomColors.textLightColor, size: 32.0),
            onTap: () {},
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Text(
                "McDonalds",
                style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: AppCustomColors.textDarkColor),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Body
  Widget _body(){
    return Stack(
      children: [
        Positioned(child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
          child: ClipPath(clipper: CustomClipPath(),child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),height: 670,),),
        )),
        Positioned(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 5.0, blurStyle: BlurStyle.outer)]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset("images/ic_starbucks.svg"),
                  ),
                ),
                const SizedBox(height: 10.0,),
                const Text("Enjoy 25 % Discount", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0, color: AppCustomColors.textDarkColor),),
                const SizedBox(height: 20.0,),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DottedLine(direction: Axis.horizontal, lineLength: double.infinity, lineThickness: 1.0, dashLength: 3.0, dashColor: Colors.black12,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Received", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0, color: Colors.black12),),
                        SizedBox(height: 5.0,),
                        Text("27 Dec, 21", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color: AppCustomColors.textDarkColor),),
                      ],
                    ),
                    const DottedLine(direction: Axis.vertical, lineLength: 70, lineThickness: 1.0, dashLength: 3.0, dashColor: Colors.black12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Token No,", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0, color: Colors.black12),),
                        SizedBox(height: 5.0,),
                        Text("98886E899", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color: AppCustomColors.textDarkColor),),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: DottedLine(direction: Axis.horizontal, lineLength: double.infinity, lineThickness: 1.0, dashLength: 3.0, dashColor: Colors.black12,),
                ),
                const SizedBox(height: 30.0,),
                Image.asset("images/qr.png"),
                const SizedBox(height: 40.0,),
                const Text("Use this Coupon", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0, color: Colors.black38),),
                const SizedBox(height: 5.0,),
                const Text("McDonalds", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color: AppCustomColors.textDarkColor),),
                const SizedBox(height: 5.0,),
                const Text("2715 Ash Dr. San Jose, South", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0, color: AppCustomColors.textDarkColor),),
                const SizedBox(height: 5.0,),
                const Text("Dakota 83475", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0, color: AppCustomColors.textDarkColor),),
                const SizedBox(height: 30.0,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.claimOne);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        gradient: const LinearGradient(colors: [AppCustomColors.buttonStartColor, AppCustomColors.buttonEndColor])
                      ),
                      child: const Padding(padding: EdgeInsets.all(15.0), child: Text("Scan to Reedem", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.white),textAlign: TextAlign.center,),),
                    ),
                  ),
                ),
              ],
            ),
          top: 0,
          left: 0,
          right: 0,
        ),
      ],
    );
  }
}

