import 'package:blooms/constants/my_url.dart';
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
        const _Icon(),
        const Gap(32),
        DefaultTextStyle(
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(
                fontSize: 24,
              ),
          child: const Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text('あなたの記録は、'),
              Text('あなた個人と紐付けれらません'),
            ],
          ),
        ),
        const Gap(16),
        Text(
          'ソーシャルアカウントやメールアドレスなど、個人を特定できる情報は不要です。',
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        const Gap(16),
        Text(
          'BLOOMS独自のIDを発行して、あなたの記録を安全に保管します。',
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        if (!kIsWeb) ...[
          const Gap(16),
          Text.rich(
            TextSpan(
              style: CupertinoTheme.of(context).textTheme.textStyle,
              children: [
                const TextSpan(
                  text: 'お使いのiPhone上で何かを人に見せたいが、BLOOMSをその人に見られないようにして安心したい場合は、',
                ),
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
                  text: 'することができます。',
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
