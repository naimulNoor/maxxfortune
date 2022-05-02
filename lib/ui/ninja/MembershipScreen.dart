import 'package:flutter/material.dart';
import 'package:tokenapp/Utils/AppCustomColors.dart';


class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 320.0,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: AppCustomColors.dialogBorderColor),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Monthly Membership",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 40.0),
                child: Table(
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: Colors.black26),
                    // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Card Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                    color: AppCustomColors.textLightColor),
                              ),
                              Text(
                                "00033430003",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: AppCustomColors.textDarkColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "Issuer",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                    color: AppCustomColors.textLightColor),
                              ),
                              Text(
                                "MTB Organization",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: AppCustomColors.textDarkColor),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
              ),
              const SizedBox(height: 40.0,),
              Image.asset("assets/images/barcode.png"),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}
