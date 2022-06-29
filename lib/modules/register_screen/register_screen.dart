import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/login_screen/login_screen.dart';
import 'package:project/shared/components/navigation/navigation.dart';
import 'package:project/shared/components/widgets/custom_text.dart';
import 'package:project/shared/components/widgets/google_sign_button.dart';
import 'package:project/shared/components/widgets/sign_register_button.dart';
import 'package:project/shared/components/widgets/text_form_field.dart';
import 'package:project/shared/constants/reg_experesion.dart';
import 'package:project/shared/constants/strings.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              topImage,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: whiteColor,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          text: 'Welcome To Fashion Daily',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: greyColor),
                      Row(
                        children: [
                          TextUtils(
                              text: 'Register',
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: blackColor),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: TextUtils(
                                  text: 'Help',
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: blueColor)),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: blueColor),
                            child: Icon(
                              Icons.question_mark,
                              color: whiteColor,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextUtils(
                          text: 'Email',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: blackColor),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: emailController,
                        hintText: 'Eg.example@gmail.com',
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Enter valid email';
                          } else {
                            return null;
                          }
                        },
                        obsecure: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextUtils(
                          text: 'Phone Number',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: blackColor),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: greywithOpic,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Stack(
                          children: [
                            InternationalPhoneNumberInput(
                              onInputChanged: (value) {},
                              validator: (value) {
                                if (!RegExp(validPhoneNumber)
                                    .hasMatch(value!)) {
                                  return 'Enter valid Phone Number';
                                } else {
                                  return null;
                                }
                              },
                              textFieldController: phoneController,
                              formatInput: false,
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              cursorColor: Colors.black,
                              inputDecoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 15, left: 0),
                                border: InputBorder.none,
                                hintText: 'Eg.01062825897',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 70,
                              top: 8,
                              bottom: 8,
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextUtils(
                          text: 'Password',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: blackColor),
                      CustomFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'password is too short';
                          } else {
                            return null;
                          }
                        },
                        obsecure: true,
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SignRegisterButton(
                        fontSize: 15,
                        textColor: whiteColor,
                        buttonColor: blueColor,
                        text: 'Register',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'Sucsess',
                              desc: 'Sucessfully Registerd',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            width: 130,
                            color: greyColor.withOpacity(0.4),
                          ),
                          TextUtils(
                              text: 'OR',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: greyColor),
                          Container(
                            height: 1,
                            width: 130,
                            color: greyColor.withOpacity(0.4),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GoogleRegisterButton(
                        text: 'Sign With by google',
                        fontSize: 13,
                        textColor: blueColor,
                        buttonColor: whiteColor,
                        onPressed: () {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                              text: 'Has any account ?',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: darkClr),
                          TextButton(
                              onPressed: () {
                                navigationTo(context, LoginScreen());
                              },
                              child: TextUtils(
                                  text: 'Sign in here',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              TextUtils(
                text: 'By registerd your account , you are agree to ',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: greyColor,
                align: TextAlign.center,
              ),
              TextUtils(
                  text: 'Terms and Conditions',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: blueColor,
                  align: TextAlign.center),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
