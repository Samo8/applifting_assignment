/// Generated file. Do not edit.
///
/// Locales: 3
/// Strings: 75 (25 per locale)
///
/// Built on 2023-01-30 at 16:16 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	cz(languageCode: 'cz', build: _StringsCz.build),
	sk(languageCode: 'sk', build: _StringsSk.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsCompanyInfoEn companyInfo = _StringsCompanyInfoEn._(_root);
	late final _StringsLaunchEn launch = _StringsLaunchEn._(_root);
	late final _StringsLaunchDetailEn launchDetail = _StringsLaunchDetailEn._(_root);
	late final _StringsHttpEn http = _StringsHttpEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appName => 'Applifting SpaceX';
	String get noInternet => 'No internet connection';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsHomeBottomNavBarEn bottomNavBar = _StringsHomeBottomNavBarEn._(_root);
}

// Path: companyInfo
class _StringsCompanyInfoEn {
	_StringsCompanyInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Name';
	String get headquarters => 'Headquarters';
	String get ceoAndCto => 'CEO & CTO';
	String get numberOfEmployees => 'Number of employees';
	String get foundedIn => 'Founded in';
	String get summary => 'Summary';
}

// Path: launch
class _StringsLaunchEn {
	_StringsLaunchEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get noLaunches => 'There are no launches';
	String get search => 'Search';
	List<String> get filterBy => [
		'By id',
		'By date',
	];
}

// Path: launchDetail
class _StringsLaunchDetailEn {
	_StringsLaunchDetailEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get launchedAt => 'Launched at';
	String get detail => 'Detail';
	String get crew => 'Crew';
	String get noInfoAboutCrew => 'No info about crew';
	String get flightFailed => 'The flight has failed';
	String get failures => 'Failures';
	String get altitude => 'Altitude';
}

// Path: http
class _StringsHttpEn {
	_StringsHttpEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get badRequest => 'Bad request';
	String get unauthorized => 'Unauthorized';
	String get notFound => 'Not found';
	String get unexpectedError => 'Unexpected error';
}

// Path: home.bottomNavBar
class _StringsHomeBottomNavBarEn {
	_StringsHomeBottomNavBarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get info => 'Info';
	String get launches => 'Launches';
}

// Path: <root>
class _StringsCz implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsCz.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.cz,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <cz>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsCz _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralCz general = _StringsGeneralCz._(_root);
	@override late final _StringsHomeCz home = _StringsHomeCz._(_root);
	@override late final _StringsCompanyInfoCz companyInfo = _StringsCompanyInfoCz._(_root);
	@override late final _StringsLaunchCz launch = _StringsLaunchCz._(_root);
	@override late final _StringsLaunchDetailCz launchDetail = _StringsLaunchDetailCz._(_root);
	@override late final _StringsHttpCz http = _StringsHttpCz._(_root);
}

// Path: general
class _StringsGeneralCz implements _StringsGeneralEn {
	_StringsGeneralCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Applifting SpaceX';
	@override String get noInternet => 'Žádné internetové připojení';
}

// Path: home
class _StringsHomeCz implements _StringsHomeEn {
	_StringsHomeCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeBottomNavBarCz bottomNavBar = _StringsHomeBottomNavBarCz._(_root);
}

// Path: companyInfo
class _StringsCompanyInfoCz implements _StringsCompanyInfoEn {
	_StringsCompanyInfoCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get name => 'Název';
	@override String get headquarters => 'Sídlo';
	@override String get ceoAndCto => 'CEO & CTO';
	@override String get numberOfEmployees => 'Počet zaměstnanců';
	@override String get foundedIn => 'Založeno v';
	@override String get summary => 'Shrnutí';
}

// Path: launch
class _StringsLaunchCz implements _StringsLaunchEn {
	_StringsLaunchCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get noLaunches => 'Nenašli se žádné starty';
	@override String get search => 'Vyhledat';
	@override List<String> get filterBy => [
		'Podle id',
		'Podle datumu',
	];
}

// Path: launchDetail
class _StringsLaunchDetailCz implements _StringsLaunchDetailEn {
	_StringsLaunchDetailCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get launchedAt => 'Spuštěno o';
	@override String get detail => 'Detail';
	@override String get crew => 'Posádka';
	@override String get noInfoAboutCrew => 'Žádné informace ohledně posádky';
	@override String get flightFailed => 'Let selhal';
	@override String get failures => 'Selhání';
	@override String get altitude => 'Nadmořská výška';
}

