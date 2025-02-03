import 'package:blooms/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BloomsLogo extends StatelessWidget {
  const BloomsLogo({
    required this.dimension,
    super.key,
  });

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return switch (MediaQuery.platformBrightnessOf(context)) {
      Brightness.dark => Assets.bloomsDark.image(
          width: dimension,
          height: dimension,
        ),
      Brightness.light => Assets.blooms.image(
          width: dimension,
          height: dimension,
        )
    };
  }
}
