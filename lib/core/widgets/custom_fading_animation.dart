import 'package:flutter/material.dart';

class CustomFadingAnimation extends StatefulWidget {
  const CustomFadingAnimation({super.key, required this.child});

  final Widget child;
  @override
  State<CustomFadingAnimation> createState() => _CustomFadingAnimationState();
}

class _CustomFadingAnimationState extends State<CustomFadingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
