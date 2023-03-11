import 'dart:async';
import 'package:akhbarak_el_youm/Core/components/navigator.dart';
import 'package:akhbarak_el_youm/View/HomeScreen/home_screen.dart';
import 'package:akhbarak_el_youm/generated/assets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash-Screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), ()
    {
      navigateAndFinish(context, routeName: HomeScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            Assets.imagesPattern,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLogo,fit: BoxFit.contain,),
                DefaultTextStyle(
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Akhbarak El Youm'),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    isRepeatingAnimation: true,
                    onTap: () {
                      if (kDebugMode) {
                        print("Tap Event");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
