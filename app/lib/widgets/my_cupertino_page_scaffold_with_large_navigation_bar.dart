import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoPageScaffoldWithLargeNavigationBar extends StatelessWidget {
  const MyCupertinoPageScaffoldWithLargeNavigationBar({
    required this.backgroundColor,
    required this.navigationBar,
    required this.child,
    this.clipTop = true,
    super.key,
  });

  static const double _navigationBarHeight = 60;

  final Color backgroundColor;

  final CupertinoNavigationBar navigationBar;

  final Widget child;

  final bool clipTop;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          clipTop
              ? const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )
              : BorderRadius.zero,
      child: CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(_navigationBarHeight),
            child: SizedBox(height: _navigationBarHeight, child: navigationBar),
          ),
          body: child,
        ),
      ),
    );
  }
}
