import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../widgets/widgets.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController bNameC = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final TextEditingController emailC = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passC = TextEditingController();
  final FocusNode passFocus = FocusNode();
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBar(context: context, title: "", isLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              cursorHeight: 18,
              controller: bNameC,
              focusNode: nameFocusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(height: 2, color: Colors.black),
              validator: (value) {
                if (value!.isNotEmpty) {
                  return "Please enter your name";
                }
              },
              decoration: InputDecoration(
                isDense: false,
                fillColor: Colors.white,
                hintText: "Enter Your Name*",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              ),
              onChanged: (value) {
                print('onchanges......$value');
              },
              onFieldSubmitted: (value) {
                emailFocusNode.requestFocus();
              },
            ),
            TextFormField(
              onChanged: (value) {},
              onFieldSubmitted: (value) {
                print("priting onFieldSubmitted.......");
              },
              onTap: () {
                emailFocusNode.requestFocus();
              },
              focusNode: emailFocusNode,
              autofocus: false,
              cursorOpacityAnimates: true,
              cursorErrorColor: Colors.red,
              controller: emailC,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(height: 2, color: Colors.black),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (emailFocusNode.hasFocus) {
                  if (value!.isNotEmpty) {
                    if (!value.isEmail) {
                      return "Please enter valid email";
                    }
                  } else {
                    return null;
                  }
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Enter Email",
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Widgets.passwordTextFeild(
              context: context,
              passC: passC,
              cPassC: passC,
              isLogin: true,
              isPassField: true,
              label: "Password",
              iconColor: Colors.black,
              // ref.watch(themeProvider).isDarkMode ? btnClr : Colors.black,
              obscureTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              onChanged: (p0) {
                // ref.read(loginPwdProvider.notifier).state = p0;
              },
              focusNode: passFocus,
              isObscure: isObscure,
            ),
            Widgets.elevatedBtn(
              context: context,
              title: "Register",
              size: MediaQuery.of(context).size,
              color: Colors.blue,
              isLoading: false,
              onTap: () {
                // Handle registration logic here
              },
              btnDisable: false,
            ),
          ],
        ),
      ),
    );
  }
}
