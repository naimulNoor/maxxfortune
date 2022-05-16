import 'package:flutter/material.dart';

import '../../Utils/AppCustomColors.dart';

class CreateAccountThreeScreenPage extends StatefulWidget {
  const CreateAccountThreeScreenPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountThreeScreenPage> createState() => _CreateAccountThreeScreenPageState();
}

class _CreateAccountThreeScreenPageState extends State<CreateAccountThreeScreenPage> {
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
          const Icon(Icons.arrow_back, color: Colors.black,size: 36,),
          const SizedBox(height: 10.0,),
          RichText(text: const TextSpan(
              children: [
                TextSpan(text: "STEP ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
                TextSpan(text: "03", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                TextSpan(text: "/03", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
              ]
          )),
          const SizedBox(height: 20.0,),
          const Text("Upload Photo", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                    borderRadius: BorderRadius.circular(50.0)
                ),
                child: const Icon(Icons.add,color: AppCustomColors.textLightColor,),
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppCustomColors.lightCreamBlue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/man.png"),
                ),
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppCustomColors.dialogBorderColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/woman.png"),
                ),
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppCustomColors.lightCreamBlue
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/man.png"),
                ),
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                    borderRadius: BorderRadius.circular(50.0),
                    color: AppCustomColors.dialogBorderColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/woman.png"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0,),
          const Text("Address", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 15.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ADDRESS LINE 1",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
            ),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ADDRESS LINE 2",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
            ),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "ZIP CODE",
              labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
            ),
          ),
          const SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "COUNTRY",
                    labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
              Flexible(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "POSTAL CODE",
                    labelStyle: const TextStyle(letterSpacing: 1, fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
              child: const Padding(padding: EdgeInsets.all(15.0), child: Text("Next", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)
              ),
            ),
          ),
        ],
      ),
    );
  }

}