import 'package:animated_slide_bar_app/const.dart';
import 'package:animated_slide_bar_app/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late SMIBool searchTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('HomeView'),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: RiveAnimation.asset(
                "assets/RiveAssets/icons.riv",
                artboard: "HOME",
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtiltys.getRiveController(artboard,
                          stateMachineName: "SEARCH_Interactivity");

                  searchTrigger = controller.findSMI("active") as SMIBool;
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
