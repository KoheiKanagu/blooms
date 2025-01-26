import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingPageBody4 extends StatelessWidget {
  const OnboardingPageBody4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const OnboardingAppIcon(),
          const Gap(32),
          Text(
            'さあ、はじめましょう',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const _Terms(),
          const Gap(12),
          FractionallySizedBox(
            widthFactor: 1,
            child: CupertinoButton.filled(
              child: const Text('続ける'),
              onPressed: () {},
            ),
          ),
          const Gap(32),
        ],
      ),
    );
  }
}

class _Terms extends StatelessWidget {
  const _Terms();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 14,
          ),
      i18n.ackTerm(
        termOfService: (text) => TextSpan(
          text: text,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.activeBlue.resolveFrom(context),
                fontSize: 14,
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(MyUrl.termOfService);
            },
        ),
        privacyPolicy: (text) => TextSpan(
          text: text,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.activeBlue.resolveFrom(context),
                fontSize: 14,
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(MyUrl.privacyPolicy);
            },
        ),
      ),
    );
  }
}
