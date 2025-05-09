import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:blooms/widgets/blooms_logo.dart';
import 'package:flutter/material.dart';

class OnboardingAppIcon extends StatelessWidget {
  const OnboardingAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: MyDecoration.dropShadow(context).copyWith(
          color: myColorGreen2.resolveFrom(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const BloomsLogo(dimension: 96),
      ),
    );
  }
}
