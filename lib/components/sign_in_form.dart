import 'package:animated_slide_bar_app/const.dart';
import 'package:animated_slide_bar_app/screens/home_view.dart';
import 'package:animated_slide_bar_app/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInW extends StatefulWidget {
  const SignInW({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInW> createState() => _SignInWState();
}

class _SignInWState extends State<SignInW> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isShowLoading = false;
            });
            confetti.fire();

            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                isShowConfetti = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
              });
            });
          });
        } else {
          error.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isShowLoading = false;
              isShowConfetti = false;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Zorunlu alan";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                      hintText: "E-Mail",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/icons/email.svg"),
                      )),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Zorunlu alan";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/icons/password.svg"),
                      )),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                    onPressed: () {
                      signIn(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kcfroly,
                        minimumSize: const Size(double.infinity, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    icon: const Icon(CupertinoIcons.arrow_right),
                    label: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ))
              ],
            )),
        isShowLoading
            ? CustomLoadW(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtiltys.getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomLoadW(
                child: Transform.scale(
                scale: 8,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtiltys.getRiveController(artboard);
                    confetti =
                        controller.findSMI("Trigger explosion") as SMITrigger;
                  },
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}

class CustomLoadW extends StatelessWidget {
  const CustomLoadW({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        //margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(60),
        height: size,
        width: size,
        child: child,
      ),
    );
  }
}
