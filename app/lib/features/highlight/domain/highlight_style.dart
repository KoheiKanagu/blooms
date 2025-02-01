import 'package:blooms/gen/strings.g.dart';

enum HighlightStyle {
  private,
  ;

  String get localizedName {
    return switch (this) {
      HighlightStyle.private => i18n.highlight.style.private,
    };
  }
}
