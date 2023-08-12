import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1.5,
    centerTitle: true,
    title: Text(
      "Log in",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    ),
  );
}

// This is the widget of icons for sign  in by Google , E-mail, and other

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 25.h, left: 60.h, right: 60.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 30.w,
      width: 30.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

// This is the widget of icons for sign  in by Google , E-mail, and other

Widget reuseableText(String text) {
  return Container(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.6),
        fontSize: 12.sp,
      ),
    ),
  );
}

// TextField for sign in.....

Widget buildTextField(String hintText, String iconName, String textType) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1,
        )
      ],
    ),
    child: Row(
      children: [
        Image(
          height: 22.h,
          image: AssetImage(
            "assets/icons/$iconName.png",
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextField(
            keyboardType: TextInputType.multiline,
            obscureText: textType == 'password' ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return InkWell(
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {},
    child: Text(
      'Forget Password',
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return Container(
    margin: EdgeInsets.only(top: buttonType == 'login' ? 50 : 20),
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(15.w),
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
          color: Colors.grey.withOpacity(0.1),
        ),
      ],
    ),
    child: Center(
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
