import 'package:blooms/gen/strings.g.dart';

enum HighlightPeriod {
  past1day,
  past7days,
  past14days,
  past21days,
  past28days //
  ;

  int get days {
    switch (this) {
      case HighlightPeriod.past1day:
        return 1;
      case HighlightPeriod.past7days:
        return 7;
      case HighlightPeriod.past14days:
        return 14;
      case HighlightPeriod.past21days:
        return 21;
      case HighlightPeriod.past28days:
        return 28;
    }
  }

  String get localizedName {
    return switch (this) {
      HighlightPeriod.past1day => i18n.highlight.past1day,
      HighlightPeriod.past7days => i18n.highlight.past7days,
      HighlightPeriod.past14days => i18n.highlight.past14days,
      HighlightPeriod.past21days => i18n.highlight.past21days,
      HighlightPeriod.past28days => i18n.highlight.past28days,
    };
  }

  DateTime pastDate(DateTime today) {
    return DateTime(
      today.year,
      today.month,
      today.day,
    ).subtract(Duration(days: days));
  }
}
