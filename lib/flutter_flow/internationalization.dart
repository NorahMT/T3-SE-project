import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'pwgwj3ze': {
      'en': 'Welcome Back,',
      'ar': '',
    },
    'dvo11jjn': {
      'en': 'Email Address',
      'ar': '',
    },
    '4ralgwrb': {
      'en': 'Enter your email here...',
      'ar': '',
    },
    '683dtx63': {
      'en': 'Password',
      'ar': '',
    },
    '3x9v3p7l': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    'zr0jatn1': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    'sjck1c74': {
      'en': 'Login',
      'ar': '',
    },
    'sbyja0bb': {
      'en': 'Create Account',
      'ar': '',
    },
    '0irbwvr1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Headpage
  {
    'jbjum51a': {
      'en': 'Study With Us!',
      'ar': '',
    },
    'bgzvils0': {
      'en':
          'BrainTech is here to help tech students by providing \ndifferent learning materials from trusted sources,\n join us to help you with your journey! ',
      'ar': '',
    },
    '8vny8tx2': {
      'en': 'Login',
      'ar': '',
    },
    'a4x8cr1m': {
      'en': 'OR',
      'ar': '',
    },
    'm4hfdo8e': {
      'en': 'Creat an account',
      'ar': '',
    },
    'wnu3wyz7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // courses
  {
    'pwihcegu': {
      'en': 'Courses',
      'ar': '',
    },
    '22hg9qo8': {
      'en': 'Introduction To Programming',
      'ar': '',
    },
    'zvqg4w0t': {
      'en': '50%',
      'ar': '',
    },
    'zbs2f8ud': {
      'en': 'Oriented Objective\n Programming',
      'ar': '',
    },
    'qz0sf1gg': {
      'en': '50%',
      'ar': '',
    },
    'g0zn8vka': {
      'en': 'Data Structures',
      'ar': '',
    },
    'p9y0gw2j': {
      'en': '50%',
      'ar': '',
    },
    'vhotuz5m': {
      'en': 'Home',
      'ar': '',
    },
  },
  // creatAccount
  {
    '1nf45epv': {
      'en': 'Get Started',
      'ar': '',
    },
    'olpj20ts': {
      'en': 'Email Address',
      'ar': '',
    },
    'rm2cji4e': {
      'en': 'Enter your email here...',
      'ar': '',
    },
    'lyuj1eum': {
      'en': 'Password',
      'ar': '',
    },
    'tumpoeu1': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    '5t4inza4': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '75est7lp': {
      'en': 'Confirm your password here...',
      'ar': '',
    },
    's1mlqd5f': {
      'en': 'Name',
      'ar': '',
    },
    'w53mri6i': {
      'en': 'Enter your name here...',
      'ar': '',
    },
    'wqe984e4': {
      'en': 'Log In',
      'ar': '',
    },
    '0afs59o8': {
      'en': 'Create Account',
      'ar': '',
    },
    '03vcq5ub': {
      'en': 'Home',
      'ar': '',
    },
  },
  // resetPassword
  {
    '2hewbons': {
      'en': 'Back',
      'ar': '',
    },
    'olzpzsx7': {
      'en': 'Forgot Password',
      'ar': '',
    },
    '5npq0o8h': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
    },
    '9vc8eouw': {
      'en': 'Your email address...',
      'ar': '',
    },
    'bkjvtk2k': {
      'en': 'Enter your email...',
      'ar': '',
    },
    'chjrnv19': {
      'en': 'Send Link',
      'ar': '',
    },
    'g8u7xnem': {
      'en': 'Home',
      'ar': '',
    },
  },
  // learningMaterial
  {
    'izjve8pq': {
      'en': 'Videos',
      'ar': '',
    },
    're7iev9l': {
      'en': 'Search...',
      'ar': '',
    },
    'abkwietn': {
      'en': '4.25',
      'ar': '',
    },
    '8eu3uvv7': {
      'en': 'Library',
      'ar': '',
    },
    'vte7k7uw': {
      'en': 'Work in progress',
      'ar': '',
    },
    'pb1gd9rx': {
      'en': '..',
      'ar': '',
    },
    'hd4za60d': {
      'en': '4.25',
      'ar': '',
    },
    'ovxekbdu': {
      'en': 'Work in progress',
      'ar': '',
    },
    'rloaxi0p': {
      'en': '..',
      'ar': '',
    },
    'xc7ufbx7': {
      'en': '4.25',
      'ar': '',
    },
    'np9dlssz': {
      'en': 'Quizzez',
      'ar': '',
    },
    'vlgx52c1': {
      'en': 'Work in progress',
      'ar': '',
    },
    '4a6l0dy5': {
      'en': '..',
      'ar': '',
    },
    'ecxl2hs9': {
      'en': '4.25',
      'ar': '',
    },
    'kza27gk4': {
      'en': 'Work in progress',
      'ar': '',
    },
    '0izvb8br': {
      'en': '..',
      'ar': '',
    },
    'v3rduioc': {
      'en': '4.25',
      'ar': '',
    },
    '6wuplzal': {
      'en': 'Introduction to Programming',
      'ar': '',
    },
    'me8zz08g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // menu
  {
    'h9jxnp9a': {
      'en': 'Personal Account ',
      'ar': '',
    },
    'cjm1nbyg': {
      'en': 'Favorite list',
      'ar': '',
    },
    '016mtc1b': {
      'en': 'Discussion board',
      'ar': '',
    },
    '9u75mweu': {
      'en': 'Contact us',
      'ar': '',
    },
    '51vyxsbq': {
      'en': 'Logout',
      'ar': '',
    },
  },
  // errorMsg
  {
    'ujdrgy9u': {
      'en':
          'Password must contain a letter, a number, and a minimum length of 8',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '8ybk4exj': {
      'en': '',
      'ar': '',
    },
    '59n766h5': {
      'en': '',
      'ar': '',
    },
    'kn2kelhf': {
      'en': '',
      'ar': '',
    },
    'vzl9x75j': {
      'en': '',
      'ar': '',
    },
    'esidnjzm': {
      'en': '',
      'ar': '',
    },
    'z0d8t3nh': {
      'en': '',
      'ar': '',
    },
    'j7p28aow': {
      'en': '',
      'ar': '',
    },
    '7eddq4nl': {
      'en': '',
      'ar': '',
    },
    'gk4j83nh': {
      'en': '',
      'ar': '',
    },
    'brvb1kd0': {
      'en': '',
      'ar': '',
    },
    'rrffsrqe': {
      'en': '',
      'ar': '',
    },
    'a6emqdbc': {
      'en': '',
      'ar': '',
    },
    'ivi96ze2': {
      'en': '',
      'ar': '',
    },
    '3y8vm1dp': {
      'en': '',
      'ar': '',
    },
    'ne7rjhpn': {
      'en': '',
      'ar': '',
    },
    'zqo0l9hs': {
      'en': '',
      'ar': '',
    },
    'ixowdgnv': {
      'en': '',
      'ar': '',
    },
    'm9iq5dpl': {
      'en': '',
      'ar': '',
    },
    'vewz8ums': {
      'en': '',
      'ar': '',
    },
    '2egyhe1x': {
      'en': '',
      'ar': '',
    },
    '7759tzlu': {
      'en': '',
      'ar': '',
    },
    'pf6zr0s4': {
      'en': '',
      'ar': '',
    },
    'fbabc3lb': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
