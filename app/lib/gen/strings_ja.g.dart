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
	String get howIsYourConditionNow => '今の体調は？';
	String get appOnlyFeature => 'この機能はアプリ版でのみ利用できます';
	late final TranslationsDisclaimerJa disclaimer = TranslationsDisclaimerJa.internal(_root);
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
	String get createdFromThisRecords => 'このハイライトはこれらの記録から作成されました';
}

// Path: onboarding
class TranslationsOnboardingJa {
	TranslationsOnboardingJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get letsGetStarted => 'さあ、はじめましょう';
	late final TranslationsOnboardingNameJa name = TranslationsOnboardingNameJa.internal(_root);
	late final TranslationsOnboardingPrivacyJa privacy = TranslationsOnboardingPrivacyJa.internal(_root);
	late final TranslationsOnboardingAssistantJa assistant = TranslationsOnboardingAssistantJa.internal(_root);
	late final TranslationsOnboardingImageJa image = TranslationsOnboardingImageJa.internal(_root);
	late final TranslationsOnboardingHighlightJa highlight = TranslationsOnboardingHighlightJa.internal(_root);
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
	String get termsAndConditions => 'BLOOMSを利用する上での注意事項';
	String get openSource => 'オープンソース';
	String get openSourceDescription => 'BLOOMSはオープンソースで開発されています';
	String get termsOfService => '利用規約';
	String get privacyPolicy => 'プライバシーポリシー';
	String get licenseInformation => 'ライセンス情報';
	String get deleteAllData => 'すべてのデータを削除';
	String get yourId => 'あなたのID';
	String get yourIdDescription => 'BLOOMSがあなたの識別するためのIDです。お問い合わせの際などに必要となる場合があります';
	String get inquiry => 'お問い合わせ';
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

// Path: disclaimer
class TranslationsDisclaimerJa {
	TranslationsDisclaimerJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'BLOOMSは誤った内容を提供する可能性があります';
	String get title => '免責事項';
	String get general => '一般';
	String get general1 => 'BLOOMSを利用する前に、必ず医師や専門家に相談してください';
	String get general2 => 'BLOOMSは医療情報を提供するものではありません';
	String get general3 => 'BLOOMSは医師や専門家による診断や治療を代替するものではありません';
	String get response => '回答';
	String get response1 => 'BLOOMSの回答には、あなたの記録を要約した内容や関連する検索キーワードが含まれる場合があります';
	String get response2 => 'BLOOMSの回答は、事実とは異なる内容が含まれる可能性があります';
	String get response3 => 'BLOOMSの回答は、あなたの身体に悪影響を与える行動を促す可能性があります';
	String get response4 => 'BLOOMSの回答は、医師や専門家によって提供される情報とは異なる可能性があります';
	String get response5 => 'BLOOMSの回答は、医師や専門家に監修されたものではありません';
	String get response6 => 'BLOOMSの回答を信じる前に、必ず医師や専門家に相談してください';
	String get response7 => 'BLOOMSの回答を信じることで生じた損害について、開発者は一切の責任を負いません';
	String get searchKeyword => '検索キーワード';
	String get searchKeyword1 => 'BLOOMSが提案する検索キーワードを用いて得られた情報を元にして、適切な対処法を知ることができるとは限りません';
	String get searchKeyword2 => 'BLOOMSが提案する検索キーワードを用いて得られた情報を元にして、自己判断で行動を起こすことは避けてください';
	String get searchKeyword3 => 'BLOOMSが提案する検索キーワードを用いて得られた情報を元にして、自己判断で行動を起こすことで生じた損害について、開発者は一切の責任を負いません';
	String get understood => '理解した上で利用する';
}

// Path: highlight.state
class TranslationsHighlightStateJa {
	TranslationsHighlightStateJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pending => 'ハイライトの作成を待っています';
	String get pendingDescription => 'もうすぐ開始されます。しばらくお待ちください';
	String get inProgress => 'ハイライトを作成中です';
	String get inProgressDescription => 'しばらくお待ちください';
	String get failure => 'ハイライトの作成に失敗しました';
	String get failureDescription => '何らかのエラーが発生したため、ハイライトを作成できませんでした';
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

// Path: onboarding.name
class TranslationsOnboardingNameJa {
	TranslationsOnboardingNameJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'BLOOMS';
	String get subtitle => '見つめてみよう。妊婦のあなたの日々の体調';
	String get description1 => '変化しやすい体調も、知れば知るほど対策は取りやすくなります。';
	String get description2 => 'BLOOMSは、あなたの体調を記録し、理解を深めるお手伝いをします。';
}

// Path: onboarding.privacy
class TranslationsOnboardingPrivacyJa {
	TranslationsOnboardingPrivacyJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'プライバシー';
	String get subtitle => 'あなたの記録は、あなた個人とは紐付けれらません';
	String get description1 => 'ソーシャルアカウントやメールアドレスなど、個人を特定できる情報は必要ありません。';
	String get description2 => 'BLOOMS独自のIDを発行して、あなたの記録を安全に保管します。';
	TextSpan description3({required InlineSpanBuilder appLock}) => TextSpan(children: [
		appLock('アプリをロック'),
		const TextSpan(text: 'すれば、アプリはあなたにしか開けません。'),
	]);
}

// Path: onboarding.assistant
class TranslationsOnboardingAssistantJa {
	TranslationsOnboardingAssistantJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アシスタント';
	String get subtitle => 'あなたの記録、アシストします';
	String get description1 => 'あなたの記録を助けるパーソナルアシスタントが登場します。';
	String get description2 => '提案された検索キーワードを使って、体調について理解を深めましょう。';
	String get disclaimer1 => '症状の診断ではありません。事実とは異なる内容が含まれる可能性があります。';
	String get disclaimer2 => '適切な検索キーワードが提案されない可能性があります。適切な対処法を知るためには、必ず産婦人科医や助産師に相談してください。';
}

// Path: onboarding.image
class TranslationsOnboardingImageJa {
	TranslationsOnboardingImageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'フォト';
	String get subtitle => '文字だけ、ではありません';
	String get description1 => '食事の内容やその日の体験を写真でも記録できます。';
	String get description2 => 'BLOOMSは何が写っているかを認識し、記録をより鮮明にします。';
	String get disclaimer1 => '被写体を正しく認識できない場合があります。';
}

// Path: onboarding.highlight
class TranslationsOnboardingHighlightJa {
	TranslationsOnboardingHighlightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ハイライト';
	String get subtitle => '記録をまとめて振り返りましょう';
	String get description1 => 'たくさんの記録があっても、全てを見返す必要はありません。';
	String get description2 => 'ハイライトを作成すれば、過去の記録を分かりやすく要約し、ひと目で把握できます。';
	String get disclaimer1 => '診断ではありません。内容はあくまで参考であり、事実とは異なる内容が含まれる可能性があります。';
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
