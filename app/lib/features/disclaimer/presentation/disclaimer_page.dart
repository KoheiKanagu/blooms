import 'package:blooms/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisclaimerPage extends HookConsumerWidget {
  const DisclaimerPage({super.key});

  static const path = '/disclaimer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final general = [
      i18n.disclaimer.general1,
      i18n.disclaimer.general2,
      i18n.disclaimer.general3,
    ];

    final response = [
      i18n.disclaimer.response1,
      i18n.disclaimer.response2,
      i18n.disclaimer.response3,
      i18n.disclaimer.response4,
      i18n.disclaimer.response5,
      i18n.disclaimer.response6,
      i18n.disclaimer.response7,
    ];

    final searchKeyword = [
      i18n.disclaimer.searchKeyword1,
      i18n.disclaimer.searchKeyword2,
      i18n.disclaimer.searchKeyword3,
    ];

    final agreeGeneral = useState(false);
    final agreeSearchKeyword = useState(false);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
        context,
      ),
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(i18n.disclaimer.title),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            header: Text(i18n.disclaimer.general),
            children:
                general
                    .map(
                      (e) => CupertinoListTile.notched(
                        title: Text(e, maxLines: 10),
                      ),
                    )
                    .toList(),
          ),
          AnimatedOpacity(
            opacity: agreeSearchKeyword.value ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              visible: agreeSearchKeyword.value,
              child: CupertinoListSection.insetGrouped(
                header: Text(i18n.disclaimer.response),
                children:
                    response
                        .map(
                          (e) => CupertinoListTile.notched(
                            title: Text(e, maxLines: 10),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: agreeGeneral.value ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              visible: agreeGeneral.value,
              child: CupertinoListSection.insetGrouped(
                header: Text(i18n.disclaimer.searchKeyword),
                children:
                    searchKeyword
                        .map(
                          (e) => CupertinoListTile.notched(
                            title: Text(e, maxLines: 10),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Semantics(
              button: true,
              identifier: 'understoodButton',
              child: CupertinoButton(
                color: CupertinoColors.systemRed.resolveFrom(context),
                child: Text(
                  i18n.disclaimer.understood,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (!agreeSearchKeyword.value) {
                    agreeSearchKeyword.value = true;
                    return;
                  }

                  if (!agreeGeneral.value) {
                    agreeGeneral.value = true;
                    return;
                  }

                  Navigator.of(context).pop(true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
