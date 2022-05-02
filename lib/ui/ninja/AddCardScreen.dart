
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokenapp/Utils/AppCustomColors.dart';


class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppCustomColors.pageStartColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,20.0),
              child: Row(
                children: const[
                  Icon(Icons.arrow_back,color: AppCustomColors.textLightColor,),
                  SizedBox(width: 40,),
                  Text("Add a New Card", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.0, color: AppCustomColors.textDarkColor),)
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  const Text("Card Info", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0, color: AppCustomColors.textDarkColor),),
                  const SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0,), borderSide: const BorderSide(color: Colors.black12)),
                      hintText: "Monthly Membership",
                      hintStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0, color: AppCustomColors.textDarkColor,),
                      contentPadding: const EdgeInsets.only(left: 25.0,top: 20.0,right: 25.0,bottom: 20.0)
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0,), borderSide: const BorderSide(color: Colors.black12)),
                        hintText: "CARD ISSUER",
                        hintStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 13.0, letterSpacing: 2.0, color: Colors.black26,),
                        contentPadding: const EdgeInsets.only(left: 25.0,top: 20.0,right: 25.0,bottom: 20.0)
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0,), borderSide: const BorderSide(color: Colors.black12)),
                        hintText: "CARD NUMBER",
                        hintStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 13.0, letterSpacing: 2.0, color: Colors.black26,),
                        contentPadding: const EdgeInsets.only(left: 25.0,top: 20.0,right: 25.0,bottom: 20.0)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DottedBorder(child: ClipRRect(
                    child: SizedBox(
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/ic_scan.svg"),
                          SizedBox(width: 10.0,),
                          Text("ADD A BARCODE", style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.0, letterSpacing: 2.0, color: Colors.black45,),)
                        ],
                      ),
                    )
                  ),
                    color: Colors.black12,
                    strokeWidth: 1,radius: const Radius.circular(50.0), borderType: BorderType.RRect,dashPattern: const [6],),
                  const SizedBox(height: 20,),
                  const Text("Card Template", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0, color: AppCustomColors.textDarkColor),),
                  const SizedBox(height: 20,),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.redAccent
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black54
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blueAccent
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: const LinearGradient(colors: [AppCustomColors.buttonStartColor,AppCustomColors.buttonEndColor])
                    ),
                    child: const Center(
                      child: Text("Save Card", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: Colors.white),),
                    ),
                  ),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
