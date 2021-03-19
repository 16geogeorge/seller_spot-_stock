//
//
// import 'package:seller_spot_stock/api/rest_api_source.dart';
// import 'package:seller_spot_stock/api/seller_sopt_error.dart';
// import 'package:seller_spot_stock/dao/slr_spt_keyword_fetch.dart';
//
// abstract class GetKeyWordTagPresenterContract {
//   void onKeyWordTagSuccess(KeywordFetchList data);
//
//   void onKeyWordTagError(ImageRecoError error);
// }
// class   GetKeyWordTagPresenter {
//   GetKeyWordTagPresenterContract _view;
//   RestDataSource api = new RestDataSource();
//
//   GetKeyWordTagPresenter(this._view);
//
//   Future<KeywordFetchList> getKeyWordTagListFromServer() {
//     Future<KeywordFetchList> response = api.getKeyWordTagList(
//     );
//     response.then((KeywordFetchList data) {
//       print(" get keyword tag success ::: ");
//
//       _view.onKeyWordTagSuccess(data);
//     }).catchError((Object error) {
//       print(" get keyword tag failed ::: " + error.toString());
//       if (error is ImageRecoError) {
//         _view.onKeyWordTagError(error);
//       } else {
//         _view.onKeyWordTagError(ImageRecoError.serverError);
//       }
//     });
//     return response;
//   }
// }