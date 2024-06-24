import 'package:get/get.dart';
import 'package:flutter/animation.dart';

class SplashController extends GetxController with  GetSingleTickerProviderStateMixin {
  var currentStep = 0.obs;
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    animationController.forward();
    await Future.delayed(Duration(seconds: 1));
    currentStep.value = 1;
    animationController.reset();
    animationController.forward();
    await Future.delayed(Duration(seconds: 1));
    currentStep.value = 2;
    animationController.reset();
    animationController.forward();
    await Future.delayed(Duration(seconds: 1));
    currentStep.value = 3;
    // Navigate to the next screen
    Get.offNamed('/home');
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