// Path: http
class _StringsHttpCz implements _StringsHttpEn {
	_StringsHttpCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get badRequest => 'Špatný požadavek';
	@override String get unauthorized => 'Neautorizovaný';
	@override String get notFound => 'Nenalezeno';
	@override String get unexpectedError => 'Neočekávaná chyba';
}

// Path: home.bottomNavBar
class _StringsHomeBottomNavBarCz implements _StringsHomeBottomNavBarEn {
	_StringsHomeBottomNavBarCz._(this._root);

	@override final _StringsCz _root; // ignore: unused_field

	// Translations
	@override String get info => 'Informci';
	@override String get launches => 'Starty';
}

// Path: <root>
class _StringsSk implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.sk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sk>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsSk _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralSk general = _StringsGeneralSk._(_root);
	@override late final _StringsHomeSk home = _StringsHomeSk._(_root);
	@override late final _StringsCompanyInfoSk companyInfo = _StringsCompanyInfoSk._(_root);
	@override late final _StringsLaunchSk launch = _StringsLaunchSk._(_root);
	@override late final _StringsLaunchDetailSk launchDetail = _StringsLaunchDetailSk._(_root);
	@override late final _StringsHttpSk http = _StringsHttpSk._(_root);
}

// Path: general
class _StringsGeneralSk implements _StringsGeneralEn {
	_StringsGeneralSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Applifting SpaceX';
	@override String get noInternet => 'Žiadne internetové pripojenie';
}

// Path: home
class _StringsHomeSk implements _StringsHomeEn {
	_StringsHomeSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeBottomNavBarSk bottomNavBar = _StringsHomeBottomNavBarSk._(_root);
}

// Path: companyInfo
class _StringsCompanyInfoSk implements _StringsCompanyInfoEn {
	_StringsCompanyInfoSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get name => 'Názov';
	@override String get headquarters => 'Sídlo';
	@override String get ceoAndCto => 'CEO & CTO';
	@override String get numberOfEmployees => 'Počet zamestnancov';
	@override String get foundedIn => 'Založené v';
	@override String get summary => 'Zhrnutie';
}

// Path: launch
class _StringsLaunchSk implements _StringsLaunchEn {
	_StringsLaunchSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get noLaunches => 'Nenašli sa žiadne štarty';
	@override String get search => 'Vyhľadať';
	@override List<String> get filterBy => [
		'Podľa id',
		'Podľa dátumu',
	];
}

// Path: launchDetail
class _StringsLaunchDetailSk implements _StringsLaunchDetailEn {
	_StringsLaunchDetailSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get launchedAt => 'Spustené o';
	@override String get detail => 'Detail';
	@override String get crew => 'Posádka';
	@override String get noInfoAboutCrew => 'Žiadne informácie ohľadom posádky';
	@override String get flightFailed => 'Let zlyhal';
	@override String get failures => 'Zlyhania';
	@override String get altitude => 'Nadmorská výška';
}

// Path: http
class _StringsHttpSk implements _StringsHttpEn {
	_StringsHttpSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get badRequest => 'Zlá požiadavka';
	@override String get unauthorized => 'Neautorizovaný';
	@override String get notFound => 'Nenájdené';
	@override String get unexpectedError => 'Neočakávaná chyba';
}

// Path: home.bottomNavBar
class _StringsHomeBottomNavBarSk implements _StringsHomeBottomNavBarEn {
	_StringsHomeBottomNavBarSk._(this._root);

	@override final _StringsSk _root; // ignore: unused_field

