import 'package:confetti/confetti.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/AppCustomColors.dart';
import '../../Utils/CustomClipPath.dart';

class ClaimPageOne extends StatefulWidget {
  const ClaimPageOne({Key? key}) : super(key: key);

  @override
  State<ClaimPageOne> createState() => _ClaimPageOneState();
}

class _ClaimPageOneState extends State<ClaimPageOne> {

  late ConfettiController _controllerBlast;

  @override
  void initState() {
    _controllerBlast =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerBlast.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerBlast.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: Column(
                children: [
                  _appBar(),
                  _appBody()
                ],
              ),
            ),
          ),
        )
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
                "Claim Prize",
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

  /// App Body
  Widget _appBody(){
    return Stack(
      children: [
        Positioned(child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
          child: ClipPath(clipper: CustomClipPath(),child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),height: 730,),),
        )),
        Positioned(child:ConfettiWidget(
          confettiController: _controllerBlast,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ],
          numberOfParticles: 50,
          maxBlastForce: 10,
          minBlastForce: 2,
        ),
        top: 0,
        left: 0,
        right: 0,),
        Positioned(
          child: Column(
            children: [
              const SizedBox(height: 120.0,),
              const Text("Elton Musk", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0, color: AppCustomColors.buttonEndColor),),
              const SizedBox(height: 20.0,),
              const Text("You Just Redeem a Coupon", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38),),
              const SizedBox(height: 40.0,),
              SvgPicture.asset("assets/images/ic_starbucks.svg"),
              const SizedBox(height: 10.0,),
              const Text("Starbucks", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: AppCustomColors.textDarkColor),),
              const SizedBox(height: 10.0,),
              const Text("Free Coffee", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, color: AppCustomColors.textDarkColor),),
              const SizedBox(height: 50.0,),
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
              const SizedBox(height: 60.0,),
              const Text("Confirm to Redeem", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0, color: AppCustomColors.textDarkColor),),
              const SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0,), borderSide: const BorderSide(color: Colors.black12)),
                      hintText: "PASSWORD",
                      hintStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 13.0, letterSpacing: 1.0, color: Colors.black26,),
                      contentPadding: const EdgeInsets.only(left: 25.0,top: 20.0,right: 25.0,bottom: 20.0),
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: Colors.black26,),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              Padding(
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
