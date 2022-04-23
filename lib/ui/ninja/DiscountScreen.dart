import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.red, width: 1.0)),
        child: Column(
          children: [
            _topBar(),
            _body(),
          ],
        ),
      )
    );
  }

  ///Dialogue Top Bar
  Widget _topBar(){
    return Container(
      decoration: const BoxDecoration(
          color: Color(0x40f8e6ae),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
        child: Row(
          children: [
            SvgPicture.asset("assets/images/ic_gift.svg"),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "25 % Discount",
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Shop Dominos Pizza",
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SvgPicture.asset("assets/images/ic_starbucks.svg"),
          ],
        ),
      ),
    );
  }

  /// Dialogue Body
  Widget _body(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 8.0),
      child: Image.asset("assets/images/scratch.png"),
    );
  }

}
