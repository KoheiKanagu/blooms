import 'package:flutter/cupertino.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    required this.descriptions,
    super.key,
  });

  final List<Text> descriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: descriptions,
        ),
      ),
    );
  }
}
