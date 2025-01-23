///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final i18n = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get an_unexpected_error_occurred => '予期しないエラーが発生しました';
	String get retry => '再試行';
	String get condition => '体調';
	late final TranslationsHighlightJa highlight = TranslationsHighlightJa.internal(_root);
}

// Path: highlight
class TranslationsHighlightJa {
	TranslationsHighlightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get highlight => 'ハイライト';
	String get onTheDay => '当日';
	String pastDays({required Object n}) => '過去${n}日間';
	String xToY({required Object x, required Object y}) => '${x}から${y}';
	late final TranslationsHighlightStateJa state = TranslationsHighlightStateJa.internal(_root);
	String get createNewHighlight => '新しいハイライトを作成';
	String get past1day => '当日';
	String get past7days => '過去7日間';
	String get past14days => '過去14日間';
	String get past21days => '過去21日間';
	String get past28days => '過去28日間';
	String onTheDayTarget({required Object date}) => '${date} が対象です';
	String get oneDayConditionSummary => '1日分の体調の記録をまとめます';
	String xToYTarget({required Object x, required Object y}) => '${x} から ${y} が対象です';
	String nDaysConditionSummary({required Object n}) => '${n}の体調の記録をまとめます';
	String get createHighlight => 'ハイライトを作成する';
}

// Path: highlight.state
class TranslationsHighlightStateJa {
	TranslationsHighlightStateJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pending => 'トレンド分析を待っています';
	String get failure => '失敗しました';
}
