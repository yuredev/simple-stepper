// ignore_for_file: prefer_const_constructors

library simple_stepper;

import 'package:flutter/material.dart';

class SimpleStepper extends StatelessWidget {
  final Color color;
  final int step;
  final int? stepsCount;
  final double width;
  final double iconSize;

  const SimpleStepper({
    Key? key,
    required this.step,
    required this.width,
    required this.color,
    this.stepsCount,
    this.iconSize = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pointIcon = Container(
      height: 27,
      width: 27,
      alignment: Alignment.center,
      child: SizedBox(
        height: iconSize,
        width: iconSize,
        child: FittedBox(
          child: const Icon(Icons.circle, color: Colors.white),
        ),
      ),
    );

    return SizedBox(
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
            height: 4,
            margin: EdgeInsets.symmetric(
              horizontal: iconSize * 0.9,
            ),
          ),
          Row(
            children: List.generate(stepsCount ?? 3, (i) {
              return i == step - 1
                  ? _CurrentStepIndicator(
                      step: step,
                      color: color,
                    )
                  : pointIcon;
            }).expand((e) => [e, Spacer()]).toList()
              ..removeLast(),
          ),
        ],
      ),
    );
  }
}

class _CurrentStepIndicator extends StatelessWidget {
  final int step;
  final Color color;

  const _CurrentStepIndicator({
    Key? key,
    required this.step,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 27,
      height: 27,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, //New
            blurRadius: 25.0,
            offset: Offset(0, -10),
          )
        ],
      ),
      child: Text(
        step.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
