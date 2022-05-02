import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/routes.dart';
import 'package:tokenapp/utils/AppCustomColors.dart';


class RedeemCoinPage extends StatefulWidget {
  const RedeemCoinPage({Key? key}) : super(key: key);

  @override
  State<RedeemCoinPage> createState() => _RedeemCoinPageState();
}

class _RedeemCoinPageState extends State<RedeemCoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [_appBar(), _body()],
              ),
              Positioned(
                child: _watchButton(),
                bottom: 5,
                left: 40,
                right: 40,
              )
            ],
          ),
        ),
      )
    );
  }

  /// AppBar
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
                "Redeem Coins",
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

  /// Body
  Widget _body() {
    return Expanded(
        child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.9),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _gridItem();
      },
    ));
  }

  /// Grid Item
  Widget _gridItem() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/coupon_bg.png"))),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(width: 1.0, color: AppCustomColors.borderColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "\$5",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: AppCustomColors.textDarkColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: AppCustomColors.pageStartColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/ic_coin.svg"),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        "-200",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppCustomColors.textCoinColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          top: 30,
          left: 30,
          right: 32,
          bottom: 70,
        ),
      ],
    );
  }

  /// Watch Button
  Widget _watchButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, Routes.earnCredit);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: const LinearGradient(
              begin: Alignment(-1.0, -2.0),
              end: Alignment(1.0, 2.0),
              colors: <Color>[
                AppCustomColors.buttonStartColor,
                AppCustomColors.buttonEndColor
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/ic_play.svg"),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  "Watch & Earn Coins",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
