/// ProgressIndicator: Reusable progress bar for onboarding
library;
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({required this.value, super.key});
  final double value;

  @override
  Widget build(BuildContext context) => LinearProgressIndicator(value: value);
}
