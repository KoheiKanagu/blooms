import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:blooms/constants/my_url.dart';
import 'package:blooms/features/onboarding/presentation/onboarding_app_icon.dart';
import 'package:blooms/features/user/application/user_providers.dart';
import 'package:blooms/gen/strings.g.dart';
import 'package:blooms/routing/application/my_go_router.dart';
import 'package:blooms/utils/configure/package_info_providers.dart';
import 'package:blooms/widgets/show_my_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        await ref.read(userDeleteProvider.future);
        indicator.dismiss();

        if (context.mounted) {
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
