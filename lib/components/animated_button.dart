import 'package:flutter/cupertino.dart';

import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    Key? key,
    required RiveAnimationController btnCont,
    required this.height,
    required this.width,
    required this.onTap,
  })  : _btnCont = btnCont,
        super(key: key);

  final RiveAnimationController _btnCont;
  final double height;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: width * 0.6,
          height: height * 0.08,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnCont],
              ),
              Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.arrow_right),
                    Text(
                      "  Go to the course",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
