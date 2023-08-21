/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 78 (39 per locale)
///
/// Built on 2023-08-21 at 09:54 UTC

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
	vi(languageCode: 'vi', build: _StringsVi.build);

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
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

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
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
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
	String get appName => 'Agriculture App';
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsOnboardingEn onboarding = _StringsOnboardingEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsCropsEn crops = _StringsCropsEn._(_root);
	late final _StringsDetailCropEn detailCrop = _StringsDetailCropEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get filter => 'Filter';
	late final _StringsCommonButtonEn button = _StringsCommonButtonEn._(_root);
	String get dataNotFound => 'Data not found';
}

// Path: onboarding
class _StringsOnboardingEn {
	_StringsOnboardingEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	List<String> get title => [
		'Agriculture Guide',
		'Sharing and Exchanging experiences',
		'Miniature Farming Store',
	];
	List<String> get description => [
		'Converges many topics on farming and animal husbandry for you to learn.',
		'Create conditions for farmers to interact with each other on problems encountered in agriculture.',
		'Here, farmers will be suggested and made purchases and sales of items such as fertilizer, tools, ... for his work.',
	];
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsHomeHelloEn hello = _StringsHomeHelloEn._(_root);
	String weatherDes({required Object value}) => 'It\'s ${value} today';
	late final _StringsHomeTemperatureEn temperature = _StringsHomeTemperatureEn._(_root);
	late final _StringsHomeHumidityEn humidity = _StringsHomeHumidityEn._(_root);
	late final _StringsHomeRainfallEn rainfall = _StringsHomeRainfallEn._(_root);
	late final _StringsHomeWindSpeedEn windSpeed = _StringsHomeWindSpeedEn._(_root);
}

// Path: crops
class _StringsCropsEn {
	_StringsCropsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Crops';
	String get searchCrop => 'Search crop by name';
	String get cropTypes => 'Crop types';
	String get selectCropType => 'Select crop type';
}

// Path: detailCrop
class _StringsDetailCropEn {
	_StringsDetailCropEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Detail crop';
	String get plantingGuide => 'Planting guide';
	String get discuss => 'Discuss';
	String get plantingSeason => 'Planing season';
	String get prepareSupplies => 'Prepare supplies';
	String get landForPlanting => 'Land for planting';
	String get plantingPot => 'Planting pot';
	String get seedIncubation => 'Seed incubation';
	String get howToGrow => 'How to grow';
	String get plantCare => 'Plant care';
	String get watering => 'Watering';
	String get manure => 'Manure';
	String get weeding => 'Weeding';
}

// Path: common.button
class _StringsCommonButtonEn {
	_StringsCommonButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get reset => 'Reset';
	String get apply => 'Apply';
}

// Path: home.hello
class _StringsHomeHelloEn {
	_StringsHomeHelloEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get you => 'Hello you';
	String username({required Object name}) => 'Hello, ${name}';
}

// Path: home.temperature
class _StringsHomeTemperatureEn {
	_StringsHomeTemperatureEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Temperature';
	String value({required Object value}) => '${value}° F';
}

// Path: home.humidity
class _StringsHomeHumidityEn {
	_StringsHomeHumidityEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Humidity';
	String value({required Object value}) => '${value}%';
}

// Path: home.rainfall
class _StringsHomeRainfallEn {
	_StringsHomeRainfallEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Rainfall';
	String value({required Object value}) => '${value}mm';
}

// Path: home.windSpeed
class _StringsHomeWindSpeedEn {
	_StringsHomeWindSpeedEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'WindSpeed';
	String value({required Object value}) => '${value}m/s';
}

// Path: <root>
class _StringsVi implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsVi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsVi _root = this; // ignore: unused_field

	// Translations
	@override String get appName => 'Agriculture App';
	@override late final _StringsCommonVi common = _StringsCommonVi._(_root);
	@override late final _StringsOnboardingVi onboarding = _StringsOnboardingVi._(_root);
	@override late final _StringsHomeVi home = _StringsHomeVi._(_root);
	@override late final _StringsCropsVi crops = _StringsCropsVi._(_root);
	@override late final _StringsDetailCropVi detailCrop = _StringsDetailCropVi._(_root);
}

// Path: common
class _StringsCommonVi implements _StringsCommonEn {
	_StringsCommonVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get filter => 'Bộ lọc';
	@override late final _StringsCommonButtonVi button = _StringsCommonButtonVi._(_root);
	@override String get dataNotFound => 'Dữ liệu không được tìm thấy';
}

