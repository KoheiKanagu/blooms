import 'package:blooms/gen/assets.gen.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/material.dart';

class OnboardingAppIcon extends StatelessWidget {
  const OnboardingAppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: MyDecoration.dropShadow(context).copyWith(
          color: myColorGreen2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: switch (MediaQuery.platformBrightnessOf(context)) {
          Brightness.dark => Assets.bloomsDark.image(
              width: 96,
              height: 96,
            ),
          Brightness.light => Assets.blooms.image(
              width: 96,
              height: 96,
            )
        },
      ),
    );
  }
}
