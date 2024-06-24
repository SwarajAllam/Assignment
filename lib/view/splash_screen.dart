import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/splash_screen_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Obx(() {
          return AnimatedSwitcher(
            duration: Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              if (controller.currentStep.value == 0) {
                return ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: child,
                );
              } else if (controller.currentStep.value == 2) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/splash2.png', key: ValueKey<int>(2)),
                    SlideTransition(
                      position: controller.slideAnimation,
                      child: const Text(
                        'Fitness',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              }
            },
            child: getStepWidget(controller.currentStep.value),
          );
        }),
      ),
    );
  }

  Widget getStepWidget(int step) {
    switch (step) {
      case 0:
        return Image.asset('assets/splash1.png', key: ValueKey<int>(0));
      case 1:
        return Image.asset('assets/splash2.png', key: ValueKey<int>(1));
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash2.png', key: ValueKey<int>(2)),
          ],
        );
      default:
        return Container();
    }
  }
}
