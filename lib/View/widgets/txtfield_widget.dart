import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Style/Colors.dart';
import '../../app/validations.dart';

// ignore: use_key_in_widget_constructors
class TxtFieldWidget extends StatefulWidget {
  final String hintTxt;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isHasNextFocus;
  final Widget? suffixIcon;
  final String? pass;
  final String? type;
  final FocusNode? focusNode;
  final GlobalKey<FormState>? formKey;

  const TxtFieldWidget(
      {Key? key,
      required this.hintTxt,
      required this.textEditingController,
      required this.textInputType,
      required this.isHasNextFocus,
      this.type,
      this.suffixIcon,
      this.pass,
      this.focusNode,
      this.formKey})
      : super(key: key);

  @override
  State<TxtFieldWidget> createState() => _TxtFieldWidgetState();
}

String? sterngth = "";

class _TxtFieldWidgetState extends State<TxtFieldWidget> {
  bool obscure = true;
  bool edited = false;
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        TextFormField(
          onChanged: (vlaue) {
            setState(() {
              edited = true;
            });
          },
          controller: widget.textEditingController,
          keyboardType: widget.textInputType,
          obscureText: (widget.hintTxt == "Password" ||
                  widget.hintTxt == "Confirm Password")
              ? obscure
              : false,
          textInputAction: (widget.isHasNextFocus == true)
              ? TextInputAction.next
              : TextInputAction.done,
          enableInteractiveSelection: true,
          focusNode: focusNode,
          onFieldSubmitted: (_) {
            if (widget.hintTxt == "Password" ||
                widget.hintTxt == "Confirm Password") {
              focusNode.nextFocus();
            } else {
              FocusScope.of(context).requestFocus(widget.focusNode);
            }
          },
          obscuringCharacter: "*",
          maxLength: (widget.hintTxt == " " &&
                  widget.textInputType != TextInputType.number)
              ? 30
              : 1000,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            counterText: "",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Constants.primaryAppColor, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Constants.primaryAppColor, width: 0.7)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Constants.primaryAppColor, width: 0.7)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Constants.primaryAppColor, width: 0.7)),
            suffixIcon: (widget.hintTxt == "Password" ||
                    widget.hintTxt == "Confirm Password")
                ? InkWell(
                    onTap: () {
                      onPressEye();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
                          child: !obscure
                              ? Icon(
                                  CupertinoIcons.eye,
                                  color: Colors.grey.withOpacity(0.7),
                                  size: 25,
                                )
                              : Icon(
                                  CupertinoIcons.eye_slash,
                                  color: Colors.grey.withOpacity(0.7),
                                  size: 25.0,
                                ),
                        ),
                      ],
                    ))
                : widget.suffixIcon,
            hintText: widget.hintTxt,
            hintStyle: TextStyle(
                fontSize: 12.5, color: Constants.HINT.withOpacity(0.5)),
          ),
          validator: (String? value) {
            if (widget.hintTxt == "Email Address") {
              String? validationString =
                  Validations.validateEmail(value!, context);
              return validationString;
            } else if (widget.hintTxt == "Password") {
              String? validationString =
                  Validations.validatePassword(value!, context);
              return validationString;
            } else if (widget.hintTxt == "Password Confirmation") {
              String? validationString = Validations.validateconPassword(
                  widget.pass!, context, value!);
              return validationString;
            } else {
              String? validationString =
                  Validations.validateField(value!, context);
              return validationString;
            }
          },
        ),
        SizedBox(height: size.height * 0.015),
        widget.type == "signup"
            ? Visibility(
                visible: edited,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        width: widget.textEditingController.text
                                    .toString()
                                    .length <
                                6
                            ? 50
                            : widget.textEditingController.text
                                        .toString()
                                        .length <
                                    8
                                ? 70
                                : 100,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: widget.textEditingController.text
                                  .toString()
                                  .isEmpty
                              ? Colors.white
                              : widget.textEditingController.text
                                          .toString()
                                          .length <
                                      6
                                  ? const Color(0xffe44544)
                                  : widget.textEditingController.text
                                              .toString()
                                              .length <
                                          8
                                      ? const Color(0xffEB8115)
                                      : const Color(0xff80AF50),
                        ),
                      ),
                      SizedBox(
                        width:
                            widget.textEditingController.text.toString().isEmpty
                                ? 0
                                : widget.textEditingController.text
                                            .toString()
                                            .length <
                                        6
                                    ? 50
                                    : widget.textEditingController.text
                                                .toString()
                                                .length <
                                            8
                                        ? 70
                                        : 100,
                        child: Center(
                            child: Text(
                          widget.textEditingController.text.toString().isEmpty
                              ? ""
                              : widget.textEditingController.text
                                          .toString()
                                          .length <
                                      6
                                  ? "weak"
                                  : widget.textEditingController.text
                                              .toString()
                                              .length <
                                          8
                                      ? "meduim"
                                      : "strong",
                          style:
                              TextStyle(color: Constants.HINT.withOpacity(0.5)),
                        )),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  onPressEye() {
    setState(() {
      obscure = !obscure;
    });
  }
}
