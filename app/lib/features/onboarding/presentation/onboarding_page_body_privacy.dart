import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_body.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_header.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/theme/my_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingPageBodyPrivacy extends StatelessWidget {
  const OnboardingPageBodyPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      children: [
        OnboardingHeader(
          title: i18n.onboarding.privacy,
          subtitle: i18n.onboarding.privacySubtitle,
          child: const _Icon(),
        ),
        const OnboardingBody(
          descriptions: [
            'ソーシャルアカウントやメールアドレスなど、個人を特定できる情報は必要ありません。',
            'BLOOMS独自のIDを発行して、あなたの記録を安全に保管します。',
          ],
        ),
        if (kIsWeb) ...[
          const Gap(16),
          Text.rich(
            TextSpan(
              style: CupertinoTheme.of(context).textTheme.textStyle,
              children: [
                TextSpan(
                  text: 'アプリをロック',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                        color: CupertinoColors.activeBlue.resolveFrom(context),
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(MyUrl.iphoneAppLock);
                    },
                ),
                const TextSpan(
                  text: 'すれば、アプリを開けるのはあなただけ。',
                ),
              ],
            ),
          ),
        ],
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
