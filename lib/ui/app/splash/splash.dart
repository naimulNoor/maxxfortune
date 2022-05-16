import 'package:flutter/material.dart';
import 'package:tokenapp/ui/ninja/CreateAccountScreenOne.dart';
import 'package:tokenapp/ui/ninja/dialog_scratch.dart';
import 'package:tokenapp/widgets/widget_button.dart';

import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () {
  //     _openScratchDialog();
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xff0A0930),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/login_bg.png")
          )
        ), 
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    Container(child: Image.asset("images/icons/lion.png")),
                    SizedBox(height: 10,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Scratch ',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize:50 ,color: Colors.white),),
                          TextSpan(
                            text: 'Away',
                            style: TextStyle(fontSize:50 ,color: Colors.white),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '& Get ',
                            style: TextStyle(fontSize:50 ,color: Colors.white),),
                          TextSpan(
                            text: 'Rewards ',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize:50 ,color: Colors.white),),

                        ],
                      ),
                    ),
                    Container(child: Image.asset("images/splash_image.png",height: 300,)),
                    SizedBox(height: 40,),
                    WidgetButton(title: "Login to Account", onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => (HomePage()),),);
                    }, margin: EdgeInsets.symmetric(horizontal: 30.0),),
                    SizedBox(height: 20
                      ,),
                    Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => (CreateAccountOneScreenPage())));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50.0),

                      ),
                      child: Center(
                          child: Text("Create a New Account",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                )

                  ],
                ),
              ),
            ),
          )
        )
    );
  }

  void _openScratchDialog() {

    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: DialogScratchPage(),
    );
    showDialog(context: context, builder: (BuildContext context) => errorDialog);}
}
