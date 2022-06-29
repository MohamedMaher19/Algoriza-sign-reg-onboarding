import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/register_screen/register_screen.dart';
import 'package:project/shared/components/navigation/navigation.dart';
import 'package:project/shared/components/widgets/custom_text.dart';
import 'package:project/shared/components/widgets/google_sign_button.dart';
import 'package:project/shared/components/widgets/sign_register_button.dart';
import 'package:project/shared/components/widgets/text_form_field.dart';
import 'package:project/shared/constants/reg_experesion.dart';
import 'package:project/shared/constants/strings.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        body:SingleChildScrollView(
          child: Column(
            children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            topImage ,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                    // child: Image.asset(topImage , fit: BoxFit.fill,),
                  ),


              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(text: 'Welcome To Fashion Daily', fontSize: 15, fontWeight: FontWeight.normal, color: greyColor),
                      Row(

                        children: [
                          TextUtils(text: 'Sign In', fontSize: 27, fontWeight: FontWeight.bold, color: blackColor),
                          const Spacer(),
                          TextButton(onPressed: (){}, child: TextUtils(text: 'Help', fontSize: 17, fontWeight: FontWeight.normal, color: blueColor)),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: blueColor
                            ),
                            child: Icon(Icons.question_mark , color:whiteColor, size: 14,),
                          ),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      TextUtils(text: 'Phone Number', fontSize: 18, fontWeight: FontWeight.normal, color: blackColor),
                      const SizedBox(height: 10,),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical:5),
                        decoration: BoxDecoration(
                            color: greywithOpic,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                            )

                        ),
                        child: Stack(
                          children: [
                            InternationalPhoneNumberInput(

                              onInputChanged: (value){} ,
                              validator: (value){
                                if (!RegExp(validPhoneNumber).hasMatch(value!)) {
                                  return 'Enter valid Phone Number';
                                } else {
                                  return null;
                                }
                              },
                              textFieldController: phoneController,
                              formatInput: false,
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              cursorColor: Colors.black,
                              inputDecoration: const InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 15 , left: 0),
                                border: InputBorder.none,
                                hintText: 'Eg.01062825897',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ) ,
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
                      const SizedBox(height: 20,),
                      SignRegisterButton(fontSize:15, textColor: whiteColor, buttonColor: blueColor, text: 'Sign In',
                        onPressed: () {
                        if(formKey.currentState!.validate()){
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Sucsess',
                            desc: 'Sucessfully Loged In',
                            btnCancelOnPress: () {
                            },
                            btnOkOnPress: () {

                            },
                          ).show();

                        }


                        }  ,),
                      const SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            width: 130,
                            color: greyColor.withOpacity(0.4),
                          ),
                          TextUtils(text: 'OR', fontSize: 15, fontWeight: FontWeight.normal, color: greyColor),
                          Container(
                            height: 1,
                            width: 130,
                            color: greyColor.withOpacity(0.4),
                          ),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      GoogleRegisterButton(text: 'Sign With by google', fontSize: 13, textColor: blueColor, buttonColor: whiteColor, onPressed: (){},),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(text: 'Dosn\'t has any account ?', fontSize: 15, fontWeight: FontWeight.normal, color: darkClr),
                          TextButton(onPressed:(){
                            navigationTo(context, RegisterScreen());

                          } , child: TextUtils(text: 'Register here', fontSize: 15, fontWeight: FontWeight.bold, color: blueColor))
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              TextUtils(text: 'Use the application according to policy rules , Any ', fontSize: 13, fontWeight: FontWeight.normal, color: greyColor , align: TextAlign.center,),
              TextUtils(text: 'kinds of violations will be subject to sanction', fontSize: 13, fontWeight: FontWeight.normal, color: greyColor , align: TextAlign.center),
              const SizedBox(height: 20,)

            ],
          ),
        )
    );
  }
}
