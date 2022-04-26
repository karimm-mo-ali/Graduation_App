import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final FocusNode? focusNode;
  final GlobalKey<FormState>? formKey;

  const TxtFieldWidget(
      {Key? key,
      required this.hintTxt,
      required this.textEditingController,
      required this.textInputType,
      required this.isHasNextFocus,
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
                  widget.hintTxt == "*************" ||
                  widget.hintTxt == '***************')
              ? obscure
              : false,
          textInputAction: (widget.isHasNextFocus == true)
              ? TextInputAction.next
              : TextInputAction.done,
          enableInteractiveSelection: true,
          focusNode: focusNode,
          onFieldSubmitted: ((widget.hintTxt == "Password" ||
                      widget.hintTxt == "*************" ||
                      widget.hintTxt == '***************') &&
                  widget.isHasNextFocus == true)
              ? (_) => focusNode.nextFocus()
              : (_) {
                  FocusScope.of(context).requestFocus(widget.focusNode);
                },
          obscuringCharacter: "*",
          maxLength: (widget.hintTxt == " " &&
                  widget.textInputType != TextInputType.number)
              ? 30
              : 1000,
          maxLines: widget.hintTxt == "Message" ? 4 : 1,
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
                    widget.hintTxt == "*************" ||
                    widget.hintTxt == '***************')
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
                              bottom: 13, right: 10, left: 8),
                          child: !obscure
                              ? SvgPicture.asset("assets/eye.svg",
                                  height: 20.0,
                                  width: 20.0,
                                  fit: BoxFit.scaleDown)
                              : SvgPicture.asset("assets/eyeee.svg",
                                  height: 20.0,
                                  width: 20.0,
                                  fit: BoxFit.scaleDown),
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
            } else if (widget.hintTxt == "Password" ||
                widget.hintTxt == "*************") {
              String? validationString =
                  Validations.validatePassword(value!, context);
              return validationString;
            } else if (widget.hintTxt == "***************") {
              String? validationString = Validations.validateConPassword(
                  value!, context, widget.pass!);
              return validationString;
            } else if (widget.hintTxt == "First Name" ||
                widget.hintTxt == "Last Name") {
              String? validationString =
                  Validations.validateName(value!, context);
              return validationString;
            } else if (widget.hintTxt == "Phone Number") {
              String? validationString =
                  Validations.validatePhone(value!, context);
              return validationString;
            } else {
              String? validationString =
                  Validations.validateField(value!, context);
              return validationString;
            }
          },
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }

  onPressEye() {
    setState(() {
      obscure = !obscure;
    });
  }
}
