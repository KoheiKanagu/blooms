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
	String get blooms => 'BLOOMS';
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
	String get today => '今日';
	String get camera => 'カメラ';
	String get photoLibrary => '写真ライブラリ';
	String get unknownContent => 'この形式は対応していません。アプリをバージョンアップしてください';
	String get imageLoadFailed => '画像の読み込みに失敗しました';
	late final TranslationsDeleteAllJa deleteAll = TranslationsDeleteAllJa.internal(_root);
	String get thankYouForUsing => 'ご利用いただきありがとうございました';
	late final TranslationsAboutBLOOMSJa aboutBLOOMS = TranslationsAboutBLOOMSJa.internal(_root);
	late final TranslationsReminderJa reminder = TranslationsReminderJa.internal(_root);
	String get done => '完了';
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
	late final TranslationsHighlightFeaturesJa features = TranslationsHighlightFeaturesJa.internal(_root);
}

// Path: onboarding
class TranslationsOnboardingJa {
	TranslationsOnboardingJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get letsGetStarted => 'さあ、はじめましょう';
}

// Path: deleteAll
class TranslationsDeleteAllJa {
	TranslationsDeleteAllJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'すべてのデータを削除しますか？';
	String get message => 'これまでの記録やハイライトなどのデータがすべて削除されます。この操作は取り消せません';
	String get delete => '削除';
}

// Path: aboutBLOOMS
class TranslationsAboutBLOOMSJa {
	TranslationsAboutBLOOMSJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get aboutBLOOMS => 'BLOOMSについて';
	String version({required Object version}) => 'バージョン: ${version}';
	String get whatIsBLOOMS => 'BLOOMSとは';
	String get openSource => 'オープンソース';
	String get openSourceDescription => 'BLOOMSはオープンソースで開発されています';
	String get termsOfService => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
	String get licenseInformation => 'ライセンス情報';
	String get deleteAllData => 'すべてのデータを削除';
}

// Path: reminder
class TranslationsReminderJa {
	TranslationsReminderJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get reminder => 'リマインダー';
	String get setConditionReminder => '今日の体調を記録し忘れないように、通知が設定できます';
	String get conditionReminderNotificationTitle => '今日の体調はいかがですか？';
	String get setHighlightReminder => '今週のハイライトを作成し忘れないように、通知が設定できます';
	String get highlightReminderNotificationTitle => '今週のハイライトを確認してみましょう';
	String get saturday => '土曜日';
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
}

// Path: highlight.features
class TranslationsHighlightFeaturesJa {
	TranslationsHighlightFeaturesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get description => '作成されるハイライトには次の特徴があります:';
	late final TranslationsHighlightFeaturesSummaryJa summary = TranslationsHighlightFeaturesSummaryJa.internal(_root);
}

// Path: highlight.features.summary
class TranslationsHighlightFeaturesSummaryJa {
	TranslationsHighlightFeaturesSummaryJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get care => 'あなたに寄り添って体調を気遣う文体の文章が作成されます';
	String get summary => '対象の期間における、あなたの体調についてまとめます';
	String get disclaimer => '内容はあくまで参考であり、診断結果として活用はできません';
}
