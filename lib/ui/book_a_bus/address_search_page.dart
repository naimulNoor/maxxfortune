import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokenapp/data/models/one_map/one_map_response.dart';
import 'package:tokenapp/ui/book_a_bus/search_controller.dart';
import 'package:tokenapp/ui/common_widgets/common_text_field.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';
import 'package:tokenapp/utils/spacers.dart';

class AddressSearchPage extends StatefulWidget {
  const AddressSearchPage({Key? key}) : super(key: key);

  @override
  _AddressSearchPageState createState() => _AddressSearchPageState();
}

class _AddressSearchPageState extends State<AddressSearchPage> {

  var focusNode = FocusNode();
  TextEditingController addressController = TextEditingController();
  Timer? _debounce;
  String query = "";
  int _debouncetime = 500;
  final controller = SearchController();

  @override
  void initState() {
    addressController.addListener(_onSearchChanged);
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(dp10),
        child: Column(
          children: [
            VSpacer40(),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    focusNode: focusNode,
                    controller: addressController,
                    hint: "Search by Postal Code OR Address",
                  ),
                ),
                // HSpacer10(),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             dp10
                //         )
                //     ),
                //   ),
                //   height: dp48,
                //   minWidth: dp48,
                //   color: accent,
                //   child: Icon(
                //     Icons.search,
                //     color: white,
                //   ),
                //   onPressed: (){
                //     controller.searchAddress(addressController.text);
                //   },
                // ),
              ],
            ),
            Expanded(
              child: Obx((){

                var searchResponse = controller.searchResponse.value;

                if(searchResponse!=null) {
                  var searchResults = searchResponse.results;
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (ctx, idx){
                      return SearchItem(res: searchResults[idx], response: searchResponse,);
                    },
                  );
                }else return Container();
            })
            ),
          ],
        ),
      ),
    );
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: _debouncetime), () {
      if (addressController.text != "") {
        controller.searchAddress(addressController.text);
      }
    });
  }

  @override
  void dispose() {
    addressController.removeListener(_onSearchChanged);
    addressController.dispose();
    super.dispose();
  }
}

class SearchItem extends StatelessWidget {

  final OneMapResponse response;
  final Result res;

  const SearchItem({Key? key, required this.res, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.back(result: {
          "result" : res,
          "response" : response
        });
      },
      child: Container(
        padding: EdgeInsets.all(dp10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              res.address,
            ),
            VSpacer10(),
            Divider(
              height: 1,
              color: light_grey,
            )
          ],
        ),
      ),
    );
  }
}

