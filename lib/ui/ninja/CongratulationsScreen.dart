import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/ninja/ClaimRewardScreen.dart';
import '../../Utils/AppCustomColors.dart';

class CongratulationPage extends StatefulWidget {
  const CongratulationPage({Key? key}) : super(key: key);

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {
  late ConfettiController _controllerBlast;

  @override
  void initState() {
    _controllerBlast = ConfettiController(duration: const Duration(seconds: 5));
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
    return Container(
      width: 300,
      height: 320,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.red, width: 1.0)),
      child: Stack(
        alignment: Alignment.center,
        children: [
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
          ),top: 10,),
          Positioned(child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Image.asset("images/confetti.png"),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Congratulations",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: AppCustomColors.buttonEndColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You have won the reward",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "DOMINO'S FREE PIZZA",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
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
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                        child: Text(
                          "Claim Token",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => (ClaimRewardPageWithCheck())));
                        },
                      )),
                ),
              )
            ],
          ), top: 0,left: 0,bottom: 0,right: 0,),
        ],
      ),
    );
  }
}