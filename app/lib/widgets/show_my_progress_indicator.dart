import 'package:flutter/cupertino.dart';

MyProgressIndicator showMyProgressIndicator(
  BuildContext context, {
  WidgetBuilder? builder,
}) {
  showCupertinoDialog<void>(
    context: context,
    builder: builder ??
        (context) => const CupertinoAlertDialog(
              title: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
    routeSettings: const RouteSettings(
      name: 'MyProgressIndicator',
    ),
  );

  return MyProgressIndicator(context);
}

class MyProgressIndicator {
  MyProgressIndicator(
    BuildContext context,
  ) : state = Navigator.of(
          context,
          rootNavigator: true,
        );

  final NavigatorState state;

  void dismiss() {
    state.pop();
  }
}