// Path: onboarding
class _StringsOnboardingVi implements _StringsOnboardingEn {
	_StringsOnboardingVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override List<String> get title => [
		'Hướng dẫn nông nghiệp',
		'Chia sẻ và Trao đổi kinh nghiệm',
		'Cửa hàng nông nghiệp thu nhỏ',
	];
	@override List<String> get description => [
		'Hội tụ nhiều chủ đề về trồng trọt, chăn nuôi để bạn tìm hiểu.',
		'Tạo điều kiện cho nông dân có thể tương tác với nhau về các vấn đề gặp phải trong nông nghiệp.',
		'Tại đây, nông dân sẽ được gợi ý và thực hiện mua bán các mặt hàng như phân bón, dụng cụ, ... cho công việc của mình.',
	];
}

// Path: home
class _StringsHomeVi implements _StringsHomeEn {
	_StringsHomeVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeHelloVi hello = _StringsHomeHelloVi._(_root);
	@override String weatherDes({required Object value}) => 'Hôm nay ${value}';
	@override late final _StringsHomeTemperatureVi temperature = _StringsHomeTemperatureVi._(_root);
	@override late final _StringsHomeHumidityVi humidity = _StringsHomeHumidityVi._(_root);
	@override late final _StringsHomeRainfallVi rainfall = _StringsHomeRainfallVi._(_root);
	@override late final _StringsHomeWindSpeedVi windSpeed = _StringsHomeWindSpeedVi._(_root);
}

// Path: crops
class _StringsCropsVi implements _StringsCropsEn {
	_StringsCropsVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cây trồng';
	@override String get searchCrop => 'Tìm kiếm tên cây trồng ...';
	@override String get cropTypes => 'Các loại cây trồng';
	@override String get selectCropType => 'Chọn loại cây trồng';
}

// Path: detailCrop
class _StringsDetailCropVi implements _StringsDetailCropEn {
	_StringsDetailCropVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chi tiết cây trồng';
	@override String get plantingGuide => 'Hướng dẫn trồng';
	@override String get discuss => 'Thảo luận';
	@override String get plantingSeason => 'Mùa vụ trồng';
	@override String get prepareSupplies => 'Chuẩn bị vật tư';
	@override String get landForPlanting => 'Đất trồng';
	@override String get plantingPot => 'Chậu trồng';
	@override String get seedIncubation => 'Ươm hạt giống';
	@override String get howToGrow => 'Cách trồng';
	@override String get plantCare => 'Chăm sóc cây trồng';
	@override String get watering => 'Tưới nước';
	@override String get manure => 'Bón phân';
	@override String get weeding => 'Làm cỏ';
}

// Path: common.button
class _StringsCommonButtonVi implements _StringsCommonButtonEn {
	_StringsCommonButtonVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get reset => 'Đặt lại';
	@override String get apply => 'Áp dụng';
}

// Path: home.hello
class _StringsHomeHelloVi implements _StringsHomeHelloEn {
	_StringsHomeHelloVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get you => 'Xin chào bạn';
	@override String username({required Object name}) => 'Xin chào, ${name}';
}

// Path: home.temperature
class _StringsHomeTemperatureVi implements _StringsHomeTemperatureEn {
	_StringsHomeTemperatureVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nhiệt độ';
	@override String value({required Object value}) => '${value}° F';
}

// Path: home.humidity
class _StringsHomeHumidityVi implements _StringsHomeHumidityEn {
	_StringsHomeHumidityVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Độ ẩm';
	@override String value({required Object value}) => '${value}%';
}

// Path: home.rainfall
class _StringsHomeRainfallVi implements _StringsHomeRainfallEn {
	_StringsHomeRainfallVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Lượng mưa';
	@override String value({required Object value}) => '${value}mm';
}

