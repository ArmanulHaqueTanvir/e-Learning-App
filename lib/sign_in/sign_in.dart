import 'package:e_learnign_app/sign_in/widgets/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child:
                        reuseableText("Or use your email address to log in")),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reuseableText("E-mail"),
                      const SizedBox(height: 5),
                      buildTextField(
                        "Enter your email address",
                        'user',
                        'email',
                      ),
                      reuseableText("Password"),
                      const SizedBox(height: 5),
                      buildTextField(
                        "Enter your password",
                        'lock',
                        'password',
                      ),
                      forgetPassword(),
                      buildLoginAndRegButton('Log In', 'login'),
                      buildLoginAndRegButton('Register', 'register'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
