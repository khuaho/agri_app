/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 316 (158 per locale)
///
/// Built on 2023-09-20 at 07:58 UTC

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
	late final _StringsMainEn main = _StringsMainEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsErrorEn error = _StringsErrorEn._(_root);
	late final _StringsOnboardingEn onboarding = _StringsOnboardingEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsCropsEn crops = _StringsCropsEn._(_root);
	late final _StringsDetailCropEn detailCrop = _StringsDetailCropEn._(_root);
	late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsProfileEn profile = _StringsProfileEn._(_root);
	late final _StringsMyCropsEn myCrops = _StringsMyCropsEn._(_root);
	late final _StringsUpsertMyCropEn upsertMyCrop = _StringsUpsertMyCropEn._(_root);
	late final _StringsMyCropDetailEn myCropDetail = _StringsMyCropDetailEn._(_root);
}

// Path: main
class _StringsMainEn {
	_StringsMainEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get crops => 'Crops';
	String get myCrops => 'My crops';
	String get settings => 'Settings';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get filter => 'Filter';
	late final _StringsCommonButtonEn button = _StringsCommonButtonEn._(_root);
	late final _StringsCommonReactionEn reaction = _StringsCommonReactionEn._(_root);
	String get dataNotFound => 'Data not found';
	late final _StringsCommonDateTimeEn dateTime = _StringsCommonDateTimeEn._(_root);
	String get getPhoto => 'Get photo';
	String get camera => 'Camera';
	String get gallery => 'Gallery';
	String get oops => 'Oops!';
	late final _StringsCommonPermissionEn permission_ = _StringsCommonPermissionEn._(_root);
}

// Path: error
class _StringsErrorEn {
	_StringsErrorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Error!!!';
	String get illegalData => 'Wrong data format';
	String get noNetwork => 'No internet connection';
	String get unknown => 'An Unexpected Error Occurred';
	String get permissionDenied => 'Permission denied';
	String get processingError => 'Error while processing';
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
	String get writeComment => 'Write comment...';
}

// Path: auth
class _StringsAuthEn {
	_StringsAuthEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	late final _StringsAuthEmailEn email = _StringsAuthEmailEn._(_root);
	late final _StringsAuthPasswordEn password = _StringsAuthPasswordEn._(_root);
	String get forgotPassword => 'Forgot password';
	String get haveNotAnAccount => 'Haven\'t an account? ';
	String get or => 'OR';
	String get loginWithGoogle => 'Login with Google';
	String get loginWithFacebook => 'Login with Facebook';
	String get register => 'Register';
	late final _StringsAuthUsernameEn username = _StringsAuthUsernameEn._(_root);
	late final _StringsAuthFullNameEn fullName = _StringsAuthFullNameEn._(_root);
	late final _StringsAuthConfirmPasswordEn confirmPassword = _StringsAuthConfirmPasswordEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get logout => 'Logout';
	late final _StringsSettingsLanguageEn language = _StringsSettingsLanguageEn._(_root);
	String get generalAmenities => 'General amenities';
}

// Path: profile
class _StringsProfileEn {
	_StringsProfileEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
	late final _StringsProfileGenderEn gender = _StringsProfileGenderEn._(_root);
	late final _StringsProfileRoleEn role = _StringsProfileRoleEn._(_root);
}

// Path: myCrops
class _StringsMyCropsEn {
	_StringsMyCropsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	List<String> get status => [
		'Completed',
		'Inprogress',
		'To do',
		'Cancel',
	];
	String get type => 'Type:';
	String get date => 'Date:';
	String get complete => 'Complete';
	String get perform => 'Perform';
	String get cancel => 'Cancel';
	String get haveNotCreateCrop => 'You haven\'t created a crop profile yet!';
	String get now => 'Now';
}

// Path: upsertMyCrop
class _StringsUpsertMyCropEn {
	_StringsUpsertMyCropEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Create crop profile';
	late final _StringsUpsertMyCropCropTypeEn cropType = _StringsUpsertMyCropCropTypeEn._(_root);
	late final _StringsUpsertMyCropCropEn crop = _StringsUpsertMyCropCropEn._(_root);
	String get initialStatus => 'Initial status';
	String get status => 'Status';
	String get allTask => 'ALL TASKS';
	String get yourPreparation => 'Your preparation (optional):';
	String get suggestionTask => 'Some suggestion tasks, you choose:';
	String get updateCropProfile => 'Update crop profile';
	String get cancelDes => 'Are you sure want to cancel this crop?';
	String get carryOutPlantingDes => 'Are you sure want to carry out planting this crop?';
	String get createCropDes => 'Are you sure you want to create this crop profile?';
	String get updateCropDes => 'Are you sure you want to update this crop?';
	late final _StringsUpsertMyCropStartDateEn startDate = _StringsUpsertMyCropStartDateEn._(_root);
}

// Path: myCropDetail
class _StringsMyCropDetailEn {
	_StringsMyCropDetailEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'My crop profile';
}

