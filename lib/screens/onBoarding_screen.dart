import 'package:chatapp/screens/login/login_screen.dart';
import 'package:chatapp/shared/componets/consts/colors.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:chatapp/shared/componets/images.dart';
import 'package:chatapp/shared/componets/widgets/default_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  static String id = 'OnBoardingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(onBoardingImage),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(40.0),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      landingText1,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      landingText2,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    defaultButton(
                      function: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      text: landingButtonText,
                      backgroundColor: primaryColor,
                      isUpperCase: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
