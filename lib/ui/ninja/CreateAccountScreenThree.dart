import 'package:flutter/material.dart';

import '../../Utils/AppCustomColors.dart';
import '../../constants.dart';

class CreateAccountThreeScreenPage extends StatefulWidget {
  const CreateAccountThreeScreenPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountThreeScreenPage> createState() => _CreateAccountThreeScreenPageState();
}

class _CreateAccountThreeScreenPageState extends State<CreateAccountThreeScreenPage> {

  late TextEditingController countryController;
  late TextEditingController codeController;

  @override
  void initState() {
    countryController = TextEditingController();
    countryController.text="Singapore";

    codeController = TextEditingController();
    codeController.text="788122";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppCustomColors.createAccPageStartColor,
                  AppCustomColors.createAccPageEndColor,
                ],begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: SingleChildScrollView(
              child: _appBody(),
            ),
          ),
        )
    );
  }

  /// AppBody
  Widget _appBody(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(child: Icon(Icons.arrow_back_outlined, color: Colors.black,size: 22,), onTap: () {Navigator.pop(context);},),
          const SizedBox(height: 20.0,),
          RichText(text: const TextSpan(
              children: [
                TextSpan(text: "STEP ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
                TextSpan(text: "03", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                TextSpan(text: "/03", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
              ]
          )),
          const SizedBox(height: 20.0,),
          const Text("Upload Photo", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color(0xffDFDADA),
                  child: CircleAvatar(
                    radius: 28.0,
                    child: Icon(Icons.add,color: colortitle,size: 40.0,),backgroundColor: Colors.white,
                  )
              ),
              SizedBox(width: 5.0,),
              CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_one.png"),),
              SizedBox(width: 5.0,),
              CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_two.png"),),
              SizedBox(width: 5.0,),
              CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_three.png"),),
              SizedBox(width: 5.0,),
              CircleAvatar(radius: 30.0,backgroundImage: AssetImage("images/avater_four.png"),),
              SizedBox(width: 5.0,),
            ],
          ),
          const SizedBox(height: 20.0,),
          const Text("Address", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 15.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ADDRESS LINE 1",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ADDRESS LINE 2",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ZIP CODE",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0),
          ),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  controller: countryController,
                  decoration: InputDecoration(
                    labelText: "COUNTRY",
                    labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                  ),
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0),
                ),
              ),
              const SizedBox(width: 10.0,),
              Flexible(
                flex: 1,
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    labelText: "POSTAL CODE",
                    labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.inputBorderColor)),
                  ),
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48.0,
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
              child: Center(child: Text("Next", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)),
            ),
          ),
        ],
      ),
    );
  }

}