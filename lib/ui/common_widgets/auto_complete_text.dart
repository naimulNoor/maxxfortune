import 'package:flutter/material.dart';
import 'package:tokenapp/utils/colors.dart';
import 'package:tokenapp/utils/dimens.dart';

class AutoCompleteTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final List<String> suggestions;

  AutoCompleteTextField({
    Key? key,
    required this.controller,
    this.hint = "",
    this.type = TextInputType.text,
    required this.suggestions,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // return Theme(
    //   data: ThemeData(
    //     textSelectionTheme: TextSelectionThemeData(
    //       cursorColor: accent,
    //     ),
    //     fixTextFieldOutlineLabel: false,
    //     accentColor: accent
    //   ),
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: dp10),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(dp10),
    //         border: Border.all(
    //             color: grey
    //         )
    //     ),
    //     child: Autocomplete<String>(
    //       optionsBuilder: (TextEditingValue textEditingValue) {
    //         if (textEditingValue.text == '') {
    //           return const Iterable<String>.empty();
    //         }
    //         return suggestions.where((String option) {
    //           return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
    //         });
    //       },
    //       onSelected: (String selection) {
    //         controller.text=selection;
    //       },
    //     ),
    //   ),
    // );

    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return suggestions.where((String option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        controller.text=selection;
      },
    );
  }
}
