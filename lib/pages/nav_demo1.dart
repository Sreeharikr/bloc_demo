import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController controllerScale;
  late AnimationController controllerFade;
  late AnimationController controllerTranslate;
  late AnimationController controllerRotate;

  late Animation<double> animationScale;
  late Animation<double> animationFade;
  late Animation<double> animationRotate;

  late Animation<double> animationTranslate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image.asset(
            //   "assets/paddle_logo.png",
            //   height: 70,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(animationTranslate.value, 0),
                      child: ScaleTransition(
                        scale: animationScale,
                        child: RotationTransition(
                          turns: animationRotate,
                          child: Image.asset(
                            "assets/icon_flutter.png",
                            height: 70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FadeTransition(
                  opacity: animationFade,
                  child: Image.asset(
                    "assets/flutter.png",
                    height: 70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllerScale.dispose();
    controllerFade.dispose();
    controllerRotate.dispose();
    controllerTranslate.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controllerScale = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    controllerFade =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controllerTranslate = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    controllerRotate = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationScale =
        CurvedAnimation(parent: controllerScale, curve: Curves.easeOut)
          ..addListener(() {
            setState(() {
              if (animationScale.status == AnimationStatus.completed) {
                controllerTranslate.forward();
              }
            });
          });
    animationFade = Tween<double>(begin: 0, end: 1).animate(controllerFade)
      ..addListener(() {
        setState(() {
          if (controllerFade.isCompleted) {
            startAnimation();
          }
        });
      });
    animationTranslate =
        Tween<double>(begin: 55, end: 0).animate(controllerTranslate)
          ..addListener(() {
            setState(() {
              if (controllerTranslate.isCompleted) {
                controllerFade.forward();
              }
            });
          });
    animationRotate = CurvedAnimation(
      parent: controllerRotate,
      curve: Curves.easeIn,
    );

    controllerScale.forward();
    controllerRotate.forward();
    super.initState();
  }

  void startAnimation() {
    controllerScale.reset();
    controllerFade.reset();
    controllerTranslate.reset();
    controllerRotate.reset();
    controllerScale.forward();
    controllerRotate.forward();
  }
}
