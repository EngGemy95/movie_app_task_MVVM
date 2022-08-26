import 'package:flutter/material.dart';

Gradient containerGradient({
  required Color gradient1,
  required Color gradient2,
  required Color gradient3,
  required Color gradient4,
  required Color gradient5,
  required double gradientStops0_1,
  required double gradientStops0_2,
  required double gradientStops0_3,
  required double gradientStops0_4,
  required double gradientStops0_5,
}) {
  return LinearGradient(
    colors: [
      gradient1,
      gradient2,
      gradient3,
      gradient4,
      gradient5,
    ],
    stops: [
      gradientStops0_1,
      gradientStops0_2,
      gradientStops0_3,
      gradientStops0_4,
      gradientStops0_5,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
