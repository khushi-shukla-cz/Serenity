/// PageContent: Reusable widget for onboarding page content
library;
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  const PageContent({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    );
}
