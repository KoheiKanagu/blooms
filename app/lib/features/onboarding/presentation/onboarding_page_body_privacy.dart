import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class OnboardingPageBodyPrivacy extends StatelessWidget {
  const OnboardingPageBodyPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OnboardingHeader(
          title: i18n.onboarding.privacy.title,
          subtitle: i18n.onboarding.privacy.subtitle,
          child: const _Icon(),
        ),
        OnboardingBody(
          descriptions: [
            Text(i18n.onboarding.privacy.description1),
            Text(i18n.onboarding.privacy.description2),
            if (!kIsWeb)
              Semantics(
                link: true,
                child: Text.rich(
                  i18n.onboarding.privacy.description3(
                    appLock:
                        (text) => TextSpan(
                          text: text,
                          style: CupertinoTheme.of(
                            context,
                          ).textTheme.textStyle.copyWith(
                            color: CupertinoColors.activeBlue.resolveFrom(
                              context,
                            ),
                            fontSize: 14,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(MyUrl.iphoneAppLock);
                                },
                        ),
                  ),
                ),
              ),
          ],
          disclaimers: const [],
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 128,
        height: 128,
        decoration: MyDecoration.dropShadow(context).copyWith(
          color: CupertinoColors.secondarySystemBackground.resolveFrom(context),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: FittedBox(
          child: Icon(
            CupertinoIcons.lock_shield_fill,
            color: CupertinoColors.activeBlue.resolveFrom(context),
          ),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'privacy', type: OnboardingPage)
Widget onboardingPageBodyPrivacy(BuildContext context) {
  return const CupertinoPageScaffold(
    child: SafeArea(child: OnboardingPageBodyPrivacy()),
  );
}
