import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../widget/app_color_theme.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColorTheme.primaryDark,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 140),
                FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Image.asset(
                        'assets/illustration/onboarding_illustration.png')),
                const SizedBox(height: 30),
                FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      'Escape the ordinary life',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColorTheme.primaryLight),
                    )),
                const SizedBox(height: 10),
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    'Discover great experiences around you and make you live interesting!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColorTheme.primaryLight,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 800),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                                onPressed: () => {},
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: AppColorTheme.secondaryDark,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () => {},
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: AppColorTheme.secondaryDark)),
                                color: AppColorTheme.primaryDark,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Login',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white))
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
