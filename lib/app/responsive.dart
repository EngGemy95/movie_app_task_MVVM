import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // We can custom this size also
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 601;
  }

  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 375;
  }

  static bool isMediumMobile(BuildContext context) {
    return MediaQuery.of(context).size.width >= 375 &&
        MediaQuery.of(context).size.width < 601;
  }

  // We can custom this size also
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 601 &&
        MediaQuery.of(context).size.width < 1100;
  }

  // We can custom this size also
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 601) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
