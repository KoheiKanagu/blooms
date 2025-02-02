import 'package:flutter/cupertino.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    required this.descriptions,
    super.key,
  });

  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: descriptions
          .map(
            (e) => Text(
              e,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          )
          .toList(),
    );
  }
}
