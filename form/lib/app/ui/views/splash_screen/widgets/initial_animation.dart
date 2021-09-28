import "package:flutter/material.dart";
import 'package:form/app/theme/colors/colors.dart';
import 'dart:math';

class InitialAnimation extends StatefulWidget {
  final double radius, dotRadius;
  // ignore: use_key_in_widget_constructors
  const InitialAnimation({this.radius = 30.0, this.dotRadius = 3.0});

  @override
  _InitialAnimationState createState() => _InitialAnimationState();
}

class _InitialAnimationState extends State<InitialAnimation>
    with SingleTickerProviderStateMixin {
  // -----------------------------VARIABLES-------------------------------------//
  late Animation<double> _animationRotation,
      _animationRadiusIn,
      _animationRadiusOut;
  late AnimationController controller;
  late double radius, dotRadius;
  // -----------------------------VARIABLES-------------------------------------//

  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    _animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    _animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * _animationRadiusIn.value;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = widget.radius * _animationRadiusOut.value;
        }
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: RotationTransition(
            turns: _animationRotation,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0.0, 0.0),
                  child: Dot(radius: radius, color: ColorsApp.primaryColor),
                ),
                Transform.translate(
                  child: Dot(
                      radius: dotRadius, color: ColorsApp.secondaryPromoColor),
                  offset: Offset(
                    radius * cos(0.0),
                    radius * sin(0.0),
                  ),
                ),
                Transform.translate(
                  child: Dot(
                    radius: dotRadius,
                    color: ColorsApp.primaryColor,
                  ),
                  offset: Offset(
                    radius * cos(0.0 + 1 * pi / 4),
                    radius * sin(0.0 + 1 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(
                      radius: dotRadius, color: ColorsApp.secondaryPromoColor),
                  offset: Offset(
                    radius * cos(0.0 + 2 * pi / 4),
                    radius * sin(0.0 + 2 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(radius: dotRadius, color: ColorsApp.primaryColor),
                  offset: Offset(
                    radius * cos(0.0 + 3 * pi / 4),
                    radius * sin(0.0 + 3 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(
                    radius: dotRadius,
                    color: ColorsApp.secondaryPromoColor,
                  ),
                  offset: Offset(
                    radius * cos(0.0 + 4 * pi / 4),
                    radius * sin(0.0 + 4 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(radius: dotRadius, color: ColorsApp.primaryColor),
                  offset: Offset(
                    radius * cos(0.0 + 5 * pi / 4),
                    radius * sin(0.0 + 5 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(
                      radius: dotRadius, color: ColorsApp.secondaryPromoColor),
                  offset: Offset(
                    radius * cos(0.0 + 6 * pi / 4),
                    radius * sin(0.0 + 6 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(radius: dotRadius, color: ColorsApp.primaryColor),
                  offset: Offset(
                    radius * cos(0.0 + 7 * pi / 4),
                    radius * sin(0.0 + 7 * pi / 4),
                  ),
                ),
                Transform.translate(
                  child: Dot(
                      radius: dotRadius, color: ColorsApp.secondaryPromoColor),
                  offset: Offset(
                    radius * cos(0.0 + 8 * pi / 4),
                    radius * sin(0.0 + 8 * pi / 4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const Dot({required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
