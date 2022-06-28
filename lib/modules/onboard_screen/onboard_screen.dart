import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/models/boarding_model/boarding.dart';
import 'package:project/modules/login_screen/login_screen.dart';
import 'package:project/modules/register_screen/register_screen.dart';
import 'package:project/shared/components/navigation/navigation.dart';
import 'package:project/shared/components/widgets/button.dart';
import 'package:project/shared/components/widgets/custom_text.dart';
import 'package:project/shared/constants/strings.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardScreen extends StatefulWidget {
   OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
   var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(semiTitle: firstText, title: firstTitle, image: onBoardFirst),
    BoardingModel(semiTitle: secondText, title: secondTitle, image: onBoardSecond),
    BoardingModel(semiTitle: firstText, title: firstTitle, image: onBoardThird),
  ];

  bool isLast = false ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,


          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25 , top: 10),
              child: GestureDetector(
                onTap: (){
                  navigationTo(context, LoginScreen());

                },
                child: Container(
                    width:70 ,
                    height:40 ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: yelloColor
                    ),
                    child: Center(child: TextUtils(text: 'Skip', fontSize: 15, fontWeight: FontWeight.bold, color: darkClr))),
              ),
            ),
          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(


            children: [

              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder:(context , index) =>onBoardItem(boarding[index]),
                itemCount: boarding.length,
                  onPageChanged: (int index){
                    if(index == boarding.length -1){

                      setState((){
                        isLast = true;
                      });
                    }else{
                      setState((){

                        isLast = false;
                      });

                    }

                  },

                ),
              ),

              Center(
                child: SmoothPageIndicator(
                  controller: boardController,
                    count:boarding.length ,
                  effect: ExpandingDotsEffect(

                    dotColor:offwhiteColor ,
                    activeDotColor: dotsoColor,
                    dotHeight: 7,
                    dotWidth: 7,
                    expansionFactor: 4,
                    spacing: 6
                  ),

                ),
              ),
              const SizedBox(height: 30,),
              CustomButton(text: 'Get Started',
                fontSize: 15,
                onPressed: () {
                if(isLast){
                  navigationTo(context, LoginScreen());
                }else{
                  boardController.nextPage(duration: const Duration(
                    milliseconds: 600,
                  ), curve: Curves.easeOut);
                }

                },
                buttonColor: buttonColor, textColor: whiteColor,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(text: 'Don\'t have an account ?', fontSize: 15, fontWeight: FontWeight.bold, color: darkClr),
                  TextButton(onPressed:(){
                    navigationTo(context, RegisterScreen());

                  } , child: TextUtils(text: 'Sign Up', fontSize: 15, fontWeight: FontWeight.bold, color: tealSignUp))
                ],
              ),


            ],
          ),
        ) ,

      ),
    );
  }

  Widget onBoardItem(BoardingModel model)=>
      Column(

crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: SvgPicture.asset(
          '${model.image}' , width: 300 , height: 300,
        ),
      ),

      const SizedBox(height: 5,),
      TextUtils(text: '${model.title}', fontSize: 24, fontWeight: FontWeight.bold, color: darkClr , align: TextAlign.center,),

      const SizedBox(height: 5,),
      TextUtils(text: '${model.semiTitle}', fontSize: 16, fontWeight: FontWeight.normal, color: greyColor , align: TextAlign.center),




    ],
  );
}
