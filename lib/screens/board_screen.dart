import 'dart:ui';
import 'package:animated_slide_bar_app/components/animated_button.dart';
import 'package:animated_slide_bar_app/components/c_sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late RiveAnimationController _btnCont;
  bool openSignIn = false;

  @override
  void initState() {
    _btnCont = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned(
            width: width * 1.8,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        const RiveAnimation.asset("assets/RiveAssets/backgrounds_shapes.riv"),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        )),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          right: openSignIn ? 300 : 0,
          height: height,
          width: width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                const Text(
                  "Learn\nflutter\n& rive",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 60,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: width * 0.7,
                  child: Text(
                    "Learning flutter and rive and being able to put these two powerful tools in one mind is a great achievement.",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                  ),
                ),
                const Spacer(flex: 3),
                AnimatedButton(
                  btnCont: _btnCont,
                  height: height,
                  width: width,
                  onTap: () {
                    _btnCont.isActive = true;
                    Future.delayed(
                      const Duration(milliseconds: 700),
                      () {
                        setState(() {
                          openSignIn = true;
                        });
                        customSignInM(
                          context,
                          height,
                          width,
                          onClosed: (_) {
                            setState(() {
                              openSignIn = false;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                const Spacer(flex: 1)
              ],
            ),
          )),
        )
      ]),
    );
  }
}
