enum ReportType {
  past1day,
  past7days,
  past14days,
  past21days,
  past28days, //
  ;

  int get days {
    switch (this) {
      case ReportType.past1day:
        return 1;
      case ReportType.past7days:
        return 7;
      case ReportType.past14days:
        return 14;
      case ReportType.past21days:
        return 21;
      case ReportType.past28days:
        return 28;
    }
  }
}
