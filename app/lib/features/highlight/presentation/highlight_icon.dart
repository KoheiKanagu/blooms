import 'package:blooms/theme/my_decoration.dart';
import 'package:blooms/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';

class HighlightIcon extends StatelessWidget {
  const HighlightIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            myColorPink1.resolveFrom(context),
            myColorPink3.resolveFrom(context),
          ],
        ).createShader(bounds),
        child: Icon(
          CupertinoIcons.square_favorites_alt_fill,
          shadows: [
            MyDecoration.dropShadow(context).boxShadow!.first,
          ],
        ),
      ),
    );
  }
}