// Path: home.windSpeed
class _StringsHomeWindSpeedVi implements _StringsHomeWindSpeedEn {
	_StringsHomeWindSpeedVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Tốc độ gió';
	@override String value({required Object value}) => '${value}m/s';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Agriculture App';
			case 'common.filter': return 'Filter';
			case 'common.button.reset': return 'Reset';
			case 'common.button.apply': return 'Apply';
			case 'common.dataNotFound': return 'Data not found';
			case 'onboarding.title.0': return 'Agriculture Guide';
			case 'onboarding.title.1': return 'Sharing and Exchanging experiences';
			case 'onboarding.title.2': return 'Miniature Farming Store';
			case 'onboarding.description.0': return 'Converges many topics on farming and animal husbandry for you to learn.';
			case 'onboarding.description.1': return 'Create conditions for farmers to interact with each other on problems encountered in agriculture.';
			case 'onboarding.description.2': return 'Here, farmers will be suggested and made purchases and sales of items such as fertilizer, tools, ... for his work.';
			case 'home.hello.you': return 'Hello you';
			case 'home.hello.username': return ({required Object name}) => 'Hello, ${name}';
			case 'home.weatherDes': return ({required Object value}) => 'It\'s ${value} today';
			case 'home.temperature.label': return 'Temperature';
			case 'home.temperature.value': return ({required Object value}) => '${value}° F';
			case 'home.humidity.label': return 'Humidity';
			case 'home.humidity.value': return ({required Object value}) => '${value}%';
			case 'home.rainfall.label': return 'Rainfall';
			case 'home.rainfall.value': return ({required Object value}) => '${value}mm';
			case 'home.windSpeed.label': return 'WindSpeed';
			case 'home.windSpeed.value': return ({required Object value}) => '${value}m/s';
			case 'crops.title': return 'Crops';
			case 'crops.searchCrop': return 'Search crop by name';
			case 'crops.cropTypes': return 'Crop types';
			case 'crops.selectCropType': return 'Select crop type';
			case 'detailCrop.title': return 'Detail crop';
			case 'detailCrop.plantingGuide': return 'Planting guide';
			case 'detailCrop.discuss': return 'Discuss';
			case 'detailCrop.plantingSeason': return 'Planing season';
			case 'detailCrop.prepareSupplies': return 'Prepare supplies';
			case 'detailCrop.landForPlanting': return 'Land for planting';
			case 'detailCrop.plantingPot': return 'Planting pot';
			case 'detailCrop.seedIncubation': return 'Seed incubation';
			case 'detailCrop.howToGrow': return 'How to grow';
			case 'detailCrop.plantCare': return 'Plant care';
			case 'detailCrop.watering': return 'Watering';
			case 'detailCrop.manure': return 'Manure';
			case 'detailCrop.weeding': return 'Weeding';
			default: return null;
		}
	}
}

extension on _StringsVi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Agriculture App';
			case 'common.filter': return 'Bộ lọc';
			case 'common.button.reset': return 'Đặt lại';
			case 'common.button.apply': return 'Áp dụng';
			case 'common.dataNotFound': return 'Dữ liệu không được tìm thấy';
			case 'onboarding.title.0': return 'Hướng dẫn nông nghiệp';
			case 'onboarding.title.1': return 'Chia sẻ và Trao đổi kinh nghiệm';
			case 'onboarding.title.2': return 'Cửa hàng nông nghiệp thu nhỏ';
			case 'onboarding.description.0': return 'Hội tụ nhiều chủ đề về trồng trọt, chăn nuôi để bạn tìm hiểu.';
			case 'onboarding.description.1': return 'Tạo điều kiện cho nông dân có thể tương tác với nhau về các vấn đề gặp phải trong nông nghiệp.';
			case 'onboarding.description.2': return 'Tại đây, nông dân sẽ được gợi ý và thực hiện mua bán các mặt hàng như phân bón, dụng cụ, ... cho công việc của mình.';
			case 'home.hello.you': return 'Xin chào bạn';
			case 'home.hello.username': return ({required Object name}) => 'Xin chào, ${name}';
			case 'home.weatherDes': return ({required Object value}) => 'Hôm nay ${value}';
			case 'home.temperature.label': return 'Nhiệt độ';
			case 'home.temperature.value': return ({required Object value}) => '${value}° F';
			case 'home.humidity.label': return 'Độ ẩm';
			case 'home.humidity.value': return ({required Object value}) => '${value}%';
			case 'home.rainfall.label': return 'Lượng mưa';
			case 'home.rainfall.value': return ({required Object value}) => '${value}mm';
			case 'home.windSpeed.label': return 'Tốc độ gió';
			case 'home.windSpeed.value': return ({required Object value}) => '${value}m/s';
			case 'crops.title': return 'Cây trồng';
			case 'crops.searchCrop': return 'Tìm kiếm tên cây trồng ...';
			case 'crops.cropTypes': return 'Các loại cây trồng';
			case 'crops.selectCropType': return 'Chọn loại cây trồng';
			case 'detailCrop.title': return 'Chi tiết cây trồng';
			case 'detailCrop.plantingGuide': return 'Hướng dẫn trồng';
			case 'detailCrop.discuss': return 'Thảo luận';
			case 'detailCrop.plantingSeason': return 'Mùa vụ trồng';
			case 'detailCrop.prepareSupplies': return 'Chuẩn bị vật tư';
			case 'detailCrop.landForPlanting': return 'Đất trồng';
			case 'detailCrop.plantingPot': return 'Chậu trồng';
			case 'detailCrop.seedIncubation': return 'Ươm hạt giống';
			case 'detailCrop.howToGrow': return 'Cách trồng';
			case 'detailCrop.plantCare': return 'Chăm sóc cây trồng';
			case 'detailCrop.watering': return 'Tưới nước';
			case 'detailCrop.manure': return 'Bón phân';
			case 'detailCrop.weeding': return 'Làm cỏ';
			default: return null;
		}
	}
}
