const String kIConDir = 'assets/icons/';
const String kImageDir = 'assets/images/';
const String kFlagDir = 'assets/flags/';
const String kImageUrl = 'https://hmbadhon.me/';
const String kBaseUrl = 'https://hmbadhon.me/api/';
const String kBase64Extend = 'data:image/jpeg;base64,';
const String kBase64ExtendVideo = 'data:video/mp4;base64,';
const String kBase64ExtendAudio = 'data:audio/mp3;base64,';

const String kDemoImage =
    'https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=';

const String kUSD = 'USD';
const String kBDT = 'BDT';
const String kCurrency = 'CHF';

// Form Error
final RegExp emailValidatorRegExp =
// RegExp(r'^\w+([\.\+-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$');
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
final RegExp strongPasswordRegExp =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
final RegExp numberFindRegExp = RegExp(r'[\d]');
final RegExp specialChrFindRegExp =
    RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]');
final RegExp capitalLetterRegex = RegExp(r'[A-Z]');
final RegExp lowerLetterRegex = RegExp(r'[a-z]');
final RegExp hasAtLeast8Characters = RegExp(r'.{8,}');
final RegExp mobileNumberRegex = RegExp(r'^-?\d+$');
final RegExp htmlValidatorRegExp = RegExp(r"(<[^>]*>|&\w+;)");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Your email address is not valid";
const String kPassNullError = "Please enter your password";
const String kPassNewNullError = "Please enter your New password";
const String kPassConfirmNullError = "Please enter your Confirm password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your full name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";
const String kInvalidNumberError = "Ungültige Rufnummer.";
const String kInvalidError = "Etwas ist falsch! Bitte versuchen Sie es erneut.";
const String kMinWithdrawLimit = "Minimum withdraw limit 1 USD";

//Bank Information
const String kBankAddress =
    "George Bush St. No. 26 10000 Pristina, Republic of Kosovo:";
const String kBankName = "ProCredit Bank, Kosovo";
const String kBankAC = "XK05 1189008787000122";
const String kBankBIC = "MBKOXKPRXXX";

///DEV Key
/*const String consumerKey = "ck_3c6d81a7deca27c7dc85776f6f02d255e3250010";
const String consumerSecret = "cs_32c3c2245972b4a17b0032baff77fc3b7b7a44bc";*/

/// Prod
const String consumerKey = "ck_5338a4cc4898396c57778fd6ca7ec688c57a0f40";
const String consumerSecret = "cs_9254786a78a88c1e103093aca8557dbcb2ffa11a";
