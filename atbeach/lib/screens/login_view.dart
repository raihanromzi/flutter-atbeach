import 'package:flutter/material.dart';

import '../widget/app_color_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColorTheme.primaryDark,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0XFFE8ECF4), width: 4)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.white, size: 24),
                  onPressed: () => {},
                ),
              ),
              const SizedBox(height: 30),
              const Text('Welcome back! Glad to see you, Again!',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(height: 40),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF7F8F9),
                      hintText: 'Enter you email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      filled: true,
                      fillColor: const Color(0xFFF7F8F9),
                      hintText: 'Enter you password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                    const SizedBox(height: 60),
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
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: AppColorTheme.line)),
                        TextButton(
                          onPressed: () => {},
                          child: const Text('Sign up',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: AppColorTheme.line)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
