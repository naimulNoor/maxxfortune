class AssetConstants {
  static const base_path = "assets/images/";
  static const ic_profile = base_path + "ic_profile.svg";
  static const ic_settings = base_path + "ic_settings.svg";
  static const ic_language = base_path + "ic_language.svg";
  static const img_banner_demo = base_path + "img_banner_demo.png";
  static const ic_welcome = "images/ic_welcome.jpg";
  static const ic_background = "images/ic_background_two.png";
  static const signup_bg_image = "images/signup_bg_image.png";
  static const logoTransparent = "images/ic_logo_transparent.png";


  static const base_icon_path = "images/icons/";
  static const ic_menu_svg = base_icon_path + "ic_menu.svg";
  static const ic_menu_service = base_icon_path + "gear.svg";
  static const ic_tc_svg = base_icon_path + "tc.svg";
  static const ic_home_svg = base_icon_path + "ic_home.svg";
  static const ic_free_busy_list_svg = base_icon_path + "ic_free_busy_list.svg";
  static const ic_bus_svg = base_icon_path + "ic_bus.svg";
  static const ic_notification_svg = base_icon_path + "ic_notification.svg";
  static const ic_profile_svg = base_icon_path + "ic_profile.svg";
  static const ic_settings_svg = base_icon_path + "ic_settings.svg";
  static const ic_sign_out_svg = base_icon_path + "ic_sign_out.svg";
  static const ic_vehicle_list_svg = base_icon_path + "ic_vehicle_list.svg";
  static const ic_about_us_svg = base_icon_path + "ic_about_us.svg";
  static const ic_contact_us_svg = base_icon_path + "ic_contact_us.svg";
  static const ic_driver_login_svg = base_icon_path + "ic_driver_login.svg";
  static const ic_faq_svg = base_icon_path + "ic_faq.svg";
  static const ic_privacy_and_concern_svg = base_icon_path + "ic_privacy_and_concern.svg";
  static const ic_lost_and_found_new_svg = base_icon_path + "ic_lost_and_found_new.svg";
  static const ic_terms_and_conditions_svg = base_icon_path + "ic_terms_and_conditions.svg";
  static const ic_refund_request_svg = base_icon_path + "ic_refund_request.svg";

  static const adminNoticeIcon = base_icon_path + "ic_admin_notice.svg";
  static const billingIcon = base_icon_path + "ic_billing.svg";
  static const pendingIcon = base_icon_path + "ic_pending.svg";
  static const successfulIcon = base_icon_path + "ic_successful.svg";
  static const vehicleIcon = base_icon_path + "ic_vehicle.svg";
  static const lostandFoundIcon = base_icon_path + "ic_lost_and_found.svg";


  //token app
  static const specialIcon = base_icon_path + "card-pos.svg";
  static const walletIcon = base_icon_path + "empty-wallet.svg";
  static const homeIcon = base_icon_path + "home.svg";
  static const menuIcon = base_icon_path + "menu.svg";
  static const max_fortune = base_icon_path + "max_fortune.png";
  static const notification = base_icon_path + "notification.svg";
  static const lion = base_icon_path + "lion.svg";
  static const yellowbg = base_icon_path + "yellow_bg.png";
  static const banner = base_icon_path + "banner.png";

  static const menu_active = base_icon_path + "menu_active.svg";
  static const lock = base_icon_path + "lock.svg";
  static const privacyIcon = base_icon_path + "privacy.svg";
  static const contact = base_icon_path + "mail.svg";
  static const faq = base_icon_path + "faqs.svg";
  static const refer = base_icon_path + "refer.svg";
  static const news = base_icon_path + "news.svg";
  static const address = base_icon_path + "address.svg";
  static const changepass = base_icon_path + "chagepass.svg";
  static const information = base_icon_path + "information.svg";


}

class NetworkConstants {
  //urls
  static const BASE_URL = "http://api.goshare.sg/";
  static const IMAGE_BASE_URL = "https://goshare.sg/resources/";

