import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/ui/app/auth/registration/registration_page_two.dart';
import 'package:tokenapp/widgets/widget_button.dart';
import '../../Utils/AppCustomColors.dart';

class CreateAccountOneScreenPage extends StatefulWidget {
  const CreateAccountOneScreenPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountOneScreenPage> createState() =>
      _CreateAccountOneScreenPageState();
}

class _CreateAccountOneScreenPageState
    extends State<CreateAccountOneScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppCustomColors.createAccPageStartColor,
                    AppCustomColors.createAccPageEndColor,
                  ],begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SingleChildScrollView(
                child: _appBody(),
              ),
            )
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
          InkWell(child: Icon(Icons.arrow_back, color: Colors.black,size: 36,), onTap: () {Navigator.pop(context);},),
          const SizedBox(height: 20.0,),
          RichText(text: const TextSpan(
              children: [
                TextSpan(text: "STEP ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
                TextSpan(text: "01", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0, color: AppCustomColors.textLightColor)),
                TextSpan(text: "/03", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.black38)),
              ]
          )),
          const SizedBox(height: 15.0,),
          const Text("Create Account", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0, color: AppCustomColors.textDarkColor),),
          const SizedBox(height: 15.0,),
          const Text("Collaboratively harness high-payoff methodologies via out-of-the-box vortals", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0, color: Colors.black38),),
          const SizedBox(height: 15.0,),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Name",
              hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0,color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Email",
              hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0,color: Colors.black38),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
          ),
          const SizedBox(height: 10.0,),
          Container(
            height: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: AppCustomColors.dividerColor),
                color: Colors.white
            ),
            child: Row(
              children: [
                CountryCodePicker(
                  enabled: false,
                  initialSelection: 'SG',
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  flagDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                ),
                const VerticalDivider(color: AppCustomColors.dividerColor,),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                      hintStyle: TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
                hintText: "PASSWORD",
                hintStyle: const TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: Colors.black38,)
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
                hintText: "CONFIRM PASSWORD",
                hintStyle: const TextStyle(letterSpacing: 1, fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black38),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(color: AppCustomColors.dividerColor)),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: Colors.black38,)
            ),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
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
              child: InkWell(
                child: Center(child: Text("Next", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white), textAlign: TextAlign.center,)),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => (RegistrationTwoPage())));},
              ),
            ),
          ),
        ],
      ),
    );
  }

}