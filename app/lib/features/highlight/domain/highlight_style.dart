import 'package:blooms/gen/strings.g.dart';

enum HighlightStyle {
  forOwn,
  forProfessional,
  ;

  String get localizedName {
    return switch (this) {
      HighlightStyle.forOwn => i18n.highlight.style.forOwn,
      HighlightStyle.forProfessional => i18n.highlight.style.forProfessional,
    };
  }
}
