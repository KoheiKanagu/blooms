import 'package:flutter/cupertino.dart';

class MyDecoration {
  static BoxDecoration dropShadow(BuildContext context) => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: CupertinoColors.systemGrey.resolveFrom(context).withOpacity(0.1),
        blurRadius: 2,
      ),
    ],
  );
}
