import 'package:medPilot/core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl =
      'https://manage.medPilot.app/api/mobile/v1/'; //live server
  static const String devUrl =
      'https://bw-stg.dinnova.tech/api/mobile/v1/'; // dev server
  static const String testUrl =
      'https://bw-stg.dinnova.tech/api/mobile/v1/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // shop module
  static const String login = 'login';
  static const String register = 'register';
  static const String checkEmailExists = 'check-email-exists';
  static const String registerSendOtp = 'register/send-otp';
  static const String registerVerifyOtp = 'register/verify-otp';
  static const String registerResendOtp = 'register/resend-otp';

  //
  static const String forgotPasswordSendEmail = 'forgot-password';
  static const String forgotPasswordVerifyOtp = 'forgot-password/verify-otp';
  static const String forgotPasswordResendOtp = 'forgot-password/resend-otp';
  static const String forgotPasswordUpdatePassword =
      'forgot-password/update-password';

  static const String products = 'wc/v3/products';
  static const String orders = 'wc/v3/orders';
  static const String category = 'wc/v3/products/categories';
  static const String userProfile = 'wc/v3/customers';
  static const String userProfileUpdate = 'wc/v3/customers';
  static const String cartItems = 'cocart/v2/cart';
  static const String removeCartItems = 'cocart/v2/cart/item/';
  static const String clearCartItems = 'cocart/v2/cart/clear';
  static const String updateCartItems = 'cocart/v2/cart/item/';
  static const String atToCartItems = 'cocart/v2/cart/add-item';
  static const String order = 'wc/v3/orders';
  static const String setPassword = 'bdpwr/v1/set-password';
  static const String payLink = 'Invoice/?instance=dinnova';
  static const String featuredSession = 'feature-sessions';
  static const String mySession = 'sessions';

  static String browse = "browse-sessions";
  static String categories = "categories";
  static String removeAudioFromSession = "remove-audio-from-session";
  static String backgroundAudios = "background-audios";
  static String categoriesUrl = "categories";
  static String audiosUrl = "audios";
  static String favoriteSessions = "favorite-sessions";
  static String favoriteAudios = "favorite-audios";
  static String sessionsUrl = "sessions";
  static String userMe = "me";
  static String updateEmail = "update-email";
  static String updateProfile = "update-profile";
  static String deleteAccount = "delete-account";
  static String logout = "logout";
  static String addAudioToSession = "add-audio-to-session";
  static String appOpen = "app-open";
  static String updateSettingUrl = "sessions";
  static String notifications = "notifications";
  static String seenAllNotification = "notifications-mark-all-read";
  static String inAppPurchaseReference = "in-app-purchase-reference";
  static String checkGooglePayment = "check-google-payment";
  static String adVideoUrl =
      'https://drive.google.com/uc?export=download&id=1BJ03eSmGmE-dLQzShDe3PjIFqAW9jhqh';

  static String seenNotification(id) {
    return "notifications/$id";
  }

  static String audioPlayCount(id) {
    return "audios/$id/increment-play-count";
  }

  static String sessionDetails(id) {
    return 'sessions/$id';
  }

  static String sessionTitleUpdate(id) {
    return 'sessions/$id/update-title';
  }

  static String updateSessionThumbnail(id) => 'sessions/$id/update-thumbnail';

  static String sessionFavorite(id) {
    return 'sessions/$id/favorite';
  }

  //thumbnail api
  static const String thumbNailsApiUrl = 'pre-populated-thumbnails';

  static String privacyPolicyUrlDE =
      "https://medPilot.app/app-datenschutzrichtlinie/";
  static String privacyPolicyUrlEN = "https://medPilot.app/app-privacy-policy/";
}
