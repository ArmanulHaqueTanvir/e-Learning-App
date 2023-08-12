import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learnign_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learnign_app/pages/welcome/bloc/welcome_events.dart';
import 'package:e_learnign_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return SizedBox(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvents());
                        state.page = index;
                      },
                      children: [
                        _page(
                          1,
                          context,
                          "next",
                          "First see Learning",
                          "Forget about a for of paperall knowledge in on learning",
                          const AssetImage("assets/images/reading.png"),
                        ),
                        _page(
                          2,
                          context,
                          "next",
                          "Connect with Everyone",
                          "Always keep in touch with your tutor & friend. Let's get connected",
                          const AssetImage("assets/images/man.png"),
                        ),
                        _page(
                          3,
                          context,
                          "get started",
                          "Always Fascinated Learning",
                          "Anywhere,anytime,The time is at your discretion so study whenever you want",
                          const AssetImage("assets/images/man.png"),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 50.h,
                      child: DotsIndicator(
                        position: state.page.toDouble(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(15, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, AssetImage imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: double.infinity,
          child: Image(
            image: imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (index < 3) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
                // animation
              } else {
                // animation
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('signIn', (route) => false);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
