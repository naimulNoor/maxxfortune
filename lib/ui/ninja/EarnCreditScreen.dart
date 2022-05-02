import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/AppCustomColors.dart';

class EarnCreditPage extends StatefulWidget {
  const EarnCreditPage({Key? key}) : super(key: key);

  @override
  State<EarnCreditPage> createState() => _EarnCreditPageState();
}

class _EarnCreditPageState extends State<EarnCreditPage> {

  final ValueNotifier<bool> _clicked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: <Color>[
              AppCustomColors.pageStartColor,
              AppCustomColors.pageEndColor
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _appBar(),
              _appBody(context),
            ],
          ),
        ),
      ));
  }

  /// App Bar
  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: const Icon(Icons.arrow_back,
                color: AppCustomColors.textLightColor, size: 32.0),
            onTap: () {},
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Watch & Earn Credit",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    color: AppCustomColors.textDarkColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Your Have : ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: AppCustomColors.textLightColor),
                  ),
                  SvgPicture.asset("images/ic_coin.svg"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "200 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: AppCustomColors.textDarkColor),
                      ),
                      TextSpan(
                        text: "Coins",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: AppCustomColors.textLightColor),
                      ),
                    ]),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  /// App Body
  Widget _appBody(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Column(
              children: [
                _listItem(),
                _listItem(),
                _listItem(),
                _listItem(),
                ColorFiltered(colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation), child: _listItem(),)
              ],
      ),
          ),
    ));
  }

  /// List Item
  Widget _listItem(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.red
        ),
        child: Stack(
          children: [
            Positioned(child: SvgPicture.asset("images/bg_coin.svg",height:150.0,), left: -25,top: -25,),
            Positioned(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("images/ic_credit_coin_one.svg",height: 65,),
                const Text(
                  "20 Coins",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 35.0),
                ),
                SvgPicture.asset("images/ic_video_play.svg",height: 65,),
              ],
            ), left: 25, right: 10,top: 0,bottom: 0,)
          ],
        ),
      ),
    );
  }

}
