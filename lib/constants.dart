import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Default values
const defaultBoolean = false;
const defaultInt = 0;
const defaultDouble = 0.0;
const defaultString = "";
const spaceString = " ";
const newLineString = "\n";

// App colors (main)
const colorPrimary = const Color(0xFF353A44);
const colorAccent = const Color(0xFF258633);

//button gradient
const color_red = const Color(0xFFDB0007);
const color_orange = const Color(0xFFEF6A0A);
const color_lightorange = const Color(0xFFFF810D);

//text color
const colorsubtitle = const Color(0xFF4D5466);
const colortitle = const Color(0xFF11243D);
const colorhint = const Color(0xff969696);


// App colors (light)
const colorLightGray1 = const Color(0xFF353A44);
const colorLightGray2 = const Color(0xFF404551);
const colorLightGray3 = const Color(0xFF6A6B6D);
const colorLightGray4 = const Color(0xFF8F949E);
const colorLightGray5 = const Color(0xFF272B31);
const colorLightGray6 = const Color(0xFFD5D5D5);
const colorLightGray7 = const Color(0xFF333741);
const colorLightWhite1 = const Color(0xFFFAFAFA);
const colorLightWhite2 = const Color(0xFFDBDBDB);
const colorLightGreen1 = const Color(0xFF0ABB87);
const colorLightGreenAccent1 = const Color(0xFF20C3AF);
const colorLightGreenAccent2 = const Color(0xFFDDF6F3);
const colorLightOrange1 = const Color(0xFFFF9900);

const colorGreenNormal = Color(0xFF5BC652);
const colorGreenSecondary = Color(0xFF009E35);
const colorGreenPrimary = Color(0xFF0B6C2C);
const colorGreenLight = Color(0xFFDEF4DC);
const colorGrayPrimary = Color(0xFF002923);
const colorGraySecondary = Color(0xFF555958);
const colorGrayNormal = Color(0xFFA9ABAB);
const colorPending = Color(0xFFFEA400);
const colorTextRegular = Color(0xFF092C4C);
const colorTextSecondary = Color(0xFF555958);
const colorTextBold = Color(0xFF002923);
const colorTextLight = Color(0xFF0C0A0A);




// App colors (others)
const Color colorSplashNavigationBarBackground = const Color(0xFF0B0C0E);
const Color colorPageBackground = const Color(0xFFF4F5F7);

// Service
const SystemUiOverlayStyle systemUiOverlayStyleGlobal =
    const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.light,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);

// App essentials
const String responseOfJsonType = "application/json";
const String fontFamilyPoppins = "Poppins";
const String fontFamilyRoboto = "Roboto";
const String valueClientID = "APP_CLIENT";
const String valueClientSecret = "APP_CLIENT_AF61E59520943DC26494F8941B";
const String valueGrantTypeClientCredentials = "client_credentials";
const String valueGrantTypeRefreshToken = "refresh_token";
const int minimumPasswordLength = 8;
const int minimumVerificationCodeLength = 4;
const String prefixAuthToken = "Bearer ";

// Backend
const String baseDevelopmentUrl = "";
const String baseLiveUrl = "";
const String baseUrl = baseDevelopmentUrl;

const String baseAppDevelopmentUrl = "https://demoapi.go_share.xyz";
const String baseAppLiveUrl = "";
const String baseAppUrl = baseAppDevelopmentUrl;

final String baseApiUrl = join(baseAppUrl, "api/v1");
final String tokenUrl = join(baseApiUrl, "token");
final String siteSettingsUrl = join(baseApiUrl, "sitesetting/get");
final String featuredProductsUrl = join(
  baseApiUrl,
  "item/get-featured-products",
);
final String featuredAuctionsUrl = join(
  baseApiUrl,
  "item/get-featured-auctions",
);
final String getAllBannersUrl = join(
  baseApiUrl,
  "banner/getall",
);
// Key
const String keySuccess = "success";
const String keyData = "data";
const String keyMessage = "message";
const String keyTrainingCategories = "training_categories";
const String keyTimeLengths = "time_lengths";
const String keyProfessions = "professions";
const String keyCategoryIconUrl = "cat_icon_url";
// --------------------------------------------- //
const String keyAccessToken = "access_token";
const String keyClientId = "client_id";
const String keyClientSecret = "client_secret";
const String keyGrantType = "grant_type";
const String keyUserName = "username";
const String keyPassword = "password";
const String keyUserOTP = "use_otp";
const String keySiteSettings = "site_settings";
const String keyStart = "start";
const String keyLength = "length";

// Regular Expression
const String regularExpressionEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String regularExpressionPhone =
    "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" +
        "([0-9][0-9\\- \\.]+[0-9])";


