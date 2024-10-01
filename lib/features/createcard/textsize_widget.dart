import 'package:flutter/material.dart';
import '../../core/utils/window.dart';

class TextSizes {
  static double small(BuildContext context) => Window.getFontSize(14); // Small text size
  static double medium(BuildContext context) => Window.getFontSize(18); // Medium text size
  static double large(BuildContext context) => Window.getFontSize(24); // Large text size
  static double extraLarge(BuildContext context) => Window.getFontSize(30); // Extra large text size
}