// Path: common.button
class _StringsCommonButtonEn {
	_StringsCommonButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get reset => 'Reset';
	String get apply => 'Apply';
	String get delete => 'Delete';
	String get reply => 'Reply';
	String get cancel => 'Cancel';
	String get ok => 'Ok';
	String get edit => 'Edit';
	String get openSettings => 'Open settings';
	String get update => 'Update';
	String get create => 'Create';
	String get add => 'Add';
}

// Path: common.reaction
class _StringsCommonReactionEn {
	_StringsCommonReactionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get like => 'Like';
	String get favorite => 'Favorite';
	String get satisfied => 'Satisfied';
	String get unsatisfied => 'Unsatisfied';
}

// Path: common.dateTime
class _StringsCommonDateTimeEn {
	_StringsCommonDateTimeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get year => 'year';
	String get month => 'month';
	String get week => 'week';
	String get today => 'Today';
	String get ago => 'ago';
	String get hour => 'hour';
	String get minute => 'minute';
	String get justNow => 'just now';
}

// Path: common.permission_
class _StringsCommonPermissionEn {
	_StringsCommonPermissionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get cameraMsgIos => 'We could not access your camera. Please remove any restrictions on the camera to continue (Settings ➔ Post Reader ➔ Enable Camera).';
	String get cameraMsgAndroid => 'We could not access your camera. Please remove any restrictions on the camera to continue (Settings ➔ Apps ➔ Post Reader ➔ Permissions ➔ Enable Camera).';
	String get photoMsgIos => 'We could not access your photos. Please remove any restrictions on the photos to continue (Settings ➔ Post Reader ➔ Enable Photos).';
	String get photoMsgAndroid => 'We could not access your gallery. Please remove any restrictions on the gallery to continue (Settings ➔ Apps ➔ Post Reader ➔ Permissions ➔ Enable Photos).';
	String get locationServicesAreDisabled => 'Location services are disabled.';
	String get permissionDenied => 'Permission denied.';
	String get permissionDeniedForever => 'Permission denied forever.';
	String get permissionGranted => 'Permission granted.';
	String get locationNotAvailable => 'Location Not Available';
	String get unableToDetermine => 'Unable to determine';
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

// Path: auth.email
class _StringsAuthEmailEn {
	_StringsAuthEmailEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get hint => 'Enter email';
	String get required => 'Email is required!';
}

// Path: auth.password
class _StringsAuthPasswordEn {
	_StringsAuthPasswordEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	String get hint => 'Enter password';
	String get required => 'Password is required!';
	String get isAtLeast8Characters => 'Password is at least 8 characters';
	String get isNotValid => 'Password is not valid';
}

// Path: auth.username
class _StringsAuthUsernameEn {
	_StringsAuthUsernameEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Username';
	String get hint => 'Enter username';
	String get required => 'Username is required!';
}

// Path: auth.fullName
class _StringsAuthFullNameEn {
	_StringsAuthFullNameEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Full name';
	String get hint => 'Enter full name';
	String get required => 'Full name is required!';
}

// Path: auth.confirmPassword
class _StringsAuthConfirmPasswordEn {
	_StringsAuthConfirmPasswordEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Confirm password';
	String get hint => 'Enter confirm password';
	String get required => 'Confirm password is required!';
	String get notMatch => 'Password is not match';
}

// Path: settings.language
class _StringsSettingsLanguageEn {
	_StringsSettingsLanguageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Language';
	String get english => 'English';
	String get vietnamese => 'Vietnamese';
}

// Path: profile.gender
class _StringsProfileGenderEn {
	_StringsProfileGenderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Gender';
	String get hint => 'Select gender';
	String get female => 'Female';
	String get male => 'Male';
}

// Path: profile.role
class _StringsProfileRoleEn {
	_StringsProfileRoleEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Role';
	String get hint => 'Select role';
	String get farmer => 'Farmer';
	String get expert => 'Expert';
}

// Path: upsertMyCrop.cropType
class _StringsUpsertMyCropCropTypeEn {
	_StringsUpsertMyCropCropTypeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get other => 'Other';
	String get otherHint => 'Enter crop name (optional)';
	String get required => 'Crop type is required!';
}

// Path: upsertMyCrop.crop
class _StringsUpsertMyCropCropEn {
	_StringsUpsertMyCropCropEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Crop';
	String get hint => 'Select crop';
	String get otherHint => 'Enter crop name';
	String get required => 'Crop is required!';
}

// Path: upsertMyCrop.startDate
class _StringsUpsertMyCropStartDateEn {
	_StringsUpsertMyCropStartDateEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Start date';
	String get hint => 'Choose start date to do';
	String get required => 'Haven\'t choosen start date';
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
	@override late final _StringsMainVi main = _StringsMainVi._(_root);
	@override late final _StringsCommonVi common = _StringsCommonVi._(_root);
	@override late final _StringsErrorVi error = _StringsErrorVi._(_root);
	@override late final _StringsOnboardingVi onboarding = _StringsOnboardingVi._(_root);
	@override late final _StringsHomeVi home = _StringsHomeVi._(_root);
	@override late final _StringsCropsVi crops = _StringsCropsVi._(_root);
	@override late final _StringsDetailCropVi detailCrop = _StringsDetailCropVi._(_root);
	@override late final _StringsAuthVi auth = _StringsAuthVi._(_root);
	@override late final _StringsSettingsVi settings = _StringsSettingsVi._(_root);
	@override late final _StringsProfileVi profile = _StringsProfileVi._(_root);
	@override late final _StringsMyCropsVi myCrops = _StringsMyCropsVi._(_root);
	@override late final _StringsUpsertMyCropVi upsertMyCrop = _StringsUpsertMyCropVi._(_root);
	@override late final _StringsMyCropDetailVi myCropDetail = _StringsMyCropDetailVi._(_root);
}

// Path: main
class _StringsMainVi implements _StringsMainEn {
	_StringsMainVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Trang chủ';
	@override String get crops => 'Cây trồng';
	@override String get myCrops => 'Cây trồng của tôi';
	@override String get settings => 'Cài đặt';
}

// Path: common
class _StringsCommonVi implements _StringsCommonEn {
	_StringsCommonVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get filter => 'Bộ lọc';
	@override late final _StringsCommonButtonVi button = _StringsCommonButtonVi._(_root);
	@override late final _StringsCommonReactionVi reaction = _StringsCommonReactionVi._(_root);
	@override String get dataNotFound => 'Dữ liệu không được tìm thấy';
	@override late final _StringsCommonDateTimeVi dateTime = _StringsCommonDateTimeVi._(_root);
	@override String get getPhoto => 'Cách lấy ảnh';
	@override String get camera => 'Máy ảnh';
	@override String get gallery => 'Thư viện';
	@override String get oops => 'Oops!';
	@override late final _StringsCommonPermissionVi permission_ = _StringsCommonPermissionVi._(_root);
}

// Path: error
class _StringsErrorVi implements _StringsErrorEn {
	_StringsErrorVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get error => 'Lỗi rồi!!!';
	@override String get illegalData => 'Dữ liệu không hợp lệ';
	@override String get noNetwork => 'Không có kết nối internet';
	@override String get unknown => 'Đã có lỗi xảy ra';
	@override String get permissionDenied => 'Quyền truy cập bị từ chối';
	@override String get processingError => 'Có lỗi xảy ra khi chuyển đổi';
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
	@override String get writeComment => 'Viết bình luận...';
}

// Path: auth
class _StringsAuthVi implements _StringsAuthEn {
	_StringsAuthVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get login => 'Đăng nhập';
	@override late final _StringsAuthEmailVi email = _StringsAuthEmailVi._(_root);
	@override late final _StringsAuthPasswordVi password = _StringsAuthPasswordVi._(_root);
	@override String get forgotPassword => 'Quên mật khẩu';
	@override String get haveNotAnAccount => 'Chưa có tài khoản? ';
	@override String get or => 'HOẶC';
	@override String get loginWithGoogle => 'Đăng nhập với Google';
	@override String get loginWithFacebook => 'Đăng nhập với Facebook';
	@override String get register => 'Đăng ký';
	@override late final _StringsAuthUsernameVi username = _StringsAuthUsernameVi._(_root);
	@override late final _StringsAuthFullNameVi fullName = _StringsAuthFullNameVi._(_root);
	@override late final _StringsAuthConfirmPasswordVi confirmPassword = _StringsAuthConfirmPasswordVi._(_root);
}

// Path: settings
class _StringsSettingsVi implements _StringsSettingsEn {
	_StringsSettingsVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cài đặt';
	@override String get logout => 'Đăng xuất';
	@override late final _StringsSettingsLanguageVi language = _StringsSettingsLanguageVi._(_root);
	@override String get generalAmenities => 'Tiện ích chung';
}

// Path: profile
class _StringsProfileVi implements _StringsProfileEn {
	_StringsProfileVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Thông tin cá nhân';
	@override late final _StringsProfileGenderVi gender = _StringsProfileGenderVi._(_root);
	@override late final _StringsProfileRoleVi role = _StringsProfileRoleVi._(_root);
}

// Path: myCrops
class _StringsMyCropsVi implements _StringsMyCropsEn {
	_StringsMyCropsVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override List<String> get status => [
		'Đã hoàn thành',
		'Đang thực hiện',
		'Chưa thực hiện',
		'Đã xoá',
	];
	@override String get type => 'Loại:';
	@override String get date => 'Ngày:';
	@override String get complete => 'Hoàn thành';
	@override String get perform => 'Thực hiện';
	@override String get cancel => 'Xoá bỏ';
	@override String get haveNotCreateCrop => 'Bạn chưa tạo hồ sơ cây trồng!';
	@override String get now => 'Nay';
}

// Path: upsertMyCrop
class _StringsUpsertMyCropVi implements _StringsUpsertMyCropEn {
	_StringsUpsertMyCropVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tạo hồ sơ cây trồng';
	@override late final _StringsUpsertMyCropCropTypeVi cropType = _StringsUpsertMyCropCropTypeVi._(_root);
	@override late final _StringsUpsertMyCropCropVi crop = _StringsUpsertMyCropCropVi._(_root);
	@override String get initialStatus => 'Trạng thái ban đầu';
	@override String get status => 'Trạng thái';
	@override String get allTask => 'CÁC NHIỆM VỤ';
	@override String get yourPreparation => 'Sự chuẩn bị của bạn:';
	@override String get suggestionTask => 'Một số nhiệm vụ được gợi ý, bạn có thể chọn:';
	@override String get updateCropProfile => 'Cập nhật hồ sơ cây trồng';
	@override String get cancelDes => 'Bạn có chắc muốn huỷ bỏ cây trồng này không?';
	@override String get carryOutPlantingDes => 'Bạn có chắc chắn muốn tiến hành trồng cây trồng này không?';
	@override String get createCropDes => 'Bạn có chắc chắn muốn tạo hồ sơ cây trồng này không?';
	@override String get updateCropDes => 'Bạn có chắc chắn muốn cập nhật hồ sơ cây trồng này không?';
	@override late final _StringsUpsertMyCropStartDateVi startDate = _StringsUpsertMyCropStartDateVi._(_root);
}

// Path: myCropDetail
class _StringsMyCropDetailVi implements _StringsMyCropDetailEn {
	_StringsMyCropDetailVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hồ sơ cây trồng của tôi';
}

// Path: common.button
class _StringsCommonButtonVi implements _StringsCommonButtonEn {
	_StringsCommonButtonVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get reset => 'Đặt lại';
	@override String get apply => 'Áp dụng';
	@override String get delete => 'Xoá';
	@override String get reply => 'Trả lời';
	@override String get cancel => 'Bỏ qua';
	@override String get ok => 'Đồng ý';
	@override String get edit => 'Chỉnh sửa';
	@override String get openSettings => 'Mở cài đặt';
	@override String get update => 'Cập nhật';
	@override String get create => 'Tạo';
	@override String get add => 'Thêm';
}

// Path: common.reaction
class _StringsCommonReactionVi implements _StringsCommonReactionEn {
	_StringsCommonReactionVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get like => 'Thích';
	@override String get favorite => 'Yêu thích';
	@override String get satisfied => 'Hài lòng';
	@override String get unsatisfied => 'Không hài lòng';
}

// Path: common.dateTime
class _StringsCommonDateTimeVi implements _StringsCommonDateTimeEn {
	_StringsCommonDateTimeVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get year => 'năm';
	@override String get month => 'tháng';
	@override String get week => 'tuần';
	@override String get today => 'Hôm nay';
	@override String get ago => 'trước';
	@override String get hour => 'giờ';
	@override String get minute => 'phút';
	@override String get justNow => 'bây giờ';
}

// Path: common.permission_
class _StringsCommonPermissionVi implements _StringsCommonPermissionEn {
	_StringsCommonPermissionVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get cameraMsgIos => 'Chúng tôi không thể truy cập máy ảnh. Vui lòng xóa mọi hạn chế đối với máy ảnh để tiếp tục (Cài đặt ➔ Post Reader ➔ Cho phép truy cập Máy ảnh).';
	@override String get cameraMsgAndroid => 'Chúng tôi không thể truy cập máy ảnh. Vui lòng xóa mọi hạn chế đối với máy ảnh để tiếp tục (Cài đặt ➔ Ứng dụng ➔ Post Reader ➔ Quyền ➔ Cho phép truy cập Máy ảnh).';
	@override String get photoMsgIos => 'Chúng tôi không thể truy cập Ảnh. Vui lòng xóa mọi hạn chế đối với Ảnh để tiếp tục (Cài đặt ➔ Post Reader ➔ Cho phép truy cập Ảnh).';
	@override String get photoMsgAndroid => 'Chúng tôi không thể truy cập Bộ sưu tập. Vui lòng xóa mọi hạn chế đối với Bộ sưu tập để tiếp tục (Cài đặt ➔ Ứng dụng ➔ Post Reader ➔ Quyền ➔ Cho phép truy cập Ảnh).';
	@override String get locationServicesAreDisabled => 'Dịch vụ định vị bị vô hiệu hóa.';
	@override String get permissionDenied => 'Quyền bị từ chối';
	@override String get permissionDeniedForever => 'Quyền bị từ chối mãi mãi.';
	@override String get permissionGranted => 'Đã được cho phép.';
	@override String get locationNotAvailable => 'Vị trí không có sẵn';
	@override String get unableToDetermine => 'Không thể xác định';
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

// Path: auth.email
class _StringsAuthEmailVi implements _StringsAuthEmailEn {
	_StringsAuthEmailVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get hint => 'Nhập email';
	@override String get required => 'Email là bắt buộc!';
}

// Path: auth.password
class _StringsAuthPasswordVi implements _StringsAuthPasswordEn {
	_StringsAuthPasswordVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Mật khẩu';
	@override String get hint => 'Nhập mật khẩu';
	@override String get required => 'Mật khẩu là bắt buộc!';
	@override String get isAtLeast8Characters => 'Mật khẩu phải ít nhất 8 kí tự';
	@override String get isNotValid => 'Mật khẩu không hợp lệ';
}

// Path: auth.username
class _StringsAuthUsernameVi implements _StringsAuthUsernameEn {
	_StringsAuthUsernameVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Tên người dùng';
	@override String get hint => 'Nhập tên người dùng';
	@override String get required => 'Tên người dùng là bắt buộc!';
}

// Path: auth.fullName
class _StringsAuthFullNameVi implements _StringsAuthFullNameEn {
	_StringsAuthFullNameVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Họ và tên';
	@override String get hint => 'Nhập họ và tên';
	@override String get required => 'Họ và tên là bắt buộc!';
}

// Path: auth.confirmPassword
class _StringsAuthConfirmPasswordVi implements _StringsAuthConfirmPasswordEn {
	_StringsAuthConfirmPasswordVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Xác nhận mật khẩu';
	@override String get hint => 'Nhập xác nhận mật khẩu';
	@override String get required => 'Xác nhận mật khẩu là bắt buộc!';
	@override String get notMatch => 'Mật khẩu không khớp';
}

// Path: settings.language
class _StringsSettingsLanguageVi implements _StringsSettingsLanguageEn {
	_StringsSettingsLanguageVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ngôn ngữ';
	@override String get english => 'Tiếng Anh';
	@override String get vietnamese => 'Tiếng Việt';
}

// Path: profile.gender
class _StringsProfileGenderVi implements _StringsProfileGenderEn {
	_StringsProfileGenderVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Giới tính';
	@override String get hint => 'Chọn giới tính';
	@override String get female => 'Nữ';
	@override String get male => 'Nam';
}

// Path: profile.role
class _StringsProfileRoleVi implements _StringsProfileRoleEn {
	_StringsProfileRoleVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Vai trò';
	@override String get hint => 'Chọn vai trò';
	@override String get farmer => 'Nông dân';
	@override String get expert => 'Chuyên gia';
}

// Path: upsertMyCrop.cropType
class _StringsUpsertMyCropCropTypeVi implements _StringsUpsertMyCropCropTypeEn {
	_StringsUpsertMyCropCropTypeVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get other => 'Khác';
	@override String get otherHint => 'Nhập loại cây trồng (không bắt buộc)';
	@override String get required => 'Loại cây trồng là bắt buộc!';
}

// Path: upsertMyCrop.crop
class _StringsUpsertMyCropCropVi implements _StringsUpsertMyCropCropEn {
	_StringsUpsertMyCropCropVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Cây trồng';
	@override String get hint => 'Chọn cây trồng';
	@override String get otherHint => 'Nhập tên cây trồng';
	@override String get required => 'Cây trồng là bắt buộc!';
}

// Path: upsertMyCrop.startDate
class _StringsUpsertMyCropStartDateVi implements _StringsUpsertMyCropStartDateEn {
	_StringsUpsertMyCropStartDateVi._(this._root);

