import 'package:blooms/gen/strings.g.dart';

enum HighlightType {
  past1day,
  past7days,
  past14days,
  past21days,
  past28days, //
  ;

  int get days {
    switch (this) {
      case HighlightType.past1day:
        return 1;
      case HighlightType.past7days:
        return 7;
      case HighlightType.past14days:
        return 14;
      case HighlightType.past21days:
        return 21;
      case HighlightType.past28days:
        return 28;
    }
  }

  String get localizedName {
    return switch (this) {
      HighlightType.past1day => i18n.highlight.past1day,
      HighlightType.past7days => i18n.highlight.past7days,
      HighlightType.past14days => i18n.highlight.past14days,
      HighlightType.past21days => i18n.highlight.past21days,
      HighlightType.past28days => i18n.highlight.past28days,
    };
  }

  DateTime pastDate(DateTime today) {
    return DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: days));
  }
}
