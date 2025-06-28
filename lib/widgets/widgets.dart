import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

import '../constant/colors.dart';
import '../utils/utils.dart';

class Widgets {
  static AppBar appBar({
    required BuildContext context,
    required String title,
    required bool isLeading,
    bool isTitle = true,
    Color? color,
  }) {
    return AppBar(
      leading: isLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,

      title: isTitle
          ? Text(
              title,
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          : null,
      centerTitle: true,
      // surfaceTintColor: bgColor,
      automaticallyImplyLeading: false,
      backgroundColor: color,
    );
  }

  static Widget passwordTextFeild(
      {required BuildContext context,
      required TextEditingController passC,
      required TextEditingController cPassC,
      required String label,
      required Function obscureTap,
      required bool isObscure,
      required Function(String)? onChanged,
      required bool isLogin,
      required bool isPassField,
      bool isPassValidate = true,
      Color? iconColor,
      Color? fillColor,
      required FocusNode focusNode}) {
    return TextFormField(
      cursorColor: Colors.grey,
      controller: isPassField ? passC : cPassC,
      focusNode: focusNode,
      autofocus: false,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(height: 2),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      obscureText: isObscure,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      // obscureText: isObscureText,
      onChanged: (value) {
        onChanged!(value);
      },

      validator: (value) {
        if (isLogin) {
          if (focusNode.hasFocus) {
            if (passC.text.isEmpty) {
              return "Please enter password";
            } else {
              return null;
            }
          } else {
            return null;
          }
        } else {
          if (focusNode.hasFocus) {
            if (isPassValidate) {
              return Utils.passValidation(
                  value: value,
                  label: label,
                  cPassC: cPassC,
                  isPassField: isPassField,
                  passC: passC);
            } else {
              return null;
            }
          } else if (!focusNode.hasFocus &&
              (isPassField ? passC.text.isNotEmpty : cPassC.text.isNotEmpty)) {
            return Utils.passValidation(
                value: value,
                label: label,
                cPassC: cPassC,
                isPassField: isPassField,
                passC: passC);
          } else {
            return null;
          }
        }
      },
      cursorOpacityAnimates: true,
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        fillColor: fillColor,
        hintText: "$label*",
        hintStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.grey),
        suffixIcon: IconButton(
            onPressed: () {
              obscureTap();
            },
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: iconColor ?? Colors.grey,
              size: 20,
            )),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Icon(
            Icons.lock,
            color: iconColor ?? Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }

  static Widget elevatedBtn(
      {required BuildContext context,
      required String title,
      required Size size,
      Color? color,
      required bool isLoading,
      required Function onTap,
      double? height,
      required bool btnDisable}) {
    return SizedBox(
      height: height ?? size.height * 0.06,
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? btnClr,
        ),
        onPressed: btnDisable
            ? null
            : () {
                onTap();
              },
        child: isLoading
            ? JumpingDots(
                color: Colors.white,
                verticalOffset: -8,
                radius: 5,
              )
            : FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
      ),
    );
  }
}