	// Translations
	@override String get info => 'Informácie';
	@override String get launches => 'Štarty';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.appName': return 'Applifting SpaceX';
			case 'general.noInternet': return 'No internet connection';
			case 'home.bottomNavBar.info': return 'Info';
			case 'home.bottomNavBar.launches': return 'Launches';
			case 'companyInfo.name': return 'Name';
			case 'companyInfo.headquarters': return 'Headquarters';
			case 'companyInfo.ceoAndCto': return 'CEO & CTO';
			case 'companyInfo.numberOfEmployees': return 'Number of employees';
			case 'companyInfo.foundedIn': return 'Founded in';
			case 'companyInfo.summary': return 'Summary';
			case 'launch.noLaunches': return 'There are no launches';
			case 'launch.search': return 'Search';
			case 'launch.filterBy.0': return 'By id';
			case 'launch.filterBy.1': return 'By date';
			case 'launchDetail.launchedAt': return 'Launched at';
			case 'launchDetail.detail': return 'Detail';
			case 'launchDetail.crew': return 'Crew';
			case 'launchDetail.noInfoAboutCrew': return 'No info about crew';
			case 'launchDetail.flightFailed': return 'The flight has failed';
			case 'launchDetail.failures': return 'Failures';
			case 'launchDetail.altitude': return 'Altitude';
			case 'http.badRequest': return 'Bad request';
			case 'http.unauthorized': return 'Unauthorized';
			case 'http.notFound': return 'Not found';
			case 'http.unexpectedError': return 'Unexpected error';
			default: return null;
		}
	}
}

extension on _StringsCz {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.appName': return 'Applifting SpaceX';
			case 'general.noInternet': return 'Žádné internetové připojení';
			case 'home.bottomNavBar.info': return 'Informci';
			case 'home.bottomNavBar.launches': return 'Starty';
			case 'companyInfo.name': return 'Název';
			case 'companyInfo.headquarters': return 'Sídlo';
			case 'companyInfo.ceoAndCto': return 'CEO & CTO';
			case 'companyInfo.numberOfEmployees': return 'Počet zaměstnanců';
			case 'companyInfo.foundedIn': return 'Založeno v';
			case 'companyInfo.summary': return 'Shrnutí';
			case 'launch.noLaunches': return 'Nenašli se žádné starty';
			case 'launch.search': return 'Vyhledat';
			case 'launch.filterBy.0': return 'Podle id';
			case 'launch.filterBy.1': return 'Podle datumu';
			case 'launchDetail.launchedAt': return 'Spuštěno o';
			case 'launchDetail.detail': return 'Detail';
			case 'launchDetail.crew': return 'Posádka';
			case 'launchDetail.noInfoAboutCrew': return 'Žádné informace ohledně posádky';
			case 'launchDetail.flightFailed': return 'Let selhal';
			case 'launchDetail.failures': return 'Selhání';
			case 'launchDetail.altitude': return 'Nadmořská výška';
			case 'http.badRequest': return 'Špatný požadavek';
			case 'http.unauthorized': return 'Neautorizovaný';
			case 'http.notFound': return 'Nenalezeno';
			case 'http.unexpectedError': return 'Neočekávaná chyba';
			default: return null;
		}
	}
}

extension on _StringsSk {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.appName': return 'Applifting SpaceX';
			case 'general.noInternet': return 'Žiadne internetové pripojenie';
			case 'home.bottomNavBar.info': return 'Informácie';
			case 'home.bottomNavBar.launches': return 'Štarty';
			case 'companyInfo.name': return 'Názov';
			case 'companyInfo.headquarters': return 'Sídlo';
			case 'companyInfo.ceoAndCto': return 'CEO & CTO';
			case 'companyInfo.numberOfEmployees': return 'Počet zamestnancov';
			case 'companyInfo.foundedIn': return 'Založené v';
			case 'companyInfo.summary': return 'Zhrnutie';
			case 'launch.noLaunches': return 'Nenašli sa žiadne štarty';
			case 'launch.search': return 'Vyhľadať';
			case 'launch.filterBy.0': return 'Podľa id';
			case 'launch.filterBy.1': return 'Podľa dátumu';
			case 'launchDetail.launchedAt': return 'Spustené o';
			case 'launchDetail.detail': return 'Detail';
			case 'launchDetail.crew': return 'Posádka';
			case 'launchDetail.noInfoAboutCrew': return 'Žiadne informácie ohľadom posádky';
			case 'launchDetail.flightFailed': return 'Let zlyhal';
			case 'launchDetail.failures': return 'Zlyhania';
			case 'launchDetail.altitude': return 'Nadmorská výška';
			case 'http.badRequest': return 'Zlá požiadavka';
			case 'http.unauthorized': return 'Neautorizovaný';
			case 'http.notFound': return 'Nenájdené';
			case 'http.unexpectedError': return 'Neočakávaná chyba';
			default: return null;
		}
	}
}