  //header parameters
  static const ACCEPT = "Accept";
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const DRIVER_TOKEN = "Driver-Token";
  static const GENERAL_USER_TOKEN = "GeneralUserToken";
  static const CONTENT_TYPE = "content-Type";

  //End urls
  static const SERVICE_PARTNER_SIGNUP = "servicepartner/create";
  static const SERVICE_PARTNER_LOGIN = "servicepartners/login";
  static const SERVICE_PARTNER_PROFILE = "servicepartner/profile";
  static const VEHICLE_LIST = "servicepartner/vehicles";
  static const DRIVER_LOGIN = "vehicles/login";
  static const ADD_VEHICLE = "servicepartner/vehicle/create";
  static const DRIVER_PROFILE = "vehicle/profile";
  static const SERVICE_PARTNER_PROFILE_UPDATE = "servicepartner/profile/update";
  static const SP_VEHICLE_RESET_PASSWORD = "servicepartner/vehicle/resetpassword";
  static const SEND_DRIVER_PASSWORD_RESET_CODE = "vehicle/resetpassword/code/sent";
  static const RESET_DRIVER_PASSWORD = "vehicle/resetpassword";
  static const UPDATE_VEHICLE_DETAILS = "servicepartner/vehicle/update";
  static const SEND_RESET_PASSWORD_CODE = "servicepartner/resetpassword/code/sent";
  static const RESET_SP_PASSWORD = "servicepartner/resetpassword";

  //General User Part
  static const GENERAL_USER_SIGNUP = "user/signup";
  static const GENERAL_USER_LOGIN = "user/login";
  static const GENERAL_USER_PROFILE = "user/profile";
  static const GU_REQUEST_CODE = "user/resetpassword/code/sent";
  static const GU_RESET_PASSWORD = "user/resetpassword";
  static const GU_UPDATE_PROFILE = "user/profile/update";
  static const MY_BOOKING_LIST = "user/bookings";
  static const PLACE_BOOKING = "user/booking/store";
  static const RATE_BOOKING = "user/booking/rating";
  static const CHILD_LIST = "user/children";
  static const PRICING = "pricings";
  static const BOOKING_DETAILS = "user/booking";
  static const INVOICE_DETAILS = "booking";
  static const ALL_CHILD_LIST = "vehicle/current-ride/current-children";
  static const UPDATE_CHILD = "vehicle/update/bookingtravelstatus";

  // PayNow url
  static const PAYMENT_REQUEST = "https://sandbox.xfers.io/api/v4/payment_methods/paynow";

  // Google api url
  static const GET_ADDRESS_FROM_PO_CODE= "https://maps.googleapis.sg/maps/api/geocode/json";

  //Roni's Code
  static const ABOUT_US = "/aboutus";
  static const CONTACT_US = "/contactus";
  static const LOSTANDFOUND = "/lostandfounds";
  static const FAQ = "/faqs";
  static const SETTINGS = "/settings";
  static const OURSERVICE = "/ourservices";


}

class PreferenceKey {
  static const darkMode = "darkMode";
  static const languageBengali = "languageBengali";
  static const servicePartner = "servicePartner";
  static const generalUser = "generalUser";
}

class DefaultValue {
  static const bool kDefaultBoolean = false;
  static const int kDefaultInt = 0;
  static const double kDefaultDouble = 0.0;
  static const String kDefaultString = '';
}

class KeyConstants {
  static const TOKEN_KEY = "token";
  static const EMAIL_VERIFIED_KEY = "email_verified";
  static const DEVICE_VERIFIED_KEY = "device_verified";
  static const DEVICE_COOKIE = "device_cookie";
  static const CURRENCY_KEY = "currency";
  static const LANGUAGE_KEY = "language";
  static const MESSAGE_KEY = "message";
  static const SERVICE_PROVIDER_IMAGE_KEY = "image";
}
