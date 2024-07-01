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
  // HomePage
  {
    'f3t498a1': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'dr4ygcxp': {
      'en': 'Pricing Plans',
      'ar': 'خطط التسعير',
      'fr': '',
    },
    'mryv89xh': {
      'en': 'Change Exam',
      'ar': 'تغيير الامتحان',
      'fr': '',
    },
    '30o7tvph': {
      'en': 'Practice Reminder',
      'ar': 'تذكير الممارسة',
      'fr': '',
    },
    'ynrkfxuh': {
      'en': 'My Analysis',
      'ar': 'تحليلي',
      'fr': '',
    },
    'eft5v713': {
      'en': 'Purchases',
      'ar': 'المشتريات',
      'fr': '',
    },
    'id5abqt5': {
      'en': 'Upgrade plan',
      'ar': 'خطة الترقية',
      'fr': '',
    },
    'ugsdc65l': {
      'en': 'Messages',
      'ar': 'رسائل',
      'fr': '',
    },
    'wix5g5p8': {
      'en': 'Need help',
      'ar': 'تحتاج مساعدة',
      'fr': '',
    },
    'ysaua8pq': {
      'en': 'Medrasti',
      'ar': 'ميدراستي',
      'fr': '',
    },
    'ws7vjz3a': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    '1sb3f3sy': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'ld9o00w5': {
      'en': 'My courses',
      'ar': 'دوراتي',
      'fr': '',
    },
    '2llpi0hc': {
      'en': 'Introduction to Psychology',
      'ar': 'مدخل إلى علم النفس',
      'fr': '',
    },
    'uhhlkov9': {
      'en': 'Join Medasti',
      'ar': 'انضم إلى مداستي',
      'fr': '',
    },
    'y4gdld6u': {
      'en': 'Join Medasti Premium Now',
      'ar': 'انضم إلى Medasti Premium الآن',
      'fr': '',
    },
    'e62s4n0o': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'aymih2y6': {
      'en': 'Courses you haven\'t viewed',
      'ar': 'الدورات التي لم تشاهدها',
      'fr': '',
    },
    'jzg70q40': {
      'en': 'How to prepare for GMAT',
      'ar': 'كيفية الاستعداد لامتحان GMAT',
      'fr': '',
    },
    'ejj6l5qj': {
      'en': 'View All',
      'ar': 'عرض الكل',
      'fr': '',
    },
    'l5quy1d1': {
      'en': 'Other Options',
      'ar': 'خيارات أخرى',
      'fr': '',
    },
    'wzvesdkj': {
      'en': 'Introduction to Psychology',
      'ar': 'مدخل إلى علم النفس',
      'fr': '',
    },
    'qb6hna97': {
      'en': 'Schedule a call with us',
      'ar': 'جدولة مكالمة معنا',
      'fr': '',
    },
    '9whl04a0': {
      'en': 'Explore courses',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'ypl1u7ax': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'fr': '',
    },
    'mzzpbpdg': {
      'en':
          'Medrasti  is a worldwide educational mobile application designed to give learners the best.',
      'ar': '',
      'fr': '',
    },
    'uu4miwy2': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // auth_3_Create
  {
    'wowwujas': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
      'fr': '',
    },
    '96y3ikkj': {
      'en': 'Let\'s get started by filling out the form ',
      'ar': 'لنبدأ بملء النموذج',
      'fr': '',
    },
    'l2mdlgdx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': '',
    },
    'pzb9w4n6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': '',
    },
    'aie8xyqz': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': '',
    },
    'qty5cs9u': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': '',
    },
    'g8lkmqtd': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب؟',
      'fr': '',
    },
    'zjd35wmj': {
      'en': 'Sign In here',
      'ar': 'تسجيل الدخول هنا',
      'fr': '',
    },
    '05d729wx': {
      'en': 'Continue with Phone',
      'ar': 'تواصل مع الهاتف',
      'fr': '',
    },
    'e4crokko': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': '',
    },
    'n65hcdtw': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // auth_3_Login
  {
    'e31acdfw': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': '',
    },
    'danctruw': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'fr': '',
    },
    'rym4i3iy': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': '',
    },
    'd8h8rdhq': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': '',
    },
    'rasd7erx': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': '',
    },
    'wyitjkco': {
      'en': 'Don\'t have an account ',
      'ar': 'هل لديك حساب؟',
      'fr': '',
    },
    'z17xpnsa': {
      'en': 'Sign up here',
      'ar': 'تسجيل الدخول هنا',
      'fr': '',
    },
    '6243k8qb': {
      'en': 'Continue with Phone',
      'ar': 'تواصل مع الهاتف',
      'fr': '',
    },
    '6b9e1oci': {
      'en': 'Forgot Password? ',
      'ar': 'هل نسيت كلمة السر؟',
      'fr': '',
    },
    '8k4v2sqr': {
      'en': 'Reset It Now',
      'ar': 'أعد ضبطه الآن',
      'fr': '',
    },
    'etwx99rl': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // auth_3_phone
  {
    'x5arn8df': {
      'en': 'Login with Phone',
      'ar': 'تسجيل الدخول بالهاتف',
      'fr': '',
    },
    'oaih76gt': {
      'en': 'Input your number below in order to login.',
      'ar': 'أدخل رقمك أدناه لتسجيل الدخول.',
      'fr': '',
    },
    'gfolyxwh': {
      'en': 'Your phone number...',
      'ar': 'رقم تليفونك...',
      'fr': '',
    },
    'zi1ls7ww': {
      'en': 'Continue',
      'ar': 'يكمل',
      'fr': '',
    },
    'fgppdpm4': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // auth_3_verifyPhone
  {
    'rxd8qcdr': {
      'en': 'Verification Code',
      'ar': 'رمز التحقق',
      'fr': '',
    },
    '9vszdyir': {
      'en': 'Enter the 6 digit code that you received at: ',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي تلقيته على:',
      'fr': '',
    },
    '4v7edpgt': {
      'en': ' change number?',
      'ar': 'تغيير رقم؟',
      'fr': '',
    },
    '04hux788': {
      'en': 'Verify Code',
      'ar': 'التحقق من كود',
      'fr': '',
    },
    'wa2q263d': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // auth_3_ForgotPassword
  {
    'evb9gt3e': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': '',
    },
    '8vht0f3h': {
      'en': 'Enter your email below in order be sent a reset password link.',
      'ar':
          'أدخل بريدك الإلكتروني أدناه حتى يتم إرسال رابط إعادة تعيين كلمة المرور.',
      'fr': '',
    },
    'axecsv6v': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
      'fr': '',
    },
    '5l85bldf': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة الضبط',
      'fr': '',
    },
    'ejkdaxgn': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // welcome
  {
    'daucxync': {
      'en': 'Prepare with courses  divided into sessions',
      'ar': 'كل ما تحتاجه في مكان واحد',
      'fr': '',
    },
    'jk1pjnfb': {
      'en':
          'Learning sessions from the cleanest courses prepared by the best professors',
      'ar':
          'اجتز امتحانك التالي بأقل قدر من الوقت والجهد والمال الذي يتم إنفاقه',
      'fr': '',
    },
    'a3cpuw43': {
      'en': 'Video lectures and notes to clarify your cconcepts',
      'ar': 'تجربة تعليمية رائعة',
      'fr': '',
    },
    'fdaw5r5m': {
      'en': 'Learn from the best professors with great videos and useful notes',
      'ar': 'استمتع بأفضل تجربة تعليمية يمكنك العثور عليها في أي مكان',
      'fr': '',
    },
    'vb079e98': {
      'en': 'Get solutions ',
      'ar': 'الاستعداد للاختبار والامتحانات في سهولة',
      'fr': '',
    },
    'qj95stxi': {
      'en': 'Join our community of many students and professors',
      'ar':
          'الوصول إلى أفضل المواد والدورات الدراسية للامتحانات والاختبارات الخاصة بك',
      'fr': '',
    },
    '09myj9xl': {
      'en': 'All you need in one Place pass',
      'ar': 'الاستعداد للاختبار والامتحانات في سهولة',
      'fr': '',
    },
    'zpuic71l': {
      'en':
          'Pass your next exam with less effort, less time and less financial experience',
      'ar':
          'الوصول إلى أفضل المواد والدورات الدراسية للامتحانات والاختبارات الخاصة بك',
      'fr': '',
    },
    'y63hpemr': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': '',
    },
    '0v6xx4r7': {
      'en': 'Sign up Apple',
      'ar': 'تواصل مع جوجل',
      'fr': '',
    },
    'lfhxbcs2': {
      'en': 'Signup with Email',
      'ar': 'سجل عن طريق البريد الإلكتروني',
      'fr': '',
    },
    'zvvifuk9': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟ تسجيل الدخول',
      'fr': '',
    },
    'sc6dxkes': {
      'en': ' Sign in',
      'ar': '',
      'fr': '',
    },
    'ee085z9c': {
      'en': 'Already have an account? Sign in',
      'ar': 'هل لديك حساب؟ تسجيل الدخول',
      'fr': '',
    },
    'gqnjkki7': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // pages
  {
    'da0yuy69': {
      'en': 'Dr. Emily Stone',
      'ar': 'دكتور إميلي ستون',
      'fr': '',
    },
    'p1vwjms1': {
      'en': 'emily.stone@university.edu',
      'ar': 'emily.stone@university.edu',
      'fr': '',
    },
    'nyewklez': {
      'en': 'Course Overview',
      'ar': 'نظرة عامة على الدورة',
      'fr': '',
    },
    'z36wc0p8': {
      'en': 'Introduction to Psychology',
      'ar': 'مدخل إلى علم النفس',
      'fr': '',
    },
    'wnjat5sy': {
      'en': 'Class Schedule',
      'ar': 'جدول الحصص',
      'fr': '',
    },
    'q2gg8t6n': {
      'en': 'Student Forum',
      'ar': 'المنتدى الطلابي',
      'fr': '',
    },
    'z4ktyayr': {
      'en': 'Assignments',
      'ar': 'تعيينات',
      'fr': '',
    },
    'iqvfy2h2': {
      'en': 'Lecture Videos',
      'ar': 'فيديوهات المحاضرات',
      'fr': '',
    },
    '00crk4v8': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'fr': '',
    },
    '2x3dkxyf': {
      'en': 'Course Details',
      'ar': 'تفاصيل الدورة',
      'fr': '',
    },
  },
  // ggg
  {
    'f3lzispp': {
      'en': 'Featured Courses',
      'ar': 'الدورات المميزة',
      'fr': '',
    },
    'stumluju': {
      'en': 'Learn to design beautiful websites with the latest technologies.',
      'ar': 'تعلم كيفية تصميم مواقع الويب الجميلة بأحدث التقنيات.',
      'fr': '',
    },
    'd2a0dyyo': {
      'en': 'Strategies to boost your online presence and engagement.',
      'ar': 'استراتيجيات لتعزيز تواجدك ومشاركتك على الإنترنت.',
      'fr': '',
    },
    '8etpbxar': {
      'en': 'Strategies to boost your online presence and engagement.',
      'ar': 'استراتيجيات لتعزيز تواجدك ومشاركتك على الإنترنت.',
      'fr': '',
    },
    'ed2v9s8j': {
      'en': 'Ultimate Web Design Course',
      'ar': 'الدورة النهائية لتصميم الويب',
      'fr': '',
    },
    'ui6ujscz': {
      'en': '\$99',
      'ar': '99 دولارًا',
      'fr': '',
    },
    'yrgfh302': {
      'en': '50% off',
      'ar': 'خصم 50',
      'fr': '',
    },
    'cdahsp8s': {
      'en': 'Advanced Programming Techniques',
      'ar': 'تقنيات البرمجة المتقدمة',
      'fr': '',
    },
    'u9xrzm5r': {
      'en': 'Master complex algorithms and data structures.',
      'ar': 'إتقان الخوارزميات المعقدة وهياكل البيانات.',
      'fr': '',
    },
    '20ceeh42': {
      'en': '\$120',
      'ar': '120 دولارًا',
      'fr': '',
    },
    '58bmfx3y': {
      'en': '25% off',
      'ar': 'خصم 25%',
      'fr': '',
    },
    'h2zjuxym': {
      'en': 'Digital Marketing Essentials',
      'ar': 'أساسيات التسويق الرقمي',
      'fr': '',
    },
    'soim4dlh': {
      'en': '\$80',
      'ar': '80 دولارًا',
      'fr': '',
    },
    'iuqmux0y': {
      'en': '30% off',
      'ar': 'تخفيض 30',
      'fr': '',
    },
    '04x5q9fj': {
      'en': 'Browse All Courses',
      'ar': 'تصفح جميع الدورات',
      'fr': '',
    },
    'qizt6fdg': {
      'en': 'Introduction to Python',
      'ar': 'مقدمة إلى بايثون',
      'fr': '',
    },
    'vddun0wf': {
      'en': 'Start your programming journey with Python.',
      'ar': 'ابدأ رحلتك البرمجية مع بايثون.',
      'fr': '',
    },
    'clnwpjci': {
      'en': '\$45',
      'ar': '45 دولارًا',
      'fr': '',
    },
    '53emfx6y': {
      'en': 'UX/UI Design Fundamentals',
      'ar': 'أساسيات تصميم تجربة المستخدم/واجهة المستخدم',
      'fr': '',
    },
    'cijcjs8l': {
      'en': 'Create intuitive and beautiful user experiences.',
      'ar': 'إنشاء تجارب مستخدم بديهية وجميلة.',
      'fr': '',
    },
    'rw9w7an0': {
      'en': '\$70',
      'ar': '70 دولارًا',
      'fr': '',
    },
    'tv827b5j': {
      'en': 'Project Management Mastery',
      'ar': 'إتقان إدارة المشاريع',
      'fr': '',
    },
    'z57611iz': {
      'en': 'Lead projects to success with proven methodologies.',
      'ar': 'قيادة المشاريع إلى النجاح باستخدام منهجيات مجربة.',
      'fr': '',
    },
    'h7f5yto6': {
      'en': '\$110',
      'ar': '110 دولار',
      'fr': '',
    },
    'kdp685r4': {
      'en': 'Courses',
      'ar': 'الدورات',
      'fr': '',
    },
  },
  // profile
  {
    'qcmz2tyc': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': '',
    },
    'tt33hhik': {
      'en': 'Upgrade',
      'ar': 'يرقي',
      'fr': '',
    },
    'lb2qogi6': {
      'en': 'Account',
      'ar': 'حساب',
      'fr': '',
    },
    '8389t992': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': '',
    },
    'jnl8758a': {
      'en': 'Payment Options',
      'ar': 'خيارات الدفع',
      'fr': '',
    },
    '6byvlonx': {
      'en': 'Language',
      'ar': 'لغة',
      'fr': '',
    },
    'csz81ld8': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'fr': '',
    },
    '8xiw1oea': {
      'en': 'General',
      'ar': 'عام',
      'fr': '',
    },
    '3t1i9dwy': {
      'en': 'Support',
      'ar': 'يدعم',
      'fr': '',
    },
    'iqw30oiz': {
      'en': 'Terms of Service',
      'ar': 'شروط الخدمة',
      'fr': '',
    },
    'gbv3n0uu': {
      'en': 'Invite Friends',
      'ar': 'ادعو أصدقاء',
      'fr': '',
    },
    'te09zu8g': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': '',
    },
    'a24h04g2': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': '',
    },
  },
  // store
  {
    '1q595n6q': {
      'en': 'Medrasti',
      'ar': 'ميدراستي',
      'fr': '',
    },
    'iucoxgxv': {
      'en': 'Study Packages',
      'ar': 'الحزم الدراسية',
      'fr': '',
    },
    'ggjoyj0i': {
      'en': 'Introduction to Programming',
      'ar': 'مقدمة في البرمجة',
      'fr': '',
    },
    '0bqtdjql': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    'b92zhhlh': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'sfinpbu2': {
      'en': 'Students also purchased',
      'ar': 'اشترى الطلاب أيضا',
      'fr': '',
    },
    'kvqtti16': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '895ss9sm': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'mvl0bsza': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'u1ig6wrt': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'insiegdv': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    '8jrhbbpq': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'quoo576n': {
      'en':
          'Medrasti  is a worldwide educational mobile application designed to give learners the best.',
      'ar': '',
      'fr': '',
    },
    '7w3zlczq': {
      'en': 'store',
      'ar': 'محل',
      'fr': '',
    },
  },
  // Courses_list
  {
    'vntfkxjo': {
      'en': 'Courses',
      'ar': 'الدورات',
      'fr': '',
    },
    'ma15qo9a': {
      'en': 'Our courses are listed below',
      'ar': 'دوراتنا مدرجة أدناه',
      'fr': '',
    },
    '2bwcex7k': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '49yu7sjz': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'gwmld01o': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'abdfegyn': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    'saipwp9a': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    'js6h5xlj': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'haunh5n3': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'cuyvqzvz': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'zk5baiow': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    '6m9g2i9k': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    'kzelrp36': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'ee1ml12g': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    '1f4g4xgy': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'uyb5jo9t': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    'vtd4v12s': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    'zhnvnw4n': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '9f8ebjtj': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    '4s6cmyz1': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    '429rqrmz': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    'wdby731h': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    '1eoctsgm': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'e4c07hod': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'yfq2i8tu': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'v968a95k': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    '7w32a3ob': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    'jxpiofru': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // discount
  {
    'o6bkn19p': {
      'en': 'Discover Our Courses',
      'ar': 'اكتشف دوراتنا',
      'fr': '',
    },
    'wuae4phy': {
      'en':
          'Learn new skills with our expert-taught courses and save with these exclusive offers!',
      'ar':
          'تعلم مهارات جديدة من خلال دوراتنا التي يدرسها الخبراء ووفّر مع هذه العروض الحصرية!',
      'fr': '',
    },
    'mjara1rj': {
      'en': 'Boost your brand\'s online presence',
      'ar': 'تعزيز تواجد علامتك التجارية على الإنترنت',
      'fr': '',
    },
    'bjt627b1': {
      'en': 'Digital Marketing',
      'ar': 'التسويق الرقمي',
      'fr': '',
    },
    'c0hfc3oz': {
      'en': '20% OFF',
      'ar': '20٪ خصم',
      'fr': '',
    },
    'xfkjz16q': {
      'en': 'UX/UI Design',
      'ar': 'تصميم تجربة المستخدم/واجهة المستخدم',
      'fr': '',
    },
    'vug3536b': {
      'en': 'Create stunning user interfaces',
      'ar': 'إنشاء واجهات مستخدم مذهلة',
      'fr': '',
    },
    'gif5h2vr': {
      'en': '30% OFF',
      'ar': 'تخفيض 30',
      'fr': '',
    },
    'iy8tzu3f': {
      'en': 'Photography',
      'ar': 'التصوير',
      'fr': '',
    },
    '0vzrs5b4': {
      'en': 'Capture the world around you',
      'ar': 'التقط العالم من حولك',
      'fr': '',
    },
    'c3z5yjic': {
      'en': '15% OFF',
      'ar': 'خصم 15%',
      'fr': '',
    },
    't1hbags7': {
      'en': 'Programming Basics',
      'ar': 'أساسيات البرمجة',
      'fr': '',
    },
    'tdw4uzmm': {
      'en': 'Start coding with essential skills',
      'ar': 'ابدأ البرمجة باستخدام المهارات الأساسية',
      'fr': '',
    },
    'i8h88b2k': {
      'en': '10% OFF',
      'ar': 'خصم 10',
      'fr': '',
    },
    'tiq6dae6': {
      'en': 'Courses Offers',
      'ar': 'عروض الدورات',
      'fr': '',
    },
  },
  // Edit_profile
  {
    '8uj1825k': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'fr': '',
    },
    'm1cnsq7a': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'fr': '',
    },
    'nahxj8iq': {
      'en': 'Female',
      'ar': 'أنثى',
      'fr': '',
    },
    'rv7j7yba': {
      'en': 'Male',
      'ar': 'ذكر',
      'fr': '',
    },
    '4g1vboab': {
      'en': 'Gender',
      'ar': 'جنس',
      'fr': '',
    },
    'gs5rl0gx': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'fr': '',
    },
    'nrvgwxqn': {
      'en': 'Phone',
      'ar': 'هاتف',
      'fr': '',
    },
    'adu3tp55': {
      'en': 'Student',
      'ar': 'طالب',
      'fr': '',
    },
    'sm8hf5uf': {
      'en': 'State',
      'ar': 'ولاية',
      'fr': '',
    },
    'amwa2cnn': {
      'en': 'State',
      'ar': 'ولاية',
      'fr': '',
    },
    'zkridiy7': {
      'en': 'Alabama',
      'ar': 'ألاباما',
      'fr': '',
    },
    'u5cq2co2': {
      'en': 'Alaska',
      'ar': 'ألاسكا',
      'fr': '',
    },
    'itoj64hz': {
      'en': 'Arizona',
      'ar': 'أريزونا',
      'fr': '',
    },
    'gah8x266': {
      'en': 'Arkansas',
      'ar': 'أركنساس',
      'fr': '',
    },
    'ya3rt8h7': {
      'en': 'California',
      'ar': 'كاليفورنيا',
      'fr': '',
    },
    'eaibzwz0': {
      'en': 'Colorado',
      'ar': 'كولورادو',
      'fr': '',
    },
    're2b7qkk': {
      'en': 'Connecticut',
      'ar': 'كونيتيكت',
      'fr': '',
    },
    'jiqr2haj': {
      'en': 'Delaware',
      'ar': 'ديلاوير',
      'fr': '',
    },
    'sqxrzxqn': {
      'en': 'Florida',
      'ar': 'فلوريدا',
      'fr': '',
    },
    'ef71hniw': {
      'en': 'Georgia',
      'ar': 'جورجيا',
      'fr': '',
    },
    'zgxmrbv6': {
      'en': 'Hawaii',
      'ar': 'هاواي',
      'fr': '',
    },
    'hr268k1j': {
      'en': 'Idaho',
      'ar': 'ايداهو',
      'fr': '',
    },
    '2fx6vxnj': {
      'en': 'Illinoi',
      'ar': 'إلينوي',
      'fr': '',
    },
    'kdv17xjt': {
      'en': 'Indiana',
      'ar': 'إنديانا',
      'fr': '',
    },
    'ym5ka2ys': {
      'en': 'Iowa',
      'ar': 'ايوا',
      'fr': '',
    },
    'q2pc0fp0': {
      'en': 'Kansas',
      'ar': 'كانساس',
      'fr': '',
    },
    'rum3olba': {
      'en': 'Kentucky',
      'ar': 'كنتاكي',
      'fr': '',
    },
    'bpo61il6': {
      'en': 'Louisiana',
      'ar': 'لويزيانا',
      'fr': '',
    },
    'hmhdly9c': {
      'en': 'Maine',
      'ar': 'مين',
      'fr': '',
    },
    'cajmbcpq': {
      'en': 'Maryland',
      'ar': 'ميريلاند',
      'fr': '',
    },
    'gq6ml3wi': {
      'en': 'Massachusetts',
      'ar': 'ماساتشوستس',
      'fr': '',
    },
    '30dvk8cl': {
      'en': 'Michigan',
      'ar': 'ميشيغان',
      'fr': '',
    },
    '2hg0nyw7': {
      'en': 'Minnesota',
      'ar': 'مينيسوتا',
      'fr': '',
    },
    'fq8jg0c4': {
      'en': 'Mississippi',
      'ar': 'ميسيسيبي',
      'fr': '',
    },
    '6nq8aqi0': {
      'en': 'Missouri',
      'ar': 'ميسوري',
      'fr': '',
    },
    'ldlvw67c': {
      'en': 'Monta',
      'ar': 'مونتا',
      'fr': '',
    },
    'y09wrgsj': {
      'en': 'Nebraska',
      'ar': 'نبراسكا',
      'fr': '',
    },
    '6f30tgtj': {
      'en': 'Nevada',
      'ar': 'نيفادا',
      'fr': '',
    },
    'tpf0u1uu': {
      'en': 'New Hampshire',
      'ar': 'نيو هامبشاير',
      'fr': '',
    },
    'nwzogtjo': {
      'en': 'New Jersey',
      'ar': 'نيو جيرسي',
      'fr': '',
    },
    'vrttoo7j': {
      'en': 'New Mexico',
      'ar': 'المكسيك جديدة',
      'fr': '',
    },
    'yw9rqoeg': {
      'en': 'New York',
      'ar': 'نيويورك',
      'fr': '',
    },
    's8uz06g2': {
      'en': 'North Carolina',
      'ar': 'شمال كارولينا',
      'fr': '',
    },
    '571orbgz': {
      'en': 'North Dak',
      'ar': 'شمال داك',
      'fr': '',
    },
    'k05c8z9n': {
      'en': 'Ohio',
      'ar': 'أوهايو',
      'fr': '',
    },
    'fpnfkwr4': {
      'en': 'Oklahoma',
      'ar': 'أوكلاهوما',
      'fr': '',
    },
    '9jwn3nun': {
      'en': 'Oregon',
      'ar': 'ولاية أوريغون',
      'fr': '',
    },
    'qn6i57ru': {
      'en': 'Pennsylvani',
      'ar': 'بنسلفانيا',
      'fr': '',
    },
    'crg9qkxe': {
      'en': 'Rhode Island',
      'ar': 'جزيرة رود',
      'fr': '',
    },
    'sy8d9hk8': {
      'en': 'South Caroli',
      'ar': 'جنوب كارولي',
      'fr': '',
    },
    'br11guam': {
      'en': 'South Dakota',
      'ar': 'جنوب داكوتا',
      'fr': '',
    },
    '303y0b46': {
      'en': 'Tennessee',
      'ar': 'تينيسي',
      'fr': '',
    },
    'r03tujr2': {
      'en': 'Texas',
      'ar': 'تكساس',
      'fr': '',
    },
    'fsazf1qh': {
      'en': 'Utah',
      'ar': 'يوتا',
      'fr': '',
    },
    'lazggv37': {
      'en': 'Vermont',
      'ar': 'فيرمونت',
      'fr': '',
    },
    'k6h1ze3g': {
      'en': 'Virginia',
      'ar': 'فرجينيا',
      'fr': '',
    },
    'kb37kpwu': {
      'en': 'Washingto',
      'ar': 'واشنطن',
      'fr': '',
    },
    'cq83rdjy': {
      'en': 'West Virginia',
      'ar': 'فرجينيا الغربية',
      'fr': '',
    },
    'nvxa4ffd': {
      'en': 'Wisconsin',
      'ar': 'ويسكونسن',
      'fr': '',
    },
    'ela0b4vt': {
      'en': 'Wyoming',
      'ar': 'وايومنغ',
      'fr': '',
    },
    'be35pipc': {
      'en': 'Select State',
      'ar': 'اختر ولايه',
      'fr': '',
    },
    '9thjhy5t': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': '',
    },
    'vuvlh8t1': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': '',
    },
  },
  // Success03
  {
    'h6s9viaq': {
      'en': 'Congrats!',
      'ar': 'تهاني!',
      'fr': '',
    },
    'aesdzucr': {
      'en': 'Quiz Results Submitted',
      'ar': 'تم إرسال نتائج الاختبار',
      'fr': '',
    },
    '8ykjt6jv': {
      'en': 'You completed a quiz from:',
      'ar': 'لقد أكملت اختبارًا من:',
      'fr': '',
    },
    'mgb3er8t': {
      'en': 'Abigail Rogers',
      'ar': 'أبيجيل روجرز',
      'fr': '',
    },
    '6vsftui4': {
      'en': 'abigail.rogers@domain.com',
      'ar': 'abigail.rogers@domain.com',
      'fr': '',
    },
    '4i2643dn': {
      'en': 'Go Home',
      'ar': 'اذهب للمنزل',
      'fr': '',
    },
    '4pru7uzg': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // SupportForm
  {
    '5xigbmbv': {
      'en': 'Submit Ticket',
      'ar': 'قدم التذكرة',
      'fr': '',
    },
    '4h1qmrhy': {
      'en': 'Welcome to support',
      'ar': 'مرحبا بكم في الدعم',
      'fr': '',
    },
    'y6zp1h1u': {
      'en': 'Submit a Ticket',
      'ar': 'تسجيل التذكرة',
      'fr': '',
    },
    'mc86u215': {
      'en': 'Call Us',
      'ar': 'اتصل بنا',
      'fr': '',
    },
    'i6zteyzo': {
      'en': 'Email Us',
      'ar': 'ارسل لنا عبر البريد الإلكتروني',
      'fr': '',
    },
    '83yci8a3': {
      'en': 'Search FAQs',
      'ar': 'البحث في الأسئلة الشائعة',
      'fr': '',
    },
    '36yr24fo': {
      'en': 'Course Name',
      'ar': 'اسم الدورة التدريبية',
      'fr': '',
    },
    'z5yp92j4': {
      'en': 'Issue',
      'ar': 'مشكلة',
      'fr': '',
    },
    'c850tpo5': {
      'en': 'Short Description of what is going on...',
      'ar': 'وصف مختصر لما يحدث...',
      'fr': '',
    },
    '9fo10erp': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
      'fr': '',
    },
    'q01q69z1': {
      'en': 'Submit Ticket',
      'ar': 'قدم التذكرة',
      'fr': '',
    },
    'kd26cmp8': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // Payment
  {
    'jne5on17': {
      'en': 'PayPal',
      'ar': 'باي بال',
      'fr': '',
    },
    'e1vkp99b': {
      'en': 'Google Pay',
      'ar': 'جوجل الدفع',
      'fr': '',
    },
    '1tkht5to': {
      'en': 'Apple Pay',
      'ar': 'أبل الدفع',
      'fr': '',
    },
    '2omjjbnz': {
      'en': 'MasterCard',
      'ar': 'بطاقة ماستر بطاقة ائتمان',
      'fr': '',
    },
    'l872uron': {
      'en': 'Payment',
      'ar': 'قسط',
      'fr': '',
    },
  },
  // Pricingplans
  {
    '8fj7ne35': {
      'en': 'Choose Your Plan',
      'ar': 'اختر خطتك',
      'fr': '',
    },
    'gs1a4u7d': {
      'en': 'Select the best plan that fits your educational needs.',
      'ar': 'اختر أفضل خطة تناسب احتياجاتك التعليمية.',
      'fr': '',
    },
    '2y6tka30': {
      'en': 'Basic',
      'ar': 'أساسي',
      'fr': '',
    },
    'gafmhmpw': {
      'en': 'Access to free courses and limited resources.',
      'ar': 'الوصول إلى الدورات المجانية والموارد المحدودة.',
      'fr': '',
    },
    'jvdwq3pt': {
      'en': 'Free',
      'ar': 'حر',
      'fr': '',
    },
    'a8eyqylh': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': '',
    },
    'znwgwcpq': {
      'en': 'Standard',
      'ar': 'معيار',
      'fr': '',
    },
    '4a2ahqk4': {
      'en':
          'Includes everything in Basic, plus interactive quizzes and support.',
      'ar': 'يشمل كل شيء في Basic، بالإضافة إلى الاختبارات التفاعلية والدعم.',
      'fr': '',
    },
    'mlqkmyo4': {
      'en': '\$19.99/mo',
      'ar': '19.99 دولارًا شهريًا',
      'fr': '',
    },
    'clinbtzc': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': '',
    },
    'u04x1i98': {
      'en': 'Premium',
      'ar': 'غالي',
      'fr': '',
    },
    'mvw9ju3e': {
      'en':
          'All Standard features, plus unlimited course access and certifications.',
      'ar':
          'جميع الميزات القياسية، بالإضافة إلى الوصول غير المحدود للدورة والشهادات.',
      'fr': '',
    },
    'ml8lvv8b': {
      'en': '\$49.99/mo',
      'ar': '49.99 دولارًا شهريًا',
      'fr': '',
    },
    'xh351ytg': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': '',
    },
    'lmaesat0': {
      'en': 'Enterprise',
      'ar': 'مَشرُوع',
      'fr': '',
    },
    'k51ix2m1': {
      'en': 'Custom solutions for organizations and educational institutions.',
      'ar': 'حلول مخصصة للمؤسسات والمؤسسات التعليمية.',
      'fr': '',
    },
    'rnsvdurk': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
      'fr': '',
    },
    'g3mi8dxf': {
      'en': 'Select',
      'ar': 'يختار',
      'fr': '',
    },
    'zr3jmjdd': {
      'en': 'Pricing Plans',
      'ar': 'خطط التسعير',
      'fr': '',
    },
  },
  // notificatons
  {
    'jx7qgkqm': {
      'en': 'check.io',
      'ar': 'check.io',
      'fr': '',
    },
    '37imy73r': {
      'en': 'Platform Navigation',
      'ar': 'التنقل في المنصة',
      'fr': '',
    },
    '7r6s3v06': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
      'fr': '',
    },
    '3l60dhas': {
      'en': 'Chats',
      'ar': 'الدردشات',
      'fr': '',
    },
    'v0o7v9p7': {
      'en': 'Projects',
      'ar': 'المشاريع',
      'fr': '',
    },
    'oxxefpff': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'fr': '',
    },
    '3tpy4g2e': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'fr': '',
    },
    'rju6rd9q': {
      'en': '12',
      'ar': '12',
      'fr': '',
    },
    'onuw0zss': {
      'en': 'Billing',
      'ar': 'الفواتير',
      'fr': '',
    },
    '4fhjmll1': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'drfuqz9j': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'fr': '',
    },
    'zxbm1qw5': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fr': '',
    },
    's303qg6j': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
      'fr': '',
    },
    'w0z75lx9': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
      'fr': '',
    },
    '5jfz6cdz': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'fr': '',
    },
    '9p2rwwh4': {
      'en': 'Below is a list of recent activity',
      'ar': 'فيما يلي قائمة بالأنشطة الأخيرة',
      'fr': '',
    },
    'eq0jdbba': {
      'en': 'New courses posted',
      'ar': 'تم نشر دورات جديدة',
      'fr': '',
    },
    'imqjz9e9': {
      'en': ' Begin Work',
      'ar': 'بدء العمل',
      'fr': '',
    },
    '08892nha': {
      'en': 'SOW Change Order',
      'ar': 'SOW تغيير الطلب',
      'fr': '',
    },
    'two6dh1m': {
      'en': 'FlutterFlow CRM App',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
      'fr': '',
    },
    '2aejcbkh': {
      'en': 'Jul 8, at 4:31pm',
      'ar': '8 يوليو، الساعة 4:31 مساءً',
      'fr': '',
    },
    'obj8t8dt': {
      'en': 'New lesson Started ',
      'ar': 'بدأ الدرس الجديد',
      'fr': '',
    },
    'j3rw3806': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'itk4gq9r': {
      'en': 'Medrasti Change Order',
      'ar': 'SOW تغيير الطلب',
      'fr': '',
    },
    'f1u79kxx': {
      'en': 'Medrsati',
      'ar': 'مدرستي',
      'fr': '',
    },
    'rzltwudt': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'ar':
          '\"سيتم إرسال الإخطارات والتذكيرات لإعلام المستخدمين بالفصول القادمة وجداول التدريب عبر البريد الإلكتروني أو الرسائل النصية القصيرة أو الإشعارات داخل التطبيق.\"',
      'fr': '',
    },
    'q9iiag6e': {
      'en': 'Jul 8, at 4:30pm',
      'ar': '8 يوليو، الساعة 4:30 مساءً',
      'fr': '',
    },
    'did1n11w': {
      'en': 'Randy Rudolph ',
      'ar': 'راندي رودولف',
      'fr': '',
    },
    'l3xhny0b': {
      'en': 'uploaded a new course',
      'ar': 'أرسل أمر تغيير SOW لـ',
      'fr': '',
    },
    '0p28wqv8': {
      'en': '',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
      'fr': '',
    },
    't1kln36n': {
      'en': 'Medrasti Change Order',
      'ar': 'SOW تغيير الطلب',
      'fr': '',
    },
    'v49ceo5v': {
      'en': 'Medrasti app update',
      'ar': 'تحديث تطبيق مدراستي',
      'fr': '',
    },
    'pwrulb9u': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'ar': '\"يُرجى مراجعة التحديثات على هذه الوثيقة والتواصل معي مرة أخرى.\"',
      'fr': '',
    },
    'fi1n70n6': {
      'en': 'Jul 8, at 2:20pm',
      'ar': '8 يوليو، الساعة 2:20 مساءً',
      'fr': '',
    },
    'xxzc8hl5': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': '',
    },
  },
  // Orders
  {
    'koxeohfz': {
      'en': 'Recent Orders',
      'ar': '',
      'fr': '',
    },
    'vpmwcf2c': {
      'en': 'Below are your most recent orders',
      'ar': '',
      'fr': '',
    },
    '7mj2lxi2': {
      'en': 'Order #: ',
      'ar': '',
      'fr': '',
    },
    'oiktjetg': {
      'en': '429242424',
      'ar': '',
      'fr': '',
    },
    '5tabzcd3': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'fr': '',
    },
    'yzub4w2h': {
      'en': 'New course',
      'ar': '',
      'fr': '',
    },
    '6649oxye': {
      'en': '\$15.50',
      'ar': '',
      'fr': '',
    },
    'fobppbcu': {
      'en': 'Shipped',
      'ar': '',
      'fr': '',
    },
    'a2346fl6': {
      'en': 'Order #: ',
      'ar': '',
      'fr': '',
    },
    'jovkymci': {
      'en': '429242424',
      'ar': '',
      'fr': '',
    },
    '5ypo6kpm': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'fr': '',
    },
    'cxyanufg': {
      'en': 'New course',
      'ar': '',
      'fr': '',
    },
    'cenwbzhp': {
      'en': '\$41.50',
      'ar': '',
      'fr': '',
    },
    'g7mvt6yq': {
      'en': 'Shipped',
      'ar': '',
      'fr': '',
    },
    'dunmwcpo': {
      'en': 'Order #: ',
      'ar': '',
      'fr': '',
    },
    'c2qn2tze': {
      'en': '429242424',
      'ar': '',
      'fr': '',
    },
    'nbhjczk3': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'fr': '',
    },
    'fyo1nvsz': {
      'en': 'New course',
      'ar': '',
      'fr': '',
    },
    'q6440swl': {
      'en': '\$10.50',
      'ar': '',
      'fr': '',
    },
    'eru9mo3c': {
      'en': 'Accepted',
      'ar': '',
      'fr': '',
    },
    '4iisubzh': {
      'en': 'Order #: ',
      'ar': '',
      'fr': '',
    },
    '02ot3roe': {
      'en': '429242424',
      'ar': '',
      'fr': '',
    },
    'l7l46upa': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'fr': '',
    },
    'gjezldpg': {
      'en': 'New course',
      'ar': '',
      'fr': '',
    },
    'iak33evd': {
      'en': '\$1.50',
      'ar': '',
      'fr': '',
    },
    'zcgz6g4o': {
      'en': 'Accepted',
      'ar': '',
      'fr': '',
    },
    'wk5aq1wz': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // more
  {
    'y12dhsid': {
      'en': 'Explore additional features and settings',
      'ar': '',
      'fr': '',
    },
    'yp62g201': {
      'en': 'Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '4d1xsr7c': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'fr': '',
    },
    'ae9ir8mn': {
      'en': 'View plans',
      'ar': 'عرض الخطط',
      'fr': '',
    },
    'q68kjg2w': {
      'en': 'Buy now',
      'ar': 'اشتري الآن',
      'fr': '',
    },
    'kc7myln3': {
      'en': '\$40',
      'ar': '40 دولارًا',
      'fr': '',
    },
    'se4y1kov': {
      'en': 'Profile',
      'ar': '',
      'fr': '',
    },
    'ylprf9xp': {
      'en': 'Courses',
      'ar': '',
      'fr': '',
    },
    'h7bacjq7': {
      'en': 'Discounts',
      'ar': '',
      'fr': '',
    },
    'rc6908z5': {
      'en': 'Payment',
      'ar': '',
      'fr': '',
    },
    '0hej4zzk': {
      'en': 'Discount offers',
      'ar': 'مقدمة في البرمجة',
      'fr': '',
    },
    '0043z7fc': {
      'en': 'Docs & Videos',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    'ocww4ton': {
      'en': 'Explore Courses',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    '24qz21nj': {
      'en': 'Support',
      'ar': '',
      'fr': '',
    },
    'ca0wg4wh': {
      'en': 'Settings',
      'ar': '',
      'fr': '',
    },
    'zuewamg2': {
      'en': 'Log Out',
      'ar': '',
      'fr': '',
    },
    'axaz121m': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // notifications_page
  {
    '4rc0v067': {
      'en': 'Manage your notification preferences',
      'ar': '',
      'fr': '',
    },
    'cvfn4j3s': {
      'en': 'General Notifications',
      'ar': '',
      'fr': '',
    },
    '6vxovitb': {
      'en': 'Sounds',
      'ar': '',
      'fr': '',
    },
    '9n5v7pvg': {
      'en': 'Vibrate',
      'ar': '',
      'fr': '',
    },
    'ep5n23oa': {
      'en': 'Promo & Discounts',
      'ar': '',
      'fr': '',
    },
    'q177s232': {
      'en': 'Payment Notifications',
      'ar': '',
      'fr': '',
    },
    '9xur88hs': {
      'en': 'Cashback Notifications',
      'ar': '',
      'fr': '',
    },
    'rspc03cm': {
      'en': 'App Updates',
      'ar': '',
      'fr': '',
    },
    'm4rgew6t': {
      'en': 'News Service Available',
      'ar': '',
      'fr': '',
    },
    'r6s40c6j': {
      'en': 'News Tip Available',
      'ar': '',
      'fr': '',
    },
    '3jzm96vm': {
      'en': 'Notifications',
      'ar': '',
      'fr': '',
    },
  },
  // Course01
  {
    'ccatnrs6': {
      'en': 'medrasti courses',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    '677kjaul': {
      'en': 'Fullstack Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'wsik92kx': {
      'en': '177,117 students learning this week',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'dw4qb2l0': {
      'en': '01.',
      'ar': '',
      'fr': '',
    },
    'gpafx0k6': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '9x1t4xki': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    '90cuq5es': {
      'en': '02.',
      'ar': '',
      'fr': '',
    },
    'irpm3xcs': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'wpde92eh': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    '34voin7t': {
      'en': '03.',
      'ar': '',
      'fr': '',
    },
    '92jqjj4c': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '6qp8plts': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'kizjtunt': {
      'en': '04.',
      'ar': '',
      'fr': '',
    },
    '20uafc3s': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '08gq8blr': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'i2hckfm2': {
      'en': 'About this Course',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'f4raiy7x': {
      'en': '283 Videos included',
      'ar': '',
      'fr': '',
    },
    'bcfc3ejw': {
      'en': 'Detailed and comprehensive ',
      'ar': '',
      'fr': '',
    },
    'iznoxfps': {
      'en': '1834 ratings',
      'ar': '',
      'fr': '',
    },
    '6tyiw7wj': {
      'en': '838 students learning this week',
      'ar': '',
      'fr': '',
    },
    '3jbhjvkx': {
      'en': 'View plans',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    '6u7c2mrt': {
      'en': 'Enroll Now',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'blfkvoh3': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // Course0101
  {
    'rf4r2ypv': {
      'en': 'Fullstack Web Development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'imh18fvv': {
      'en': '01.',
      'ar': '',
      'fr': '',
    },
    'b4zjhrkx': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '9o42tzbw': {
      'en': '5 videos',
      'ar': '',
      'fr': '',
    },
    '81wdh2tf': {
      'en': '02.',
      'ar': '',
      'fr': '',
    },
    '7ofi1jj3': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'kdpmi5y6': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    '0un9zj5p': {
      'en': '03.',
      'ar': '',
      'fr': '',
    },
    'itv71mid': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '1onhei27': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    '1zb1g9ve': {
      'en': '04.',
      'ar': '',
      'fr': '',
    },
    'ugix9mw4': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '1pqiz8nt': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'bbxnxrk1': {
      'en': '05.',
      'ar': '',
      'fr': '',
    },
    'nphdxcx7': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'z4p35cuf': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'eii1hpit': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // Course01011
  {
    'u0k54ivs': {
      'en': 'Basics of Full stack development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'oyyeyeh7': {
      'en': 'Basics of HTML-1',
      'ar': '',
      'fr': '',
    },
    's2s6qmbc': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    'rhm8n6me': {
      'en': 'Basics of HTML-2',
      'ar': '',
      'fr': '',
    },
    'jbhp5tdi': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    '0ukj0xsq': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // Course01011Video
  {
    'pagkvt6h': {
      'en': 'Basics of HTML-1',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'joxlvvj9': {
      'en': 'Up next',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'loj0thrz': {
      'en': 'Basics of HTML-1',
      'ar': '',
      'fr': '',
    },
    '41up4ee0': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    'u8kp1x2t': {
      'en': 'Other Options',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '4x2dl6xk': {
      'en': 'Unlock all videos',
      'ar': '',
      'fr': '',
    },
    'buih6m45': {
      'en': 'Share with a friend',
      'ar': '',
      'fr': '',
    },
    'ux6ww62k': {
      'en': 'Save to my list',
      'ar': '',
      'fr': '',
    },
    'obj04wdq': {
      'en': 'Save to my list',
      'ar': '',
      'fr': '',
    },
    'rd59bwsj': {
      'en': 'Join medrasti premium',
      'ar': '',
      'fr': '',
    },
    'nhb5j07z': {
      'en': 'View All',
      'ar': 'عرض الكل',
      'fr': '',
    },
    'gsamyddx': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // Docs_and_videos
  {
    '3fct74zz': {
      'en': 'Docs',
      'ar': '',
      'fr': '',
    },
    'd1okxjp8': {
      'en': 'Select a course to view all vidoes',
      'ar': '',
      'fr': '',
    },
    'd9bw9z3f': {
      'en': '01.',
      'ar': '',
      'fr': '',
    },
    '9tw5mzo6': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '25zk7koy': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'aio9itio': {
      'en': '02.',
      'ar': '',
      'fr': '',
    },
    'gqfrkud9': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'cijv9ktz': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'kbphr3i8': {
      'en': '03.',
      'ar': '',
      'fr': '',
    },
    '4bgr0jpz': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'us8cz28w': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    '8sfixeoa': {
      'en': '04.',
      'ar': '',
      'fr': '',
    },
    'fez3a8pr': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '0y8omqmi': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'kg7tcxaa': {
      'en': 'Videos',
      'ar': '',
      'fr': '',
    },
    '6q5ms5x0': {
      'en': '01.',
      'ar': '',
      'fr': '',
    },
    'qdpybybw': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'a005z7ef': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'x2ji3u6a': {
      'en': '02.',
      'ar': '',
      'fr': '',
    },
    '8o0w33xj': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    '222owv9k': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'h63f6zs2': {
      'en': '03.',
      'ar': '',
      'fr': '',
    },
    'w0z3dekp': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'c5lx1m18': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'ay8g1jo7': {
      'en': '04.',
      'ar': '',
      'fr': '',
    },
    '2mg2iyts': {
      'en': 'Basics of Full stack development',
      'ar': '',
      'fr': '',
    },
    'libk6e94': {
      'en': '5 subtopics',
      'ar': '',
      'fr': '',
    },
    'ylqrnqif': {
      'en': 'About this Course',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '7uwp5c49': {
      'en': '283 Videos included',
      'ar': '',
      'fr': '',
    },
    'y5qffgh2': {
      'en': 'Detailed and comprehensive ',
      'ar': '',
      'fr': '',
    },
    'jgzkk1rq': {
      'en': '1834 ratings',
      'ar': '',
      'fr': '',
    },
    'uxr2idcu': {
      'en': '838 students learning this week',
      'ar': '',
      'fr': '',
    },
    'gmz52cyk': {
      'en': 'View plans',
      'ar': 'المستندات ومقاطع الفيديو',
      'fr': '',
    },
    'i8e26l45': {
      'en': 'Enroll Now',
      'ar': 'استكشاف الدورات',
      'fr': '',
    },
    'f6g2lhw6': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Course01011pdf
  {
    'neelc41g': {
      'en': 'Basics of Full stack development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    '2aatzz9c': {
      'en': 'Basics of HTML-1 pdf',
      'ar': '',
      'fr': '',
    },
    'z2x093sg': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    'cm43nuqa': {
      'en': 'Basics of HTML-2 pdf',
      'ar': '',
      'fr': '',
    },
    'yum1pmte': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    '43umzboh': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // Course01011pdfread
  {
    'bez0unqm': {
      'en': 'Basics of Full stack development',
      'ar': 'تطوير الشبكة',
      'fr': '',
    },
    'ttvoyayt': {
      'en': 'Basics of HTML-1',
      'ar': '',
      'fr': '',
    },
    'ri3prktp': {
      'en': 'video | 178 min',
      'ar': '',
      'fr': '',
    },
    's232j3n7': {
      'en': 'More',
      'ar': '',
      'fr': '',
    },
  },
  // header
  {
    '78fsz7x6': {
      'en': 'Top Podcast on App',
      'ar': 'أفضل البودكاست على التطبيق',
      'fr': '',
    },
    'jbrv3a2g': {
      'en': 'Author Name',
      'ar': 'اسم المؤلف',
      'fr': '',
    },
    'nm199nod': {
      'en': 'Follow',
      'ar': 'يتبع',
      'fr': '',
    },
    'nkotkddk': {
      'en': 'Following',
      'ar': 'التالي',
      'fr': '',
    },
  },
  // Modal05CreateProject
  {
    'm24wkjjl': {
      'en': 'Create Project',
      'ar': 'إنشاء مشروع',
      'fr': '',
    },
    'gfvutq86': {
      'en': 'Please enter the information below to add a project.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة مشروع.',
      'fr': '',
    },
    'zw8na8wh': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': '',
    },
    'pld2j51g': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
      'fr': '',
    },
    'dyf9pbc8': {
      'en': 'Showcase Project Name',
      'ar': 'عرض اسم المشروع',
      'fr': '',
    },
    'u6anb87q': {
      'en': 'Description here...',
      'ar': 'الوصف هنا...',
      'fr': '',
    },
    'sm5h8msj': {
      'en': 'URL of the project',
      'ar': 'عنوان URL للمشروع',
      'fr': '',
    },
    'vasltge5': {
      'en': 'Clonable Link URL...',
      'ar': 'عنوان URL للرابط القابل للاستنساخ...',
      'fr': '',
    },
    'syt39qdg': {
      'en': 'Create Showcase',
      'ar': 'إنشاء عرض',
      'fr': '',
    },
    'legdt7xx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': '',
    },
    'lyxb8csw': {
      'en': 'Please enter a real name',
      'ar': 'الرجاء إدخال الاسم الحقيقي',
      'fr': '',
    },
    '3rkk2q0d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': '',
    },
    'ax117xr2': {
      'en': 'Please enter a short desription',
      'ar': 'الرجاء إدخال وصف قصير',
      'fr': '',
    },
    'nxigthoa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': '',
    },
    '480v3hpy': {
      'en': 'We have to have a URL for the project.',
      'ar': 'يجب أن يكون لدينا عنوان URL للمشروع.',
      'fr': '',
    },
    'dleyods5': {
      'en': 'Please enter a valid URL...',
      'ar': 'أدخل رابط صحيح من فضلك...',
      'fr': '',
    },
    'lpx0fv8t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': '',
    },
    'gjepoxwj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': '',
    },
    'kw8ci40f': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
