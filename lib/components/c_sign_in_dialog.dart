import 'dart:ui';

import 'package:animated_slide_bar_app/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSignInM(BuildContext context, double height, double width,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    transitionDuration: const Duration(milliseconds: 500),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    pageBuilder: (context, _, __) => Center(
      child: SizedBox(
        height: height * 0.7,
        width: width * 0.9,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.50),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Column(children: [
                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontFamily: "Poppins", color: Colors.black87),
                    ),
                    Text(
                      "Please enter your information to register for the application.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 30),
                    const SignInW(),
                    orSection(context),
                    const Text(
                      "Sign up with Email, Apple or Google",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/email_box.svg",
                                height: 100,
                                width: 100,
                              )),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/apple_box.svg",
                                height: 100,
                                width: 100,
                              )),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/google_box.svg",
                                height: 100,
                                width: 100,
                              )),
                        ],
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cancel,
                              size: 30,
                            ))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ).then(onClosed);
}

Padding orSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
            flex: 2,
            child: Divider(
              thickness: 2,
            )),
        Expanded(
            flex: 1,
            child: Text(
              "OR",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black38),
              textAlign: TextAlign.center,
            )),
        const Expanded(
            flex: 2,
            child: Divider(
              thickness: 2,
            ))
      ],
    ),
  );
}
