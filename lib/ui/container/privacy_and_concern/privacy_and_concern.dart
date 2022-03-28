import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tokenapp/data/models/container/SettingsModel.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:tokenapp/ui/container/UIConstants/Strings.dart';

import 'SettingController.dart';

class PrivacyAndConcernView extends StatefulWidget {
  const PrivacyAndConcernView({Key? key}) : super(key: key);

  @override
  _PrivacyAndConcernViewState createState() => _PrivacyAndConcernViewState();
}

class _PrivacyAndConcernViewState extends State<PrivacyAndConcernView> {

  SettingController controller=new SettingController();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(),
            FutureBuilder<SettingsModel>(
                future: getTC(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Expanded(
                      child: PrivacyWidget(snapshot.data!),
                    );
                  }
                  return Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: CircularProgressIndicator()));

                }
            ),

          ],
        ),
      ),
    );
  }
  Future<SettingsModel> getTC() async{

    var response = await controller.SettingServiceProvider();
    print("response${response.data}");
    return response;

    // if(response != null) {
    //
    // }
    // else{
    //   new AboutUsModel(data:new List());
    // }
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_two.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.privacy_and_concern_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.privacy_and_concern_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyWidget extends StatefulWidget {
  SettingsModel model;
  PrivacyWidget(this.model, {Key? key}) : super(key: key);

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 28.0,
        ),
        width: double.maxFinite,
        child: Center(
          child: Html(
            data: widget.model.data.first.privacyConcerns,
          ),
        ),
      ),
    );
  }
}
