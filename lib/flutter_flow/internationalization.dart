import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fr'];

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
    String? frText = '',
  }) =>
      [enText, arText, frText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'f3t498a1': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': 'Explorer les cours',
    },
    'dr4ygcxp': {
      'en': 'Pricing Plans',
      'ar': 'خطط التسعير',
      'fr': 'Plans tarifaires',
    },
    'mryv89xh': {
      'en': 'Change Class',
      'ar': 'تغيير الامتحان',
      'fr': 'Changer d\'examen',
    },
    'ynrkfxuh': {
      'en': 'My Analysis',
      'ar': 'تحليلي',
      'fr': 'Mon analyse',
    },
    'eft5v713': {
      'en': 'Purchases',
      'ar': 'المشتريات',
      'fr': 'Achats',
    },
    'id5abqt5': {
      'en': 'Upgrade plan',
      'ar': 'خطة الترقية',
      'fr': 'Plan de mise à niveau',
    },
    'ugsdc65l': {
      'en': 'Messages',
      'ar': 'رسائل',
      'fr': 'messages',
    },
    'wix5g5p8': {
      'en': 'Need help',
      'ar': 'تحتاج مساعدة',
      'fr': 'Besoin d\'aide',
    },
    'ysaua8pq': {
      'en': 'Medrasti',
      'ar': 'ميدراستي',
      'fr': 'Médrasti',
    },
    'ws7vjz3a': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': 'Documents et vidéos',
    },
    '1sb3f3sy': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': 'Explorer les cours',
    },
    'uhhlkov9': {
      'en': 'Join Medasti',
      'ar': 'انضم إلى مداستي',
      'fr': 'Rejoignez Medasti',
    },
    'y4gdld6u': {
      'en': 'Join Medasti Premium Now',
      'ar': 'انضم إلى Medasti Premium الآن',
      'fr': 'Rejoignez Medasti Premium maintenant',
    },
    'e62s4n0o': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': 'Voir les forfaits',
    },
    'ld9o00w5': {
      'en': 'My courses',
      'ar': 'دوراتي',
      'fr': 'Mes cours',
    },
    'ejj6l5qj': {
      'en': 'View All',
      'ar': 'عرض الكل',
      'fr': 'Voir tout',
    },
    'l5quy1d1': {
      'en': 'Other Options',
      'ar': 'خيارات أخرى',
      'fr': 'Autres options',
    },
    'wzvesdkj': {
      'en': 'Pricing plans',
      'ar': 'مدخل إلى علم النفس',
      'fr': 'introduction à la psychologie',
    },
    'qb6hna97': {
      'en': 'Schedule a call with us',
      'ar': 'جدولة مكالمة معنا',
      'fr': 'Planifiez un appel avec nous',
    },
    '9whl04a0': {
      'en': 'Explore courses',
      'ar': 'استكشاف الدورات',
      'fr': 'Explorer les cours',
    },
    'ypl1u7ax': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'fr': 'FAQ',
    },
    'mzzpbpdg': {
      'en':
          'Medrasti  is a worldwide educational mobile application designed to give learners the best.',
      'ar':
          'Medrasti هو تطبيق تعليمي عالمي للهاتف المحمول مصمم لمنح المتعلمين الأفضل.',
      'fr':
          'Medrasti est une application mobile éducative mondiale conçue pour offrir le meilleur aux apprenants.',
    },
    'uu4miwy2': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // auth_3_Create
  {
    'wowwujas': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    '96y3ikkj': {
      'en': 'Let\'s get started by filling out the form ',
      'ar': 'لنبدأ بملء النموذج',
      'fr': 'Commençons par remplir le formulaire',
    },
    'l2mdlgdx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'pzb9w4n6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'aie8xyqz': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': 'Confirmez le mot de passe',
    },
    'qty5cs9u': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    'g8lkmqtd': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب؟',
      'fr': 'Vous avez déjà un compte?',
    },
    'zjd35wmj': {
      'en': 'Sign In here',
      'ar': 'تسجيل الدخول هنا',
      'fr': 'Se connecter ici',
    },
    '05d729wx': {
      'en': 'Continue with Phone',
      'ar': 'تواصل مع الهاتف',
      'fr': 'Continuer avec le téléphone',
    },
    'e4crokko': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': 'Continuer avec Google',
    },
    'n65hcdtw': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // auth_3_Login
  {
    'e31acdfw': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'danctruw': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
    },
    'rym4i3iy': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'd8h8rdhq': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'rasd7erx': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'wyitjkco': {
      'en': 'Don\'t have an account ',
      'ar': 'ليس لديك حساب',
      'fr': 'Je n\'ai pas de compte',
    },
    'z17xpnsa': {
      'en': 'Sign up here',
      'ar': 'سجل هنا',
      'fr': 'Inscrivez-vous ici',
    },
    '6243k8qb': {
      'en': 'Continue with Phone',
      'ar': 'تواصل مع الهاتف',
      'fr': 'Continuer avec le téléphone',
    },
    '6b9e1oci': {
      'en': 'Forgot Password? ',
      'ar': 'هل نسيت كلمة السر؟',
      'fr': 'Mot de passe oublié?',
    },
    '8k4v2sqr': {
      'en': 'Reset It Now',
      'ar': 'أعد ضبطه الآن',
      'fr': 'Réinitialisez-le maintenant',
    },
    'etwx99rl': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // auth_3_phone
  {
    'x5arn8df': {
      'en': 'Login with Phone',
      'ar': 'تسجيل الدخول بالهاتف',
      'fr': 'Connectez-vous avec le téléphone',
    },
    'oaih76gt': {
      'en': 'Input your number below in order to login.',
      'ar': 'أدخل رقمك أدناه لتسجيل الدخول.',
      'fr': 'Saisissez votre numéro ci-dessous pour vous connecter.',
    },
    'd1b1s27z': {
      'en': '+222',
      'ar': '',
      'fr': '',
    },
    'op3c3fek': {
      'en': 'Enter mobile number',
      'ar': '',
      'fr': '',
    },
    'zi1ls7ww': {
      'en': 'Continue',
      'ar': 'يكمل',
      'fr': 'Continuer',
    },
    '8310li6l': {
      'en': 'I agree to the Terms of use and Privacy \npolicy of medrasti',
      'ar': '',
      'fr': '',
    },
    'fgppdpm4': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // auth_3_verifyPhone
  {
    'rxd8qcdr': {
      'en': 'Verification Code',
      'ar': 'رمز التحقق',
      'fr': 'Le code de vérification',
    },
    '9vszdyir': {
      'en': 'Enter the 6 digit code that you received at: ',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي تلقيته على:',
      'fr': 'Entrez le code à 6 chiffres que vous avez reçu à :',
    },
    '4v7edpgt': {
      'en': ' change number?',
      'ar': 'تغيير رقم؟',
      'fr': 'changer de numéro ?',
    },
    '04hux788': {
      'en': 'Verify Code',
      'ar': 'التحقق من كود',
      'fr': 'Vérifier le code',
    },
    'wa2q263d': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // auth_3_ForgotPassword
  {
    'evb9gt3e': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': 'Mot de passe oublié',
    },
    '8vht0f3h': {
      'en': 'Enter your email below in order be sent a reset password link.',
      'ar':
          'أدخل بريدك الإلكتروني أدناه حتى يتم إرسال رابط إعادة تعيين كلمة المرور.',
      'fr':
          'Entrez votre e-mail ci-dessous pour recevoir un lien de réinitialisation du mot de passe.',
    },
    'axecsv6v': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
      'fr': 'Votre adresse e-mail...',
    },
    '5l85bldf': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة الضبط',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'ejkdaxgn': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // welcome
  {
    'daucxync': {
      'en': 'Prepare with courses  divided into sessions',
      'ar': 'الاستعداد مع دورات مقسمة إلى جلسات',
      'fr': 'Préparez-vous avec des cours divisés en séances',
    },
    'jk1pjnfb': {
      'en':
          'Learning sessions from the cleanest courses prepared by the best professors',
      'ar': 'جلسات تعلم من أنقى الدورات التي أعدها أفضل الأساتذة',
      'fr':
          'Séances d\'apprentissage à partir des cours les plus propres préparés par les meilleurs professeurs',
    },
    'a3cpuw43': {
      'en': 'Video lectures and notes to clarify your cconcepts',
      'ar': 'محاضرات فيديو وملاحظات لتوضيح مفاهيمك',
      'fr': 'Conférences vidéo et notes pour clarifier vos concepts',
    },
    'fdaw5r5m': {
      'en': 'Learn from the best professors with great videos and useful notes',
      'ar': 'تعلم من أفضل الأساتذة بمقاطع فيديو رائعة وملاحظات مفيدة',
      'fr':
          'Apprenez des meilleurs professeurs avec de superbes vidéos et des notes utiles',
    },
    'vb079e98': {
      'en': 'Get solutions ',
      'ar': 'احصل على الحلول',
      'fr': 'Obtenez des solutions',
    },
    'qj95stxi': {
      'en': 'Join our community of many students and professors',
      'ar': 'انضم إلى مجتمعنا الذي يضم العديد من الطلاب والأساتذة',
      'fr': 'Rejoignez notre communauté de nombreux étudiants et professeurs',
    },
    '09myj9xl': {
      'en': 'All you need in one Place pass',
      'ar': 'كل ما تحتاجه في مكان واحد',
      'fr': 'Tout ce dont vous avez besoin dans un seul pass Place',
    },
    'zpuic71l': {
      'en':
          'Pass your next exam with less effort, less time and less financial experience',
      'ar': 'اجتاز امتحانك التالي بجهد أقل ووقت أقل وخبرة مالية أقل',
      'fr':
          'Réussissez votre prochain examen avec moins d\'efforts, moins de temps et moins d\'expérience financière',
    },
    'y63hpemr': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': 'Continuer avec Google',
    },
    '0v6xx4r7': {
      'en': 'Sign up Apple',
      'ar': 'قم بالتسجيل في شركة أبل',
      'fr': 'S\'inscrire Apple',
    },
    'lfhxbcs2': {
      'en': 'Signup with Email',
      'ar': 'سجل عن طريق البريد الإلكتروني',
      'fr': 'S\'enregistrer avec l\'adresse e-mail',
    },
    'zvvifuk9': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'fr': 'Vous avez déjà un compte?',
    },
    'sc6dxkes': {
      'en': ' Sign in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'ee085z9c': {
      'en': 'Already have an account? Sign in',
      'ar': 'هل لديك حساب؟ تسجيل الدخول',
      'fr': 'Vous avez déjà un compte? Se connecter',
    },
    'gqnjkki7': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // pages
  {
    'da0yuy69': {
      'en': 'Dr. Emily Stone',
      'ar': 'دكتور إميلي ستون',
      'fr': 'Dr Emily Stone',
    },
    'p1vwjms1': {
      'en': 'emily.stone@university.edu',
      'ar': 'emily.stone@university.edu',
      'fr': 'emily.stone@university.edu',
    },
    'nyewklez': {
      'en': 'Course Overview',
      'ar': 'نظرة عامة على الدورة',
      'fr': 'Aperçu du cours',
    },
    'z36wc0p8': {
      'en': 'Introduction to Psychology',
      'ar': 'مدخل إلى علم النفس',
      'fr': 'introduction à la psychologie',
    },
    'wnjat5sy': {
      'en': 'Class Schedule',
      'ar': 'جدول الحصص',
      'fr': 'Horaire de cours',
    },
    'q2gg8t6n': {
      'en': 'Student Forum',
      'ar': 'المنتدى الطلابي',
      'fr': 'Forum étudiant',
    },
    'z4ktyayr': {
      'en': 'Assignments',
      'ar': 'تعيينات',
      'fr': 'Missions',
    },
    'iqvfy2h2': {
      'en': 'Lecture Videos',
      'ar': 'فيديوهات المحاضرات',
      'fr': 'Vidéos de conférences',
    },
    '00crk4v8': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'fr': 'FAQ',
    },
    '2x3dkxyf': {
      'en': 'Course Details',
      'ar': 'تفاصيل الدورة',
      'fr': 'Détails du cours',
    },
  },
  // profile
  {
    'qcmz2tyc': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    'tt33hhik': {
      'en': 'Upgrade',
      'ar': 'يرقي',
      'fr': 'Mise à niveau',
    },
    'lb2qogi6': {
      'en': 'Account',
      'ar': 'حساب',
      'fr': 'Compte',
    },
    '8389t992': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    'jnl8758a': {
      'en': 'Payment Options',
      'ar': 'خيارات الدفع',
      'fr': 'Options de paiement',
    },
    'cqutspv6': {
      'en': 'My Wallet',
      'ar': '',
      'fr': '',
    },
    'csz81ld8': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'fr': 'Paramètres de notification',
    },
    '8xiw1oea': {
      'en': 'Language',
      'ar': 'لغة',
      'fr': 'Langue',
    },
    '7jgi74cr': {
      'en': 'General',
      'ar': 'عام',
      'fr': 'Général',
    },
    '3t1i9dwy': {
      'en': 'Support',
      'ar': 'يدعم',
      'fr': 'Soutien',
    },
    'iqw30oiz': {
      'en': 'Terms of Service',
      'ar': 'شروط الخدمة',
      'fr': 'Conditions d\'utilisation',
    },
    '6y52vw64': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'te09zu8g': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    'a24h04g2': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
  },
  // store
  {
    '1q595n6q': {
      'en': 'Medrasti',
      'ar': 'ميدراستي',
      'fr': 'Médrasti',
    },
    'iucoxgxv': {
      'en': 'Study Packages',
      'ar': 'الحزم الدراسية',
      'fr': 'Forfaits d\'études',
    },
    'ggjoyj0i': {
      'en': 'Introduction to Programming',
      'ar': 'مقدمة في البرمجة',
      'fr': 'Introduction à la programmation',
    },
    '0bqtdjql': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': 'Documents et vidéos',
    },
    'b92zhhlh': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': 'Explorer les cours',
    },
    'sfinpbu2': {
      'en': 'Students also purchased',
      'ar': 'اشترى الطلاب أيضا',
      'fr': 'Les étudiants ont également acheté',
    },
    'kvqtti16': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': 'Développement web',
    },
    '895ss9sm': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': 'Explorer',
    },
    'mvl0bsza': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': 'Voir les forfaits',
    },
    'u1ig6wrt': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': 'Développement web',
    },
    'insiegdv': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': 'Explorer',
    },
    '8jrhbbpq': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': 'Voir les forfaits',
    },
    'quoo576n': {
      'en':
          'Medrasti  is a worldwide educational mobile application designed to give learners the best.',
      'ar':
          'Medrasti هو تطبيق تعليمي عالمي للهاتف المحمول مصمم لمنح المتعلمين الأفضل.',
      'fr':
          'Medrasti est une application mobile éducative mondiale conçue pour offrir le meilleur aux apprenants.',
    },
    '7w3zlczq': {
      'en': 'store',
      'ar': 'محل',
      'fr': 'magasin',
    },
  },
  // discount
  {
    'o6bkn19p': {
      'en': 'Discover Our Courses',
      'ar': 'اكتشف دوراتنا',
      'fr': 'Découvrez nos cours',
    },
    'wuae4phy': {
      'en':
          'Learn new skills with our expert-taught courses and save with these exclusive offers!',
      'ar':
          'تعلم مهارات جديدة من خلال دوراتنا التي يدرسها الخبراء ووفّر مع هذه العروض الحصرية!',
      'fr':
          'Apprenez de nouvelles compétences grâce à nos cours dispensés par des experts et économisez grâce à ces offres exclusives !',
    },
    'mjara1rj': {
      'en': 'Boost your brand\'s online presence',
      'ar': 'تعزيز تواجد علامتك التجارية على الإنترنت',
      'fr': 'Boostez la présence en ligne de votre marque',
    },
    'bjt627b1': {
      'en': 'Digital Marketing',
      'ar': 'التسويق الرقمي',
      'fr': 'Le marketing numérique',
    },
    'c0hfc3oz': {
      'en': '20% OFF',
      'ar': '20٪ خصم',
      'fr': 'RÉDUCTION DE 20',
    },
    'xfkjz16q': {
      'en': 'UX/UI Design',
      'ar': 'تصميم تجربة المستخدم/واجهة المستخدم',
      'fr': 'Conception UX/UI',
    },
    'vug3536b': {
      'en': 'Create stunning user interfaces',
      'ar': 'إنشاء واجهات مستخدم مذهلة',
      'fr': 'Créez des interfaces utilisateur époustouflantes',
    },
    'gif5h2vr': {
      'en': '30% OFF',
      'ar': 'تخفيض 30',
      'fr': '30% DE RÉDUCTION',
    },
    'iy8tzu3f': {
      'en': 'Photography',
      'ar': 'التصوير',
      'fr': 'La photographie',
    },
    '0vzrs5b4': {
      'en': 'Capture the world around you',
      'ar': 'التقاط العالم من حولك',
      'fr': 'Capturez le monde qui vous entoure',
    },
    'c3z5yjic': {
      'en': '15% OFF',
      'ar': 'خصم 15%',
      'fr': '15% DE RÉDUCTION',
    },
    't1hbags7': {
      'en': 'Programming Basics',
      'ar': 'أساسيات البرمجة',
      'fr': 'Bases de la programmation',
    },
    'tdw4uzmm': {
      'en': 'Start coding with essential skills',
      'ar': 'ابدأ البرمجة باستخدام المهارات الأساسية',
      'fr': 'Commencez à coder avec des compétences essentielles',
    },
    'i8h88b2k': {
      'en': '10% OFF',
      'ar': 'خصم 10',
      'fr': '10% DE RÉDUCTION',
    },
    'tiq6dae6': {
      'en': 'Courses Offers',
      'ar': 'عروض الدورات',
      'fr': 'Offres de cours',
    },
  },
  // Edit_profile
  {
    '8uj1825k': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'fr': 'Nom et prénom',
    },
    'm1cnsq7a': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'fr': 'Option 1',
    },
    'nahxj8iq': {
      'en': 'Female',
      'ar': 'أنثى',
      'fr': 'Femelle',
    },
    'rv7j7yba': {
      'en': 'Male',
      'ar': 'ذكر',
      'fr': 'Mâle',
    },
    '4g1vboab': {
      'en': 'Gender',
      'ar': 'جنس',
      'fr': 'Genre',
    },
    'gs5rl0gx': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'fr': 'Rechercher un article...',
    },
    'nrvgwxqn': {
      'en': 'Phone',
      'ar': 'هاتف',
      'fr': 'Téléphone',
    },
    'adu3tp55': {
      'en': 'Student',
      'ar': 'طالب',
      'fr': 'Étudiant',
    },
    'sm8hf5uf': {
      'en': 'State',
      'ar': 'ولاية',
      'fr': 'État',
    },
    'amwa2cnn': {
      'en': 'State',
      'ar': 'ولاية',
      'fr': 'État',
    },
    'zkridiy7': {
      'en': 'Alabama',
      'ar': 'ألاباما',
      'fr': 'Alabama',
    },
    'u5cq2co2': {
      'en': 'Alaska',
      'ar': 'ألاسكا',
      'fr': 'Alaska',
    },
    'itoj64hz': {
      'en': 'Arizona',
      'ar': 'أريزونا',
      'fr': 'Arizona',
    },
    'gah8x266': {
      'en': 'Arkansas',
      'ar': 'أركنساس',
      'fr': 'Arkansas',
    },
    'ya3rt8h7': {
      'en': 'California',
      'ar': 'كاليفورنيا',
      'fr': 'Californie',
    },
    'eaibzwz0': {
      'en': 'Colorado',
      'ar': 'كولورادو',
      'fr': 'Colorado',
    },
    're2b7qkk': {
      'en': 'Connecticut',
      'ar': 'كونيتيكت',
      'fr': 'Connecticut',
    },
    'jiqr2haj': {
      'en': 'Delaware',
      'ar': 'ديلاوير',
      'fr': 'Delaware',
    },
    'sqxrzxqn': {
      'en': 'Florida',
      'ar': 'فلوريدا',
      'fr': 'Floride',
    },
    'ef71hniw': {
      'en': 'Georgia',
      'ar': 'جورجيا',
      'fr': 'Géorgie',
    },
    'zgxmrbv6': {
      'en': 'Hawaii',
      'ar': 'هاواي',
      'fr': 'Hawaii',
    },
    'hr268k1j': {
      'en': 'Idaho',
      'ar': 'ايداهو',
      'fr': 'Idaho',
    },
    '2fx6vxnj': {
      'en': 'Illinoi',
      'ar': 'إلينوي',
      'fr': 'Illinois',
    },
    'kdv17xjt': {
      'en': 'Indiana',
      'ar': 'إنديانا',
      'fr': 'Indiana',
    },
    'ym5ka2ys': {
      'en': 'Iowa',
      'ar': 'ايوا',
      'fr': 'Iowa',
    },
    'q2pc0fp0': {
      'en': 'Kansas',
      'ar': 'كانساس',
      'fr': 'Kansas',
    },
    'rum3olba': {
      'en': 'Kentucky',
      'ar': 'كنتاكي',
      'fr': 'Kentucky',
    },
    'bpo61il6': {
      'en': 'Louisiana',
      'ar': 'لويزيانا',
      'fr': 'Louisiane',
    },
    'hmhdly9c': {
      'en': 'Maine',
      'ar': 'مين',
      'fr': 'Maine',
    },
    'cajmbcpq': {
      'en': 'Maryland',
      'ar': 'ميريلاند',
      'fr': 'Maryland',
    },
    'gq6ml3wi': {
      'en': 'Massachusetts',
      'ar': 'ماساتشوستس',
      'fr': 'Massachusetts',
    },
    '30dvk8cl': {
      'en': 'Michigan',
      'ar': 'ميشيغان',
      'fr': 'Michigan',
    },
    '2hg0nyw7': {
      'en': 'Minnesota',
      'ar': 'مينيسوتا',
      'fr': 'Minnesota',
    },
    'fq8jg0c4': {
      'en': 'Mississippi',
      'ar': 'ميسيسيبي',
      'fr': 'Mississippi',
    },
    '6nq8aqi0': {
      'en': 'Missouri',
      'ar': 'ميسوري',
      'fr': 'Missouri',
    },
    'ldlvw67c': {
      'en': 'Monta',
      'ar': 'مونتا',
      'fr': 'Monta',
    },
    'y09wrgsj': {
      'en': 'Nebraska',
      'ar': 'نبراسكا',
      'fr': 'Nebraska',
    },
    '6f30tgtj': {
      'en': 'Nevada',
      'ar': 'نيفادا',
      'fr': 'Nevada',
    },
    'tpf0u1uu': {
      'en': 'New Hampshire',
      'ar': 'نيو هامبشاير',
      'fr': 'New Hampshire',
    },
    'nwzogtjo': {
      'en': 'New Jersey',
      'ar': 'نيو جيرسي',
      'fr': 'New Jersey',
    },
    'vrttoo7j': {
      'en': 'New Mexico',
      'ar': 'المكسيك جديدة',
      'fr': 'Nouveau Mexique',
    },
    'yw9rqoeg': {
      'en': 'New York',
      'ar': 'نيويورك',
      'fr': 'New York',
    },
    's8uz06g2': {
      'en': 'North Carolina',
      'ar': 'شمال كارولينا',
      'fr': 'Caroline du Nord',
    },
    '571orbgz': {
      'en': 'North Dak',
      'ar': 'شمال داك',
      'fr': 'Dak Nord',
    },
    'k05c8z9n': {
      'en': 'Ohio',
      'ar': 'أوهايو',
      'fr': 'Ohio',
    },
    'fpnfkwr4': {
      'en': 'Oklahoma',
      'ar': 'أوكلاهوما',
      'fr': 'Oklahoma',
    },
    '9jwn3nun': {
      'en': 'Oregon',
      'ar': 'ولاية أوريغون',
      'fr': 'Oregon',
    },
    'qn6i57ru': {
      'en': 'Pennsylvani',
      'ar': 'بنسلفانيا',
      'fr': 'Pennsylvanie',
    },
    'crg9qkxe': {
      'en': 'Rhode Island',
      'ar': 'جزيرة رود',
      'fr': 'Rhode Island',
    },
    'sy8d9hk8': {
      'en': 'South Caroli',
      'ar': 'جنوب كارولي',
      'fr': 'Caroline du Sud',
    },
    'br11guam': {
      'en': 'South Dakota',
      'ar': 'جنوب داكوتا',
      'fr': 'Dakota du Sud',
    },
    '303y0b46': {
      'en': 'Tennessee',
      'ar': 'تينيسي',
      'fr': 'Tennessee',
    },
    'r03tujr2': {
      'en': 'Texas',
      'ar': 'تكساس',
      'fr': 'Texas',
    },
    'fsazf1qh': {
      'en': 'Utah',
      'ar': 'يوتا',
      'fr': 'Utah',
    },
    'lazggv37': {
      'en': 'Vermont',
      'ar': 'فيرمونت',
      'fr': 'Vermont',
    },
    'k6h1ze3g': {
      'en': 'Virginia',
      'ar': 'فرجينيا',
      'fr': 'Virginie',
    },
    'kb37kpwu': {
      'en': 'Washingto',
      'ar': 'واشنطن',
      'fr': 'Lavage à',
    },
    'cq83rdjy': {
      'en': 'West Virginia',
      'ar': 'فرجينيا الغربية',
      'fr': 'Virginie occidentale',
    },
    'nvxa4ffd': {
      'en': 'Wisconsin',
      'ar': 'ويسكونسن',
      'fr': 'Wisconsin',
    },
    'ela0b4vt': {
      'en': 'Wyoming',
      'ar': 'وايومنغ',
      'fr': 'Wyoming',
    },
    'be35pipc': {
      'en': 'Select State',
      'ar': 'اختر ولايه',
      'fr': 'Sélectionnez l\'état',
    },
    '9thjhy5t': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Sauvegarder les modifications',
    },
    'vuvlh8t1': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
  },
  // Success03
  {
    'h6s9viaq': {
      'en': 'Congrats!',
      'ar': 'تهاني!',
      'fr': 'Bravo!',
    },
    'aesdzucr': {
      'en': 'Quiz Results Submitted',
      'ar': 'تم إرسال نتائج الاختبار',
      'fr': 'Résultats du quiz soumis',
    },
    '8ykjt6jv': {
      'en': 'You completed a quiz from:',
      'ar': 'لقد أكملت اختبارًا من:',
      'fr': 'Vous avez répondu à un quiz de :',
    },
    'mgb3er8t': {
      'en': 'Abigail Rogers',
      'ar': 'أبيجيل روجرز',
      'fr': 'Abigail Rogers',
    },
    '6vsftui4': {
      'en': 'abigail.rogers@domain.com',
      'ar': 'abigail.rogers@domain.com',
      'fr': 'abigail.rogers@domain.com',
    },
    '4i2643dn': {
      'en': 'Go Home',
      'ar': 'اذهب للمنزل',
      'fr': 'Rentrer chez soi',
    },
    '4pru7uzg': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // SupportForm
  {
    '5xigbmbv': {
      'en': 'Submit Ticket',
      'ar': 'قدم التذكرة',
      'fr': 'Envoyer le ticket',
    },
    '4h1qmrhy': {
      'en': 'Welcome to support',
      'ar': 'مرحبا بكم في الدعم',
      'fr': 'Bienvenue au support',
    },
    'y6zp1h1u': {
      'en': 'Submit a Ticket',
      'ar': 'تسجيل التذكرة',
      'fr': 'Soumettre un ticket',
    },
    'mc86u215': {
      'en': 'Call Us',
      'ar': 'اتصل بنا',
      'fr': 'Appelez-nous',
    },
    'i6zteyzo': {
      'en': 'Email Us',
      'ar': 'ارسل لنا عبر البريد الإلكتروني',
      'fr': 'Envoyez-nous un email',
    },
    '83yci8a3': {
      'en': 'Search FAQs',
      'ar': 'البحث في الأسئلة الشائعة',
      'fr': 'Rechercher dans la FAQ',
    },
    '36yr24fo': {
      'en': 'Course Name',
      'ar': 'اسم الدورة التدريبية',
      'fr': 'Nom du cours',
    },
    'z5yp92j4': {
      'en': 'Issue',
      'ar': 'مشكلة',
      'fr': 'Problème',
    },
    'c850tpo5': {
      'en': 'Short Description of what is going on...',
      'ar': 'وصف مختصر لما يحدث...',
      'fr': 'Brève description de ce qui se passe...',
    },
    '9fo10erp': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
      'fr': 'Télécharger une capture d\'écran',
    },
    'q01q69z1': {
      'en': 'Submit Ticket',
      'ar': 'قدم التذكرة',
      'fr': 'Envoyer le ticket',
    },
    'kd26cmp8': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // Payment
  {
    'jne5on17': {
      'en': 'PayPal',
      'ar': 'باي بال',
      'fr': 'Pay Pal',
    },
    'e1vkp99b': {
      'en': 'Google Pay',
      'ar': 'جوجل الدفع',
      'fr': 'Google Payer',
    },
    '1tkht5to': {
      'en': 'Apple Pay',
      'ar': 'أبل الدفع',
      'fr': 'Apple Payer',
    },
    '2omjjbnz': {
      'en': 'MasterCard',
      'ar': 'بطاقة ماستر بطاقة ائتمان',
      'fr': 'MasterCard',
    },
    'l872uron': {
      'en': 'Payment',
      'ar': 'قسط',
      'fr': 'Paiement',
    },
  },
  // Pricingplans
  {
    't930wdqu': {
      'en': 'Select the best plan that fits your educational needs',
      'ar': 'اختر أفضل خطة تناسب احتياجاتك التعليمية',
      'fr':
          'Sélectionnez le meilleur plan qui correspond à vos besoins éducatifs',
    },
    '2y6tka30': {
      'en': 'Basic',
      'ar': 'أساسي',
      'fr': 'Basique',
    },
    'gafmhmpw': {
      'en': 'Access to free courses and limited resources.',
      'ar': 'الوصول إلى الدورات المجانية والموارد المحدودة.',
      'fr': 'Accès à des cours gratuits et à des ressources limitées.',
    },
    'jvdwq3pt': {
      'en': 'Free',
      'ar': 'حر',
      'fr': 'Gratuit',
    },
    'a8eyqylh': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': 'Sélectionner',
    },
    'znwgwcpq': {
      'en': 'Standard',
      'ar': 'معيار',
      'fr': 'Standard',
    },
    '4a2ahqk4': {
      'en':
          'Includes everything in Basic, plus interactive quizzes and support.',
      'ar': 'يشمل كل شيء في Basic، بالإضافة إلى الاختبارات التفاعلية والدعم.',
      'fr':
          'Comprend tout ce qui est en Basic, ainsi que des quiz interactifs et une assistance.',
    },
    'mlqkmyo4': {
      'en': '\$19.99/mo',
      'ar': '19.99 دولارًا شهريًا',
      'fr': '19,99 \$/mois',
    },
    'clinbtzc': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': 'Sélectionner',
    },
    'u04x1i98': {
      'en': 'Premium',
      'ar': 'غالي',
      'fr': 'Prime',
    },
    'mvw9ju3e': {
      'en':
          'All Standard features, plus unlimited course access and certifications.',
      'ar':
          'جميع الميزات القياسية، بالإضافة إلى الوصول غير المحدود للدورة والشهادات.',
      'fr':
          'Toutes les fonctionnalités Standard, ainsi qu\'un accès illimité aux cours et aux certifications.',
    },
    'ml8lvv8b': {
      'en': '\$49.99/mo',
      'ar': '49.99 دولارًا شهريًا',
      'fr': '49,99 \$/mois',
    },
    'xh351ytg': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': 'Sélectionner',
    },
    'lmaesat0': {
      'en': 'Enterprise',
      'ar': 'مَشرُوع',
      'fr': 'Entreprise',
    },
    'k51ix2m1': {
      'en': 'Custom solutions for organizations and educational institutions.',
      'ar': 'حلول مخصصة للمؤسسات والمؤسسات التعليمية.',
      'fr':
          'Solutions personnalisées pour les organisations et les établissements d\'enseignement.',
    },
    'rnsvdurk': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'fr': 'Contactez-nous',
    },
    'g3mi8dxf': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': 'Sélectionner',
    },
  },
  // notificatons
  {
    'jx7qgkqm': {
      'en': 'check.io',
      'ar': 'check.io',
      'fr': 'check.io',
    },
    '37imy73r': {
      'en': 'Platform Navigation',
      'ar': 'التنقل في المنصة',
      'fr': 'Navigation sur la plateforme',
    },
    '7r6s3v06': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
      'fr': 'Tableau de bord',
    },
    '3l60dhas': {
      'en': 'Chats',
      'ar': 'الدردشات',
      'fr': 'Discussions',
    },
    'v0o7v9p7': {
      'en': 'Projects',
      'ar': 'المشاريع',
      'fr': 'Projets',
    },
    'oxxefpff': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'fr': 'Paramètres',
    },
    '3tpy4g2e': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'fr': 'Notifications',
    },
    'rju6rd9q': {
      'en': '12',
      'ar': '12',
      'fr': '12',
    },
    'onuw0zss': {
      'en': 'Billing',
      'ar': 'الفواتير',
      'fr': 'Facturation',
    },
    '4fhjmll1': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': 'Explorer',
    },
    'drfuqz9j': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'fr': 'Mode lumière',
    },
    'zxbm1qw5': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fr': 'Mode sombre',
    },
    's303qg6j': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
      'fr': 'Andrew D.',
    },
    'w0z75lx9': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
      'fr': 'admin@gmail.com',
    },
    '5jfz6cdz': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'fr': 'Notifications',
    },
    '9p2rwwh4': {
      'en': 'Below is a list of recent activity',
      'ar': 'فيما يلي قائمة بالأنشطة الأخيرة',
      'fr': 'Vous trouverez ci-dessous une liste des activités récentes',
    },
    'eq0jdbba': {
      'en': 'New courses posted',
      'ar': 'تم نشر دورات جديدة',
      'fr': 'Nouveaux cours affichés',
    },
    'imqjz9e9': {
      'en': ' Begin Work',
      'ar': 'بدء العمل',
      'fr': 'Commencer le travail',
    },
    '08892nha': {
      'en': 'SOW Change Order',
      'ar': 'SOW تغيير الطلب',
      'fr': 'Ordre de modification du SOW',
    },
    'two6dh1m': {
      'en': 'FlutterFlow CRM App',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
      'fr': 'Application FlutterFlow CRM',
    },
    '2aejcbkh': {
      'en': 'Jul 8, at 4:31pm',
      'ar': '8 يوليو، الساعة 4:31 مساءً',
      'fr': '8 juillet, à 16h31',
    },
    'obj8t8dt': {
      'en': 'New lesson Started ',
      'ar': 'بدأ الدرس الجديد',
      'fr': 'Nouvelle leçon commencée',
    },
    'j3rw3806': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'itk4gq9r': {
      'en': 'Medrasti Change Order',
      'ar': 'ترتيب تغيير مدرستي',
      'fr': 'Ordre de modification de Medrasti',
    },
    'f1u79kxx': {
      'en': 'Medrsati',
      'ar': 'مدرستي',
      'fr': 'Médrasti',
    },
    'rzltwudt': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'ar':
          '\"سيتم إرسال الإخطارات والتذكيرات لإعلام المستخدمين بالفصول القادمة وجداول التدريب عبر البريد الإلكتروني أو الرسائل النصية القصيرة أو الإشعارات داخل التطبيق.\"',
      'fr':
          '\"Des notifications et rappels informant les utilisateurs des cours à venir et des plannings de formation leur seront envoyés par e-mail, SMS ou notifications au sein de l\'application.\"',
    },
    'q9iiag6e': {
      'en': 'Jul 8, at 4:30pm',
      'ar': '8 يوليو، الساعة 4:30 مساءً',
      'fr': '8 juillet, à 16h30',
    },
    'did1n11w': {
      'en': 'Randy Rudolph ',
      'ar': 'راندي رودولف',
      'fr': 'Randy Rudolph',
    },
    'l3xhny0b': {
      'en': 'uploaded a new course',
      'ar': 'تم تحميل دورة جديدة',
      'fr': 'a téléchargé un nouveau cours',
    },
    '0p28wqv8': {
      'en': '',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
      'fr': '',
    },
    't1kln36n': {
      'en': 'Medrasti Change Order',
      'ar': 'ترتيب تغيير مدرستي',
      'fr': 'Ordre de modification de Medrasti',
    },
    'v49ceo5v': {
      'en': 'Medrasti app update',
      'ar': 'تحديث تطبيق مدراستي',
      'fr': 'Mise à jour de l\'application Medrasti',
    },
    'pwrulb9u': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'ar': '\"يُرجى مراجعة التحديثات على هذه الوثيقة والتواصل معي مرة أخرى.\"',
      'fr':
          '\"Veuillez consulter les mises à jour de ce document et revenez vers moi.\"',
    },
    'fi1n70n6': {
      'en': 'Jul 8, at 2:20pm',
      'ar': '8 يوليو، الساعة 2:20 مساءً',
      'fr': '8 juillet, à 14h20',
    },
    'xxzc8hl5': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // Orders
  {
    'koxeohfz': {
      'en': 'Recent Orders',
      'ar': 'الطلبيات الأخيرة',
      'fr': 'Dernières commandes',
    },
    'vpmwcf2c': {
      'en': 'Below are your most recent orders',
      'ar': 'فيما يلي أحدث طلباتك',
      'fr': 'Ci-dessous vos dernières commandes',
    },
    '7mj2lxi2': {
      'en': 'Order #: ',
      'ar': 'طلب #:',
      'fr': 'Commande #:',
    },
    'oiktjetg': {
      'en': '429242424',
      'ar': '429242424',
      'fr': '429242424',
    },
    '5tabzcd3': {
      'en': 'Mon. July 3rd',
      'ar': 'الاثنين. 3 يوليو',
      'fr': 'Lun. 3 juillet',
    },
    'yzub4w2h': {
      'en': 'New course',
      'ar': 'دورة جديدة',
      'fr': 'Nouveau cours',
    },
    '6649oxye': {
      'en': '\$15.50',
      'ar': '15.50 دولارًا',
      'fr': '15,50 \$',
    },
    'fobppbcu': {
      'en': 'Shipped',
      'ar': 'شحنها',
      'fr': 'Expédié',
    },
    'a2346fl6': {
      'en': 'Order #: ',
      'ar': 'طلب #:',
      'fr': 'Commande #:',
    },
    'jovkymci': {
      'en': '429242424',
      'ar': '429242424',
      'fr': '429242424',
    },
    '5ypo6kpm': {
      'en': 'Mon. July 3rd',
      'ar': 'الاثنين. 3 يوليو',
      'fr': 'Lun. 3 juillet',
    },
    'cxyanufg': {
      'en': 'New course',
      'ar': 'دورة جديدة',
      'fr': 'Nouveau cours',
    },
    'cenwbzhp': {
      'en': '\$41.50',
      'ar': '41.50 دولارًا',
      'fr': '41,50 \$',
    },
    'g7mvt6yq': {
      'en': 'Shipped',
      'ar': 'شحنها',
      'fr': 'Expédié',
    },
    'dunmwcpo': {
      'en': 'Order #: ',
      'ar': 'طلب #:',
      'fr': 'Commande #:',
    },
    'c2qn2tze': {
      'en': '429242424',
      'ar': '429242424',
      'fr': '429242424',
    },
    'nbhjczk3': {
      'en': 'Mon. July 3rd',
      'ar': 'الاثنين. 3 يوليو',
      'fr': 'Lun. 3 juillet',
    },
    'fyo1nvsz': {
      'en': 'New course',
      'ar': 'دورة جديدة',
      'fr': 'Nouveau cours',
    },
    'q6440swl': {
      'en': '\$10.50',
      'ar': '10.50 دولار',
      'fr': '10,50 \$',
    },
    'eru9mo3c': {
      'en': 'Accepted',
      'ar': 'قبلت',
      'fr': 'Accepté',
    },
    '4iisubzh': {
      'en': 'Order #: ',
      'ar': 'طلب #:',
      'fr': 'Commande #:',
    },
    '02ot3roe': {
      'en': '429242424',
      'ar': '429242424',
      'fr': '429242424',
    },
    'l7l46upa': {
      'en': 'Mon. July 3rd',
      'ar': 'الاثنين. 3 يوليو',
      'fr': 'Lun. 3 juillet',
    },
    'gjezldpg': {
      'en': 'New course',
      'ar': 'دورة جديدة',
      'fr': 'Nouveau cours',
    },
    'iak33evd': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
      'fr': '1,50 \$',
    },
    'zcgz6g4o': {
      'en': 'Accepted',
      'ar': 'قبلت',
      'fr': 'Accepté',
    },
    'wk5aq1wz': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // more
  {
    'y12dhsid': {
      'en': 'Explore additional features and settings',
      'ar': 'اكتشف الميزات والإعدادات الإضافية',
      'fr': 'Explorez des fonctionnalités et des paramètres supplémentaires',
    },
    'yp62g201': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': 'Développement web',
    },
    '4d1xsr7c': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': 'Explorer',
    },
    'ae9ir8mn': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': 'Voir les forfaits',
    },
    'q68kjg2w': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': 'Acheter maintenant',
    },
    'kc7myln3': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '40 \$',
    },
    'se4y1kov': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    'ylprf9xp': {
      'en': 'Courses',
      'ar': 'الدورات',
      'fr': 'Cours',
    },
    'h7bacjq7': {
      'en': 'Discounts',
      'ar': 'خصومات',
      'fr': 'Réductions',
    },
    'rc6908z5': {
      'en': 'Payment',
      'ar': 'قسط',
      'fr': 'Paiement',
    },
    '0hej4zzk': {
      'en': 'Discount offers',
      'ar': 'عروض الخصم',
      'fr': 'Offres de réduction',
    },
    '0043z7fc': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': 'Documents et vidéos',
    },
    'ocww4ton': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': 'Explorer les cours',
    },
    '24qz21nj': {
      'en': 'Support',
      'ar': 'يدعم',
      'fr': 'Soutien',
    },
    'ca0wg4wh': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'fr': 'Paramètres',
    },
    'zuewamg2': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'axaz121m': {
      'en': 'More',
      'ar': 'أكثر',
      'fr': 'Plus',
    },
  },
  // notifications_page
  {
    '4rc0v067': {
      'en': 'Manage your notification preferences',
      'ar': 'إدارة تفضيلات الإخطار الخاصة بك',
      'fr': 'Gérer vos préférences de notification',
    },
    'cvfn4j3s': {
      'en': 'General Notifications',
      'ar': 'الإخطارات العامة',
      'fr': 'Notifications générales',
    },
    '6vxovitb': {
      'en': 'Sounds',
      'ar': 'اصوات',
      'fr': 'Des sons',
    },
    '9n5v7pvg': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'fr': 'Vibrer',
    },
    'ep5n23oa': {
      'en': 'Promo & Discounts',
      'ar': 'الترويجي والخصومات',
      'fr': 'Promotions et réductions',
    },
    'q177s232': {
      'en': 'Payment Notifications',
      'ar': 'إشعارات الدفع',
      'fr': 'Avis de paiement',
    },
    '9xur88hs': {
      'en': 'Cashback Notifications',
      'ar': 'إشعارات استرداد النقود',
      'fr': 'Notifications de remboursement',
    },
    'rspc03cm': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'fr': 'Mises à jour de l\'application',
    },
    'm4rgew6t': {
      'en': 'News Service Available',
      'ar': 'خدمة الأخبار متاحة',
      'fr': 'Service de nouvelles disponible',
    },
    'r6s40c6j': {
      'en': 'News Tip Available',
      'ar': 'نصيحة الأخبار متاحة',
      'fr': 'Astuce d\'actualité disponible',
    },
    '3jzm96vm': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'fr': 'Notifications',
    },
  },
  // Coursepdf
  {
    'rbg1fexh': {
      'en': 'Lesson',
      'ar': '',
      'fr': '',
    },
    's232j3n7': {
      'en': 'More',
      'ar': 'أكثر',
      'fr': 'Plus',
    },
  },
  // Onboarding
  {
    'nhm0xrgm': {
      'en': 'Prepare with courses  divided into sessions',
      'ar': 'الاستعداد مع دورات مقسمة إلى جلسات',
      'fr': 'Préparez-vous avec des cours divisés en séances',
    },
    '5dj7xvr6': {
      'en':
          'Learning sessions from the cleanest courses prepared by the best professors',
      'ar': 'جلسات تعلم من أنقى الدورات التي أعدها أفضل الأساتذة',
      'fr':
          'Séances d\'apprentissage à partir des cours les plus propres préparés par les meilleurs professeurs',
    },
    '4w3vvlb1': {
      'en': 'Video lectures and notes to clarify your cconcepts',
      'ar': 'محاضرات فيديو وملاحظات لتوضيح مفاهيمك',
      'fr': 'Conférences vidéo et notes pour clarifier vos concepts',
    },
    'tqa7obj2': {
      'en': 'Learn from the best professors with great videos and useful notes',
      'ar': 'تعلم من أفضل الأساتذة بمقاطع فيديو رائعة وملاحظات مفيدة',
      'fr':
          'Apprenez des meilleurs professeurs avec de superbes vidéos et des notes utiles',
    },
    'on3cuhxs': {
      'en': 'Get solutions ',
      'ar': 'احصل على الحلول',
      'fr': 'Obtenez des solutions',
    },
    '0hsv4du3': {
      'en': 'Join our community of many students and professors',
      'ar': 'انضم إلى مجتمعنا الذي يضم العديد من الطلاب والأساتذة',
      'fr': 'Rejoignez notre communauté de nombreux étudiants et professeurs',
    },
    '7bvdv96h': {
      'en': 'All you need in one Place pass',
      'ar': 'كل ما تحتاجه في مكان واحد',
      'fr': 'Tout ce dont vous avez besoin dans un seul pass Place',
    },
    'h059a09a': {
      'en':
          'Pass your next exam with less effort, less time and less financial experience',
      'ar': 'اجتاز امتحانك التالي بجهد أقل ووقت أقل وخبرة مالية أقل',
      'fr':
          'Réussissez votre prochain examen avec moins d\'efforts, moins de temps et moins d\'expérience financière',
    },
    'qrzswtcf': {
      'en': 'Phone Sign-in',
      'ar': 'تسجيل الدخول عبر الهاتف',
      'fr': 'Connexion par téléphone',
    },
    '3crehn74': {
      'en': 'Sign up with e-mail',
      'ar': 'سجل عن طريق البريد الإلكتروني',
      'fr': 'S\'enregistrer avec l\'adresse e-mail',
    },
    'qzhhtob1': {
      'en': 'Sign up with Google',
      'ar': 'قم بالتسجيل مع جوجل',
      'fr': 'Inscrivez-vous avec Google',
    },
    'gx9qeeqa': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'fr': 'Vous avez déjà un compte?',
    },
    'kow8a71p': {
      'en': ' Log In!',
      'ar': 'تسجيل الدخول!',
      'fr': 'Se connecter!',
    },
    'f6g2lhw6': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // dashboard
  {
    'g35061nm': {
      'en': 'Below is a summary of your wallet points',
      'ar': '',
      'fr': '',
    },
    'd50p16fb': {
      'en': 'Wallet Balance',
      'ar': '',
      'fr': '',
    },
    'y713mmiu': {
      'en': 'Wallet History',
      'ar': '',
      'fr': '',
    },
    'ue6qx0ib': {
      'en': 'Activity',
      'ar': '',
      'fr': '',
    },
    'esoie4we': {
      'en': 'Below is an a summary of activity.',
      'ar': '',
      'fr': '',
    },
    'xp898yts': {
      'en': 'Wallet',
      'ar': '',
      'fr': '',
    },
    'otx9rl3z': {
      'en': '__',
      'ar': '',
      'fr': '',
    },
  },
  // Individual_Courses
  {
    '4kbh0ob5': {
      'en': 'medrasti courses',
      'ar': '',
      'fr': '',
    },
    'ey4nzwdy': {
      'en': ' students learning this week',
      'ar': '',
      'fr': '',
    },
    'tejwyxyb': {
      'en': '177,117 students learning this week',
      'ar': '',
      'fr': '',
    },
    '6rea24o7': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'yj5t5l0f': {
      'en': 'About this Course',
      'ar': '',
      'fr': '',
    },
    '7wj4dzu5': {
      'en': '283 Videos included',
      'ar': '',
      'fr': '',
    },
    'nk2fh8ih': {
      'en': 'Detailed and comprehensive ',
      'ar': '',
      'fr': '',
    },
    '255eskj2': {
      'en': '1834 ratings',
      'ar': '',
      'fr': '',
    },
    'z7u6pjic': {
      'en': '838 students learning this week',
      'ar': '',
      'fr': '',
    },
    'qtc0bjki': {
      'en': 'View plans',
      'ar': '',
      'fr': '',
    },
    '6noiqfwc': {
      'en': 'Enroll Now',
      'ar': '',
      'fr': '',
    },
    'i1t0s50i': {
      'en': 'Course Contents',
      'ar': '',
      'fr': '',
    },
    'rgl5nx9x': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // addCoursePage
  {
    'cwgnd0ow': {
      'en': 'Submit Ticket',
      'ar': '',
      'fr': '',
    },
    'ankymrgx': {
      'en': 'Welcome to support',
      'ar': '',
      'fr': '',
    },
    'b0fqfrs8': {
      'en': 'Submit a Ticket',
      'ar': '',
      'fr': '',
    },
    '8a3hrv8k': {
      'en': 'Call Us',
      'ar': '',
      'fr': '',
    },
    '0ckbsci4': {
      'en': 'Email Us',
      'ar': '',
      'fr': '',
    },
    'bw9cfswg': {
      'en': 'Search FAQs',
      'ar': '',
      'fr': '',
    },
    'b7laccw3': {
      'en': 'Channel Name',
      'ar': '',
      'fr': '',
    },
    'oxvqkpj3': {
      'en': 'Channel ID',
      'ar': '',
      'fr': '',
    },
    'vffoezi2': {
      'en': 'Short Description of what is going on...',
      'ar': '',
      'fr': '',
    },
    '6iwgd454': {
      'en': 'Upload Screenshot',
      'ar': '',
      'fr': '',
    },
    '1f84swam': {
      'en': 'Submit Ticket',
      'ar': '',
      'fr': '',
    },
    '6pwp274f': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // All_courses
  {
    'evw2vcvl': {
      'en': 'Search courses....',
      'ar': '',
      'fr': '',
    },
    'y0rd8sxh': {
      'en': 'All Courses',
      'ar': '',
      'fr': '',
    },
    'k5gqcgee': {
      'en': 'Courses',
      'ar': '',
      'fr': '',
    },
    'cz1qzzyu': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // fullCourseDetails
  {
    'k586yrq8': {
      'en': 'Last Updated: ',
      'ar': '',
      'fr': '',
    },
    'c5jtoh9l': {
      'en': 'Price :',
      'ar': '',
      'fr': '',
    },
    'uf8kk28a': {
      'en': 'Lessons :',
      'ar': '',
      'fr': '',
    },
    '8hzhl6m5': {
      'en': '14 Lessons',
      'ar': '',
      'fr': '',
    },
    '4eb5nbb0': {
      'en': 'Category :',
      'ar': '',
      'fr': '',
    },
    'fbggu6yf': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'd8c1a07z': {
      'en': 'Course Content',
      'ar': '',
      'fr': '',
    },
    'oo7nu2i2': {
      'en': 'Les alcanes',
      'ar': '',
      'fr': '',
    },
    'elk73nkg': {
      'en': 'Definition et nomenclature',
      'ar': '',
      'fr': '',
    },
    '93l95yzj': {
      'en': '09:10',
      'ar': '',
      'fr': '',
    },
    '5k9r7ceo': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'hqnnm3rw': {
      'en': '09:10',
      'ar': '',
      'fr': '',
    },
    'ffsc4tww': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'h4gmf7ch': {
      'en': '09:10',
      'ar': '',
      'fr': '',
    },
    'wzptjbjo': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'j4ldva1v': {
      'en': '09:10',
      'ar': '',
      'fr': '',
    },
    'yppd1qwr': {
      'en': 'Les alcanes',
      'ar': '',
      'fr': '',
    },
    'pxrd2x4f': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'x94xmxuf': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'lil2opel': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'ysczghir': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'jf5lmvpy': {
      'en': 'Intro to UX Design',
      'ar': '',
      'fr': '',
    },
    'ns8xyeuw': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'wixt6nj0': {
      'en': 'Enroll now',
      'ar': '',
      'fr': '',
    },
    'ary626ty': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // video_player
  {
    'wb2e3rw6': {
      'en': 'Last Updated: ',
      'ar': '',
      'fr': '',
    },
    'enk695hz': {
      'en': 'Price :',
      'ar': '',
      'fr': '',
    },
    'oje3h5vx': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'bgakumng': {
      'en': 'Lessons :',
      'ar': '',
      'fr': '',
    },
    'sypyj9ls': {
      'en': '14 Lessons',
      'ar': '',
      'fr': '',
    },
    'jeyncebo': {
      'en': 'Category :',
      'ar': '',
      'fr': '',
    },
    'l90oqy0k': {
      'en': '8 mins ',
      'ar': '',
      'fr': '',
    },
    '7y4qloxp': {
      'en': '8 mins',
      'ar': '',
      'fr': '',
    },
    'tad5azdu': {
      'en': 'Lesson',
      'ar': '',
      'fr': '',
    },
    'y0nif1o1': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // lesson_upload
  {
    '9w1tlny5': {
      'en': 'Upload Course',
      'ar': '',
      'fr': '',
    },
    'ozps7xle': {
      'en': 'Course Title',
      'ar': '',
      'fr': '',
    },
    'tas4woto': {
      'en': 'Enter course title',
      'ar': '',
      'fr': '',
    },
    'rihfiiv9': {
      'en': 'Course Description',
      'ar': '',
      'fr': '',
    },
    'uu7iesld': {
      'en': 'Enter course description',
      'ar': '',
      'fr': '',
    },
    'jp3dhua8': {
      'en': 'Upload Image',
      'ar': '',
      'fr': '',
    },
    'v7dt49ho': {
      'en': 'Course Link',
      'ar': '',
      'fr': '',
    },
    '25bdjses': {
      'en': 'Enter course link',
      'ar': '',
      'fr': '',
    },
    'uty0qz1u': {
      'en': 'Submit',
      'ar': '',
      'fr': '',
    },
  },
  // Courses_contents
  {
    'we54udv9': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    'yguwptyp': {
      'en': 'Topics',
      'ar': '',
      'fr': '',
    },
    'fnsm1sxy': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // header
  {
    '78fsz7x6': {
      'en': 'Top Podcast on App',
      'ar': 'أفضل البودكاست على التطبيق',
      'fr': 'Meilleur podcast sur l\'application',
    },
    'jbrv3a2g': {
      'en': 'Author Name',
      'ar': 'اسم المؤلف',
      'fr': 'Nom de l\'auteur',
    },
    'nm199nod': {
      'en': 'Follow',
      'ar': 'يتبع',
      'fr': 'Suivre',
    },
    'nkotkddk': {
      'en': 'Following',
      'ar': 'التالي',
      'fr': 'Suivant',
    },
  },
  // Modal05CreateProject
  {
    'm24wkjjl': {
      'en': 'Create Project',
      'ar': 'إنشاء مشروع',
      'fr': 'Créer un projet',
    },
    'gfvutq86': {
      'en': 'Please enter the information below to add a project.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة مشروع.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour ajouter un projet.',
    },
    'zw8na8wh': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
    },
    'pld2j51g': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
      'fr': 'Téléchargez une image ici...',
    },
    'dyf9pbc8': {
      'en': 'Showcase Project Name',
      'ar': 'عرض اسم المشروع',
      'fr': 'Présenter le nom du projet',
    },
    'u6anb87q': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
      'fr': 'Description ici...',
    },
    'sm5h8msj': {
      'en': 'URL of the project',
      'ar': 'عنوان URL للمشروع',
      'fr': 'URL du projet',
    },
    'vasltge5': {
      'en': 'Clonable Link URL...',
      'ar': 'عنوان URL للرابط القابل للاستنساخ...',
      'fr': 'URL du lien clonable...',
    },
    'syt39qdg': {
      'en': 'Create Showcase',
      'ar': 'إنشاء عرض',
      'fr': 'Créer une vitrine',
    },
    'legdt7xx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'lyxb8csw': {
      'en': 'Please enter a real name',
      'ar': 'الرجاء إدخال الاسم الحقيقي',
      'fr': 'Veuillez entrer un vrai nom',
    },
    '3rkk2q0d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ax117xr2': {
      'en': 'Please enter a short desription',
      'ar': 'الرجاء إدخال وصف قصير',
      'fr': 'Veuillez saisir une courte description',
    },
    'nxigthoa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '480v3hpy': {
      'en': 'We have to have a URL for the project.',
      'ar': 'يجب أن يكون لدينا عنوان URL للمشروع.',
      'fr': 'Nous devons avoir une URL pour le projet.',
    },
    'dleyods5': {
      'en': 'Please enter a valid URL...',
      'ar': 'أدخل رابط صحيح من فضلك...',
      'fr': 'Veuillez saisir une URL valide...',
    },
    'lpx0fv8t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gjepoxwj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
    },
    'kw8ci40f': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // Add_funds
  {
    'g13deymn': {
      'en': 'Top up your wallet balance',
      'ar': '',
      'fr': '',
    },
    'cqwtc68k': {
      'en': 'Add funds to your wallet to enjoy seamless transactions.',
      'ar': '',
      'fr': '',
    },
    'tylwilbl': {
      'en': 'Add Funds',
      'ar': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'aydthjmy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tyf2uhh5': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5mwr53cs': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z872389i': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ooyjto53': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '6kvudu9w': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0lklsz2n': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '1ku1vhqr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '43bvzpq2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'nr1eg78t': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '15f2q7jh': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4dzp7rd9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'eutv3rbn': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '37syo171': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'slcvms9l': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fss90fh7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mkdtdwdj': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tb29w6m1': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't8zzmeub': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '7lrumom1': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'bcqjn0xi': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '6bd6gb9w': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'qn8g6hg5': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'tq6bk0f1': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'p3upvha2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't1hurl7h': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'zcof6l34': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