	@override final _StringsVi _root; // ignore: unused_field

	// Translations
	@override String get label => 'Ngày bắt đầu';
	@override String get hint => 'Chọn ngày bắt đầu để thực hiện';
	@override String get required => 'Chưa chọn ngày bắt đầu';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Agriculture App';
			case 'main.home': return 'Home';
			case 'main.crops': return 'Crops';
			case 'main.myCrops': return 'My crops';
			case 'main.settings': return 'Settings';
			case 'common.filter': return 'Filter';
			case 'common.button.reset': return 'Reset';
			case 'common.button.apply': return 'Apply';
			case 'common.button.delete': return 'Delete';
			case 'common.button.reply': return 'Reply';
			case 'common.button.cancel': return 'Cancel';
			case 'common.button.ok': return 'Ok';
			case 'common.button.edit': return 'Edit';
			case 'common.button.openSettings': return 'Open settings';
			case 'common.button.update': return 'Update';
			case 'common.button.create': return 'Create';
			case 'common.button.add': return 'Add';
			case 'common.reaction.like': return 'Like';
			case 'common.reaction.favorite': return 'Favorite';
			case 'common.reaction.satisfied': return 'Satisfied';
			case 'common.reaction.unsatisfied': return 'Unsatisfied';
			case 'common.dataNotFound': return 'Data not found';
			case 'common.dateTime.year': return 'year';
			case 'common.dateTime.month': return 'month';
			case 'common.dateTime.week': return 'week';
			case 'common.dateTime.today': return 'Today';
			case 'common.dateTime.ago': return 'ago';
			case 'common.dateTime.hour': return 'hour';
			case 'common.dateTime.minute': return 'minute';
			case 'common.dateTime.justNow': return 'just now';
			case 'common.getPhoto': return 'Get photo';
			case 'common.camera': return 'Camera';
			case 'common.gallery': return 'Gallery';
			case 'common.oops': return 'Oops!';
			case 'common.permission_.cameraMsgIos': return 'We could not access your camera. Please remove any restrictions on the camera to continue (Settings ➔ Post Reader ➔ Enable Camera).';
			case 'common.permission_.cameraMsgAndroid': return 'We could not access your camera. Please remove any restrictions on the camera to continue (Settings ➔ Apps ➔ Post Reader ➔ Permissions ➔ Enable Camera).';
			case 'common.permission_.photoMsgIos': return 'We could not access your photos. Please remove any restrictions on the photos to continue (Settings ➔ Post Reader ➔ Enable Photos).';
			case 'common.permission_.photoMsgAndroid': return 'We could not access your gallery. Please remove any restrictions on the gallery to continue (Settings ➔ Apps ➔ Post Reader ➔ Permissions ➔ Enable Photos).';
			case 'common.permission_.locationServicesAreDisabled': return 'Location services are disabled.';
			case 'common.permission_.permissionDenied': return 'Permission denied.';
			case 'common.permission_.permissionDeniedForever': return 'Permission denied forever.';
			case 'common.permission_.permissionGranted': return 'Permission granted.';
			case 'common.permission_.locationNotAvailable': return 'Location Not Available';
			case 'common.permission_.unableToDetermine': return 'Unable to determine';
			case 'error.error': return 'Error!!!';
			case 'error.illegalData': return 'Wrong data format';
			case 'error.noNetwork': return 'No internet connection';
			case 'error.unknown': return 'An Unexpected Error Occurred';
			case 'error.permissionDenied': return 'Permission denied';
			case 'error.processingError': return 'Error while processing';
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
			case 'detailCrop.writeComment': return 'Write comment...';
			case 'auth.login': return 'Login';
			case 'auth.email.label': return 'Email';
			case 'auth.email.hint': return 'Enter email';
			case 'auth.email.required': return 'Email is required!';
			case 'auth.password.label': return 'Password';
			case 'auth.password.hint': return 'Enter password';
			case 'auth.password.required': return 'Password is required!';
			case 'auth.password.isAtLeast8Characters': return 'Password is at least 8 characters';
			case 'auth.password.isNotValid': return 'Password is not valid';
			case 'auth.forgotPassword': return 'Forgot password';
			case 'auth.haveNotAnAccount': return 'Haven\'t an account? ';
			case 'auth.or': return 'OR';
			case 'auth.loginWithGoogle': return 'Login with Google';
			case 'auth.loginWithFacebook': return 'Login with Facebook';
			case 'auth.register': return 'Register';
			case 'auth.username.label': return 'Username';
			case 'auth.username.hint': return 'Enter username';
			case 'auth.username.required': return 'Username is required!';
			case 'auth.fullName.label': return 'Full name';
			case 'auth.fullName.hint': return 'Enter full name';
			case 'auth.fullName.required': return 'Full name is required!';
			case 'auth.confirmPassword.label': return 'Confirm password';
			case 'auth.confirmPassword.hint': return 'Enter confirm password';
			case 'auth.confirmPassword.required': return 'Confirm password is required!';
			case 'auth.confirmPassword.notMatch': return 'Password is not match';
			case 'settings.title': return 'Settings';
			case 'settings.logout': return 'Logout';
			case 'settings.language.title': return 'Language';
			case 'settings.language.english': return 'English';
			case 'settings.language.vietnamese': return 'Vietnamese';
			case 'settings.generalAmenities': return 'General amenities';
			case 'profile.title': return 'Profile';
			case 'profile.gender.label': return 'Gender';
			case 'profile.gender.hint': return 'Select gender';
			case 'profile.gender.female': return 'Female';
			case 'profile.gender.male': return 'Male';
			case 'profile.role.label': return 'Role';
			case 'profile.role.hint': return 'Select role';
			case 'profile.role.farmer': return 'Farmer';
			case 'profile.role.expert': return 'Expert';
			case 'myCrops.status.0': return 'Completed';
			case 'myCrops.status.1': return 'Inprogress';
			case 'myCrops.status.2': return 'To do';
			case 'myCrops.status.3': return 'Cancel';
			case 'myCrops.type': return 'Type:';
			case 'myCrops.date': return 'Date:';
			case 'myCrops.complete': return 'Complete';
			case 'myCrops.perform': return 'Perform';
			case 'myCrops.cancel': return 'Cancel';
			case 'myCrops.haveNotCreateCrop': return 'You haven\'t created a crop profile yet!';
			case 'myCrops.now': return 'Now';
			case 'upsertMyCrop.title': return 'Create crop profile';
			case 'upsertMyCrop.cropType.other': return 'Other';
			case 'upsertMyCrop.cropType.otherHint': return 'Enter crop name (optional)';
			case 'upsertMyCrop.cropType.required': return 'Crop type is required!';
			case 'upsertMyCrop.crop.label': return 'Crop';
			case 'upsertMyCrop.crop.hint': return 'Select crop';
			case 'upsertMyCrop.crop.otherHint': return 'Enter crop name';
			case 'upsertMyCrop.crop.required': return 'Crop is required!';
			case 'upsertMyCrop.initialStatus': return 'Initial status';
			case 'upsertMyCrop.status': return 'Status';
			case 'upsertMyCrop.allTask': return 'ALL TASKS';
			case 'upsertMyCrop.yourPreparation': return 'Your preparation (optional):';
			case 'upsertMyCrop.suggestionTask': return 'Some suggestion tasks, you choose:';
			case 'upsertMyCrop.updateCropProfile': return 'Update crop profile';
			case 'upsertMyCrop.cancelDes': return 'Are you sure want to cancel this crop?';
			case 'upsertMyCrop.carryOutPlantingDes': return 'Are you sure want to carry out planting this crop?';
			case 'upsertMyCrop.createCropDes': return 'Are you sure you want to create this crop profile?';
			case 'upsertMyCrop.updateCropDes': return 'Are you sure you want to update this crop?';
			case 'upsertMyCrop.startDate.label': return 'Start date';
			case 'upsertMyCrop.startDate.hint': return 'Choose start date to do';
			case 'upsertMyCrop.startDate.required': return 'Haven\'t choosen start date';
			case 'myCropDetail.title': return 'My crop profile';
			default: return null;
		}
	}
}

