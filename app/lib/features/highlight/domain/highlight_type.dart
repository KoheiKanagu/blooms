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
}
