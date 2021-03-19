



import 'package:seller_spot_stock/util/seller_sopt_localization.dart';

class ImageRecoError{
  int _errorCode;
  String _message;

  ImageRecoError(this._errorCode, this._message);

  String get message => _message;

  int get errorCode => _errorCode;

  static ImageRecoError unAuthorizeAccess = new ImageRecoError(
      ErrorCodes.UN_AUTHORIZED_ACCESS, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['unauthorized_access']);

  static ImageRecoError unAuthorizeLogin = new ImageRecoError(
      ErrorCodes.UN_AUTHORIZED_ACCESS, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['invalid_email_password']);

  static ImageRecoError serverError = new ImageRecoError(
      ErrorCodes.SERVER_ERROR, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['server_communication_failed']);
  static ImageRecoError noInternet = new ImageRecoError(
      ErrorCodes.SERVER_ERROR, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['check_network']);

  static setImageRecoErrorMessage() {
    unAuthorizeAccess = new ImageRecoError(ErrorCodes.UN_AUTHORIZED_ACCESS,
        ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['unauthorized_access']);

    //
    unAuthorizeLogin = new ImageRecoError(ErrorCodes.UN_AUTHORIZED_ACCESS,
        ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['invalid_email_password']);
    // userNotFound = new ImageRecoError(
    //     ErrorCodes.USER_NOT_FOUND, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['user_not_found']);
    // diaryNotFound = new ImageRecoError(
    //     ErrorCodes.DIARY_NOT_FOUND, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['diary_not_found']);
    // passwordNotMatch = new ImageRecoError(ErrorCodes.PASSWORD_NOT_MATCH,
    //     ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['password_does_not_match']);
    // invalidLeaveRequestData = new ImageRecoError(ErrorCodes.INVALID_LEAVE_REQUEST_DATA,
    //     ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['leave_already_exist_or_invalid_date']);
    noInternet = new ImageRecoError(
        ErrorCodes.NO_INTERNET, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['check_network']);
    serverError = new ImageRecoError(ErrorCodes.SERVER_ERROR,
        ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['server_communication_failed']);
    // internalError = new ImageRecoError(ErrorCodes.INTERNAL_ERROR,
    //     ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['unexpected_error_try_agin']);
    // resultPublishedError = new ImageRecoError(ErrorCodes.ERROR_IN_INPUT_FILE,
    //     ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['resultPublishedError']);
    // subjectAllreadySelect = new ImageRecoError(
    //     ErrorCodes.SUBJECT_ALLREADY_SELECTED, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['subject_allreday_select']);
    // subjectnotMapped = new ImageRecoError(
    //     ErrorCodes.SUBJECT_ALLREADY_SELECTED, ImageRecoLocalization.localizedValues[ImageRecoLocalization.ImageRecoAppLocale]['subject_not_map']);
    //

  }
}
class ErrorCodes {
  static const int INTERNAL_ERROR = -1;

  static const int NO_INTERNET = 100;
  static const int SERVER_ERROR = 101;

  static const int UN_AUTHORIZED_ACCESS = 110;
  static const int USER_NOT_FOUND = 111;
  static const int DIARY_NOT_FOUND = 112;
  static const int PASSWORD_NOT_MATCH = 113;
  static const int INVALID_LEAVE_REQUEST_DATA = 114;
  static const int INVALID_USER_ROLE = 115; //TODO CHANGE ERROR CODE
  static const int UN_AUTHORIZED_ACCESS_DIARY = 403;
  static const int UN_AUTHORIZED_LOGIN = 401;
  static const int ERROR_IN_INPUT_FILE=400;
  static const int ATTACHMENT_ID_NOT_FOUND=404;
  static const int SUBJECT_ALLREADY_SELECTED =409;

}
