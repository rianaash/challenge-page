import 'package:flutter/material.dart';

class AppRadius {
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double circular = 100.0; // Untuk rounded full (pill shape)

  static final BorderRadius borderRadiusS = BorderRadius.circular(s);
  static final BorderRadius borderRadiusM = BorderRadius.circular(m);
  static final BorderRadius borderRadiusL = BorderRadius.circular(l);
  static final BorderRadius borderRadiusCircular = BorderRadius.circular(circular);
}