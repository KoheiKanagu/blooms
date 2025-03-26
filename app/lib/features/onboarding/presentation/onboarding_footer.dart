import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/authentication/application/auth_providers.dart';
import 'package:blooms/features/disclaimer/presentation/disclaimer_page.dart';
import 'package:blooms/features/onboarding/application/onboarding_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingFooter extends HookConsumerWidget {
  const OnboardingFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const _Terms(),
          const Gap(12),
          FractionallySizedBox(
            widthFactor: 1,
            child: Semantics(
              identifier: 'continueButton',
              label: i18n.kContinue,
              button: true,
              child: CupertinoButton.filled(
                child:
                    progress.value
                        ? CupertinoActivityIndicator(
                          color: CupertinoColors.systemBackground.resolveFrom(
                            context,
                          ),
                        )
                        : Text(
                          i18n.kContinue,
                          style: CupertinoTheme.of(
                            context,
                          ).textTheme.textStyle.copyWith(
                            color: CupertinoColors.systemBackground.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                onPressed: () async {
                  if (progress.value) {
                    return;
                  }

                  // 免責事項について
                  final agree = await showCupertinoModalPopup<bool>(
                    context: context,
                    builder: (context) => const DisclaimerPage(),
                  );
                  if (agree == null || !agree) {
                    return;
                  }

                  progress.value = true;

                  ref.read(onboardingCompleteProvider);
                  await ref.read(authSignInProvider.future);
                },
              ),
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
    return MergeSemantics(
      child: Text.rich(
        style: CupertinoTheme.of(
          context,
        ).textTheme.textStyle.copyWith(fontSize: 14),
        i18n.ackTerm(
          termOfService:
              (text) => TextSpan(
                text: text,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.activeBlue.resolveFrom(context),
                  fontSize: 14,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(MyUrl.termsOfService);
                      },
              ),
          privacyPolicy:
              (text) => TextSpan(
                text: text,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.activeBlue.resolveFrom(context),
                  fontSize: 14,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(MyUrl.privacyPolicy);
                      },
              ),
        ),
      ),
    );
  }
}
