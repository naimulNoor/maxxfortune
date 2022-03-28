import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenapp/ui/container/UIConstants/Colors.dart';
import 'package:tokenapp/ui/container/UIConstants/Fonts.dart';
import 'package:tokenapp/ui/container/UIConstants/GSWidgetStyles.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final double expansionHeight;
  final String? hint, iconPath, hintText;
  final bool showVisibilityOptionForPassword, isBorderNeeded, isRequiredField;
  final bool isFieldExpanded;

  final EdgeInsets margin;
  final TextEditingController formController;
  final TextInputType inputType;

  final Color colorInputFieldBackground, colorInputFieldBorder;
  final Color textColor, hintColor, iconColor;

  const CustomTextFormField({
    Key? key,
    required this.formController,
    required this.inputType,
    required this.hint,
    this.iconPath,
    this.maxLength,
    this.expansionHeight = 80.0,
    this.isRequiredField = true,
    this.isBorderNeeded = true,
    this.isFieldExpanded = false,
    this.showVisibilityOptionForPassword = true,
    this.colorInputFieldBackground = Colors.transparent,
    this.colorInputFieldBorder = const Color(0xFFA9ABAB),
    this.textColor = const Color(0xFF002923),
    this.hintColor = const Color(0xFF555958),
    this.iconColor = const Color(0xD1272B37),
    this.margin = const EdgeInsets.only(
      left: 30.0,
      right: 30.0,
      top: 20.0,
    ), this.hintText = "",
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isTextVisible;

  @override
  void initState() {
    _isTextVisible = widget.inputType != TextInputType.visiblePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hint != null && widget.hint!.trim().isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hint!,
                  style: GSTextStyles.make14xw400Style(
                    color: widget.hintColor,
                    fontFamily: GSFonts.appFont,
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (widget.isRequiredField)
                  Text(
                    "*",
                    style: GSTextStyles.make14xw400Style(
                      color: GSColors.green_secondary,
                      fontFamily: GSFonts.appFont,
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
              ],
            ),
          Container(
            height: widget.isFieldExpanded ? widget.expansionHeight : null,
            margin: const EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(
              color: widget.colorInputFieldBackground,
              borderRadius: BorderRadius.all(
                const Radius.circular(12.0),
              ),
              border: widget.isBorderNeeded
                  ? Border.fromBorderSide(
                      BorderSide(color: widget.colorInputFieldBorder),
                    )
                  : null,
            ),
            padding:
                (widget.iconPath != null && widget.iconPath!.trim().isNotEmpty)
                    ? ((widget.inputType == TextInputType.visiblePassword &&
                            widget.showVisibilityOptionForPassword)
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(right: 16.0))
                    : ((widget.inputType == TextInputType.visiblePassword &&
                            widget.showVisibilityOptionForPassword)
                        ? const EdgeInsets.only(left: 16.0)
                        : const EdgeInsets.symmetric(horizontal: 16.0)),
            child: TextFormField(
              expands: widget.isFieldExpanded,
              maxLines: widget.isFieldExpanded ? null : 1,
              minLines: widget.isFieldExpanded ? null : 1,
              obscureText: !_isTextVisible,
              style: GSTextStyles.make18xw400Style(
                color: widget.textColor,
              ),
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                prefixIcon: (widget.iconPath != null &&
                        widget.iconPath!.trim().isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Image.asset(
                          widget.iconPath!,
                          color: widget.iconColor,
                          fit: BoxFit.contain,
                          height: 20.0,
                        ),
                      )
                    : null,
                suffixIcon:
                    (widget.inputType == TextInputType.visiblePassword &&
                            widget.showVisibilityOptionForPassword)
                        ? GestureDetector(
                            child: Icon(
                              // Based on passwordVisible state choose the icon
                              _isTextVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: widget.iconColor,
                            ),
                            onTap: () {
                              setState(() {
                                _isTextVisible = !_isTextVisible;
                              });
                            },
                          )
                        : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              controller: widget.formController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
