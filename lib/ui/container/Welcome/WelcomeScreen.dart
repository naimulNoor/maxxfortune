import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/base/widget/GSButtonWidget.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';
import 'package:tokenapp/ui/container/UIConstants/UISizeConstants.dart';

// UI
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
} //: UI

// State
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GSColors.green_primary,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    GSSizeConstants.padding30,
                    GSSizeConstants.zero,
                    GSSizeConstants.padding30,
                    GSSizeConstants.zero),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //Get start text
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          GSStrings.get_started,
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make18xw400Style(),
                        )),

                    // Description text
                    Text(
                      GSStrings.welcome_description,
                      style: GSTextStyles.make34xw700Style(),
                    ),

                    SizedBox(
                      height: GSSizeConstants.padding44,
                    ),
                    GSButton(
                      text: GSStrings.sign_in,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding22,
                    ),
                    GSButtonOutlineStock(),
                    SizedBox(
                      height: GSSizeConstants.padding22,
                    ),
                  ],
                ))));
  } //: Widget
} //: State
