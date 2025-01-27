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
	String get anUnexpectedErrorOccurred => '予期しないエラーが発生しました';
	String get pleaseRestartTheAppLater => 'しばらくしてからアプリを再起動してください';
	String get retry => '再試行';
	String get condition => '体調';
	late final TranslationsHighlightJa highlight = TranslationsHighlightJa.internal(_root);
	TextSpan ackTerm({required InlineSpanBuilder termOfService, required InlineSpanBuilder privacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '本アプリの利用開始をもって'),
		termOfService('利用規約'),
		const TextSpan(text: 'と'),
		privacyPolicy('プライバシーポリシー'),
		const TextSpan(text: 'に同意したものとみなされます。'),
	]);
	String get skip => 'スキップ';
	String get kContinue => '続ける';
	late final TranslationsOnboardingJa onboarding = TranslationsOnboardingJa.internal(_root);
}

// Path: highlight
class TranslationsHighlightJa {
	TranslationsHighlightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get highlight => 'ハイライト';
	String get onTheDay => '当日';
	String pastDays({required Object n}) => '過去${n}日間';
	String xToY({required Object x, required Object y}) => '${x} から ${y}';
	late final TranslationsHighlightStateJa state = TranslationsHighlightStateJa.internal(_root);
	late final TranslationsHighlightCreateNewHighlightJa createNewHighlight = TranslationsHighlightCreateNewHighlightJa.internal(_root);
	String get past1day => '当日';
	String get past7days => '過去7日間';
	String get past14days => '過去14日間';
	String get past21days => '過去21日間';
	String get past28days => '過去28日間';
	String onTheDayTarget({required Object date}) => '${date} が対象';
	String xToYTarget({required Object x, required Object y}) => '${x} から ${y} が対象';
	String nDaysConditionSummary({required Object n}) => '${n}の記録を基にしてハイライトを作成します';
	String get createHighlight => 'ハイライトを作成する';
	String get deleteHighlight => 'ハイライトを削除する';
	late final TranslationsHighlightStyleJa style = TranslationsHighlightStyleJa.internal(_root);
}

// Path: onboarding
class TranslationsOnboardingJa {
	TranslationsOnboardingJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get letsGetStarted => 'さあ、はじめましょう';
}

// Path: highlight.state
class TranslationsHighlightStateJa {
	TranslationsHighlightStateJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pending => 'トレンド分析を待っています';
	String get pendingDescription => 'もうすぐ開始されます。しばらくお待ちください';
	String get inProgress => 'トレンド分析中です';
	String get inProgressDescription => 'しばらくお待ちください';
	String get failure => 'トレンド分析に失敗しました';
	String get failureDescription => '何らかのエラーが発生したため、トレンド分析できませんでした';
}

// Path: highlight.createNewHighlight
class TranslationsHighlightCreateNewHighlightJa {
	TranslationsHighlightCreateNewHighlightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '新しいハイライトを作成';
	String get forOwnDescription1 => 'あなた自身が体調を理解するために、対象の期間の記録を基にしてハイライトを作成します。';
	String get forOwnDescription2 => 'あなたに寄り添った口調の文章が作成されます。';
	String get forProfessionalDescription1 => 'プロフェッショナルがあなたの体調を理解することを助ける、ハイライトを作成します。';
	String get forProfessionalDescription2 => '医師や助産師などに体調を相談したい場合に適した文章が作成されます。淡々とした口調の文章が作成されます。';
}

// Path: highlight.style
class TranslationsHighlightStyleJa {
	TranslationsHighlightStyleJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get forOwn => '自分用';
	String get forProfessional => 'プロ用';
}