extension on _StringsVi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Agriculture App';
			case 'main.home': return 'Trang chủ';
			case 'main.crops': return 'Cây trồng';
			case 'main.myCrops': return 'Cây trồng của tôi';
			case 'main.settings': return 'Cài đặt';
			case 'common.filter': return 'Bộ lọc';
			case 'common.button.reset': return 'Đặt lại';
			case 'common.button.apply': return 'Áp dụng';
			case 'common.button.delete': return 'Xoá';
			case 'common.button.reply': return 'Trả lời';
			case 'common.button.cancel': return 'Bỏ qua';
			case 'common.button.ok': return 'Đồng ý';
			case 'common.button.edit': return 'Chỉnh sửa';
			case 'common.button.openSettings': return 'Mở cài đặt';
			case 'common.button.update': return 'Cập nhật';
			case 'common.button.create': return 'Tạo';
			case 'common.button.add': return 'Thêm';
			case 'common.reaction.like': return 'Thích';
			case 'common.reaction.favorite': return 'Yêu thích';
			case 'common.reaction.satisfied': return 'Hài lòng';
			case 'common.reaction.unsatisfied': return 'Không hài lòng';
			case 'common.dataNotFound': return 'Dữ liệu không được tìm thấy';
			case 'common.dateTime.year': return 'năm';
			case 'common.dateTime.month': return 'tháng';
			case 'common.dateTime.week': return 'tuần';
			case 'common.dateTime.today': return 'Hôm nay';
			case 'common.dateTime.ago': return 'trước';
			case 'common.dateTime.hour': return 'giờ';
			case 'common.dateTime.minute': return 'phút';
			case 'common.dateTime.justNow': return 'bây giờ';
			case 'common.getPhoto': return 'Cách lấy ảnh';
			case 'common.camera': return 'Máy ảnh';
			case 'common.gallery': return 'Thư viện';
			case 'common.oops': return 'Oops!';
			case 'common.permission_.cameraMsgIos': return 'Chúng tôi không thể truy cập máy ảnh. Vui lòng xóa mọi hạn chế đối với máy ảnh để tiếp tục (Cài đặt ➔ Post Reader ➔ Cho phép truy cập Máy ảnh).';
			case 'common.permission_.cameraMsgAndroid': return 'Chúng tôi không thể truy cập máy ảnh. Vui lòng xóa mọi hạn chế đối với máy ảnh để tiếp tục (Cài đặt ➔ Ứng dụng ➔ Post Reader ➔ Quyền ➔ Cho phép truy cập Máy ảnh).';
			case 'common.permission_.photoMsgIos': return 'Chúng tôi không thể truy cập Ảnh. Vui lòng xóa mọi hạn chế đối với Ảnh để tiếp tục (Cài đặt ➔ Post Reader ➔ Cho phép truy cập Ảnh).';
			case 'common.permission_.photoMsgAndroid': return 'Chúng tôi không thể truy cập Bộ sưu tập. Vui lòng xóa mọi hạn chế đối với Bộ sưu tập để tiếp tục (Cài đặt ➔ Ứng dụng ➔ Post Reader ➔ Quyền ➔ Cho phép truy cập Ảnh).';
			case 'common.permission_.locationServicesAreDisabled': return 'Dịch vụ định vị bị vô hiệu hóa.';
			case 'common.permission_.permissionDenied': return 'Quyền bị từ chối';
			case 'common.permission_.permissionDeniedForever': return 'Quyền bị từ chối mãi mãi.';
			case 'common.permission_.permissionGranted': return 'Đã được cho phép.';
			case 'common.permission_.locationNotAvailable': return 'Vị trí không có sẵn';
			case 'common.permission_.unableToDetermine': return 'Không thể xác định';
			case 'error.error': return 'Lỗi rồi!!!';
			case 'error.illegalData': return 'Dữ liệu không hợp lệ';
			case 'error.noNetwork': return 'Không có kết nối internet';
			case 'error.unknown': return 'Đã có lỗi xảy ra';
			case 'error.permissionDenied': return 'Quyền truy cập bị từ chối';
			case 'error.processingError': return 'Có lỗi xảy ra khi chuyển đổi';
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
			case 'detailCrop.writeComment': return 'Viết bình luận...';
			case 'auth.login': return 'Đăng nhập';
			case 'auth.email.label': return 'Email';
			case 'auth.email.hint': return 'Nhập email';
			case 'auth.email.required': return 'Email là bắt buộc!';
			case 'auth.password.label': return 'Mật khẩu';
			case 'auth.password.hint': return 'Nhập mật khẩu';
			case 'auth.password.required': return 'Mật khẩu là bắt buộc!';
			case 'auth.password.isAtLeast8Characters': return 'Mật khẩu phải ít nhất 8 kí tự';
			case 'auth.password.isNotValid': return 'Mật khẩu không hợp lệ';
			case 'auth.forgotPassword': return 'Quên mật khẩu';
			case 'auth.haveNotAnAccount': return 'Chưa có tài khoản? ';
			case 'auth.or': return 'HOẶC';
			case 'auth.loginWithGoogle': return 'Đăng nhập với Google';
			case 'auth.loginWithFacebook': return 'Đăng nhập với Facebook';
			case 'auth.register': return 'Đăng ký';
			case 'auth.username.label': return 'Tên người dùng';
			case 'auth.username.hint': return 'Nhập tên người dùng';
			case 'auth.username.required': return 'Tên người dùng là bắt buộc!';
			case 'auth.fullName.label': return 'Họ và tên';
			case 'auth.fullName.hint': return 'Nhập họ và tên';
			case 'auth.fullName.required': return 'Họ và tên là bắt buộc!';
			case 'auth.confirmPassword.label': return 'Xác nhận mật khẩu';
			case 'auth.confirmPassword.hint': return 'Nhập xác nhận mật khẩu';
			case 'auth.confirmPassword.required': return 'Xác nhận mật khẩu là bắt buộc!';
			case 'auth.confirmPassword.notMatch': return 'Mật khẩu không khớp';
			case 'settings.title': return 'Cài đặt';
			case 'settings.logout': return 'Đăng xuất';
			case 'settings.language.title': return 'Ngôn ngữ';
			case 'settings.language.english': return 'Tiếng Anh';
			case 'settings.language.vietnamese': return 'Tiếng Việt';
			case 'settings.generalAmenities': return 'Tiện ích chung';
			case 'profile.title': return 'Thông tin cá nhân';
			case 'profile.gender.label': return 'Giới tính';
			case 'profile.gender.hint': return 'Chọn giới tính';
			case 'profile.gender.female': return 'Nữ';
			case 'profile.gender.male': return 'Nam';
			case 'profile.role.label': return 'Vai trò';
			case 'profile.role.hint': return 'Chọn vai trò';
			case 'profile.role.farmer': return 'Nông dân';
			case 'profile.role.expert': return 'Chuyên gia';
			case 'myCrops.status.0': return 'Đã hoàn thành';
			case 'myCrops.status.1': return 'Đang thực hiện';
			case 'myCrops.status.2': return 'Chưa thực hiện';
			case 'myCrops.status.3': return 'Đã xoá';
			case 'myCrops.type': return 'Loại:';
			case 'myCrops.date': return 'Ngày:';
			case 'myCrops.complete': return 'Hoàn thành';
			case 'myCrops.perform': return 'Thực hiện';
			case 'myCrops.cancel': return 'Xoá bỏ';
			case 'myCrops.haveNotCreateCrop': return 'Bạn chưa tạo hồ sơ cây trồng!';
			case 'myCrops.now': return 'Nay';
			case 'upsertMyCrop.title': return 'Tạo hồ sơ cây trồng';
			case 'upsertMyCrop.cropType.other': return 'Khác';
			case 'upsertMyCrop.cropType.otherHint': return 'Nhập loại cây trồng (không bắt buộc)';
			case 'upsertMyCrop.cropType.required': return 'Loại cây trồng là bắt buộc!';
			case 'upsertMyCrop.crop.label': return 'Cây trồng';
			case 'upsertMyCrop.crop.hint': return 'Chọn cây trồng';
			case 'upsertMyCrop.crop.otherHint': return 'Nhập tên cây trồng';
			case 'upsertMyCrop.crop.required': return 'Cây trồng là bắt buộc!';
			case 'upsertMyCrop.initialStatus': return 'Trạng thái ban đầu';
			case 'upsertMyCrop.status': return 'Trạng thái';
			case 'upsertMyCrop.allTask': return 'CÁC NHIỆM VỤ';
			case 'upsertMyCrop.yourPreparation': return 'Sự chuẩn bị của bạn:';
			case 'upsertMyCrop.suggestionTask': return 'Một số nhiệm vụ được gợi ý, bạn có thể chọn:';
			case 'upsertMyCrop.updateCropProfile': return 'Cập nhật hồ sơ cây trồng';
			case 'upsertMyCrop.cancelDes': return 'Bạn có chắc muốn huỷ bỏ cây trồng này không?';
			case 'upsertMyCrop.carryOutPlantingDes': return 'Bạn có chắc chắn muốn tiến hành trồng cây trồng này không?';
			case 'upsertMyCrop.createCropDes': return 'Bạn có chắc chắn muốn tạo hồ sơ cây trồng này không?';
			case 'upsertMyCrop.updateCropDes': return 'Bạn có chắc chắn muốn cập nhật hồ sơ cây trồng này không?';
			case 'upsertMyCrop.startDate.label': return 'Ngày bắt đầu';
			case 'upsertMyCrop.startDate.hint': return 'Chọn ngày bắt đầu để thực hiện';
			case 'upsertMyCrop.startDate.required': return 'Chưa chọn ngày bắt đầu';
			case 'myCropDetail.title': return 'Hồ sơ cây trồng của tôi';
			default: return null;
		}
	}
}
