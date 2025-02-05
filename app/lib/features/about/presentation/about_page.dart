import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/about/application/about_provider.dart';
import 'package:blooms/features/authentication/application/firebase_user_providers.dart';
import 'package:blooms/features/onboarding/application/onboarding_page_route.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_page.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:blooms/widgets/blooms_logo.dart';
import 'package:blooms/widgets/show_my_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends HookConsumerWidget {
  const AboutPage({
    super.key,
  });

  static const path = '/about';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        middle: Text(i18n.aboutBLOOMS.aboutBLOOMS),
        automaticallyImplyLeading: false,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            MaterialLocalizations.of(context).closeButtonLabel,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: ListView(
        children: [
          const OnboardingAppIcon(),
          const Gap(4),
          Text(
            i18n.aboutBLOOMS.version(
              version: ref.watch(packageInfoVersionProvider),
            ),
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 14,
                ),
            textAlign: TextAlign.center,
          ),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.whatIsBLOOMS),
                leading: const BloomsLogo(dimension: 48),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (_) => const OnboardingPage(
                        enableLetsStartPage: false,
                      ),
                      settings: const RouteSettings(
                        name: OnboardingPageRoute.path,
                      ),
                    ),
                  );
                },
              ),
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.yourId),
                leading: Icon(
                  CupertinoIcons.person_fill,
                  color: CupertinoColors.systemCyan.resolveFrom(context),
                ),
                subtitle: Text(
                  ref.watch(firebaseUserUidProvider).valueOrNull ?? '',
                ),
                onTap: () async {
                  final uid =
                      ref.read(firebaseUserUidProvider).valueOrNull ?? '';

                  final result = await showModalActionSheet<String>(
                    context: context,
                    title: '${i18n.aboutBLOOMS.yourId}\n$uid',
                    message: i18n.aboutBLOOMS.yourIdDescription,
                    style: AdaptiveStyle.iOS,
                    actions: [
                      SheetAction(
                        key: 'copy',
                        label:
                            CupertinoLocalizations.of(context).copyButtonLabel,
                      ),
                    ],
                  );

                  if (result == 'copy') {
                    await Clipboard.setData(
                      ClipboardData(
                        text: uid,
                      ),
                    );
                    await HapticFeedback.heavyImpact();
                  }
                },
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.openSource),
                subtitle: Text(
                  i18n.aboutBLOOMS.openSourceDescription,
                  maxLines: 10,
                ),
                leading: Icon(
                  CupertinoIcons.square_stack_3d_up_fill,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  launchUrl(MyUrl.github);
                },
              ),
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.inquiry),
                leading: Icon(
                  CupertinoIcons.mail_solid,
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () async {
                  final url = await ref.read(inquiryUriProvider.future);
                  await launchUrl(url);
                },
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.termsOfService),
                leading: Icon(
                  CupertinoIcons.book_fill,
                  color: CupertinoColors.systemBrown.resolveFrom(context),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  launchUrl(MyUrl.termsOfService);
                },
              ),
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.privacyPolicy),
                leading: Icon(
                  CupertinoIcons.lock_fill,
                  color: CupertinoColors.systemOrange.resolveFrom(context),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  launchUrl(MyUrl.privacyPolicy);
                },
              ),
              CupertinoListTile.notched(
                title: Text(i18n.aboutBLOOMS.licenseInformation),
                leading: Icon(
                  CupertinoIcons.info_circle_fill,
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  // TODO: cupertino style license page
                  showLicensePage(context: context);
                },
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: Text(
                  i18n.aboutBLOOMS.deleteAllData,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                        color: CupertinoColors.systemRed.resolveFrom(context),
                      ),
                ),
                leading: Icon(
                  CupertinoIcons.trash_fill,
                  color: CupertinoColors.systemRed.resolveFrom(context),
                ),
                onTap: () {
                  showDeleteAllDataDialog(context, ref);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> showDeleteAllDataDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final result = await showConfirmationDialog(
      context: context,
      title: i18n.deleteAll.title,
      message: i18n.deleteAll.message,
      routeSettings: const RouteSettings(
        name: 'deleteAllConfirmationDialog',
      ),
      actions: [
        AlertDialogAction(
          key: 'delete',
          label: i18n.deleteAll.delete,
          isDestructiveAction: true,
        ),
      ],
      style: AdaptiveStyle.iOS,
    );

    if (result == 'delete') {
      if (context.mounted) {
        final indicator = showMyProgressIndicator(context);

        final reference =
            await ref.read(userProvider.future).then((e) => e?.reference);
        if (reference != null) {
          await ref.read(userDeleteProvider(reference: reference).future);
        }

        indicator.dismiss();

        if (context.mounted) {
          Navigator.of(context).pop();

          await showOkAlertDialog(
            context: rootContext!,
            routeSettings: const RouteSettings(
              name: 'deleteAllThankYouDialog',
            ),
            title: i18n.thankYouForUsing,
            style: AdaptiveStyle.iOS,
          );
        }
      }
    }
  }
}
