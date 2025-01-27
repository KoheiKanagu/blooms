import 'package:blooms/gen/strings.g.dart';

enum HighlightStyle {
  private,
  professional,
  ;

  String get localizedName {
    return switch (this) {
      HighlightStyle.private => i18n.highlight.style.private,
      HighlightStyle.professional => i18n.highlight.style.professional,
    };
  }
}
