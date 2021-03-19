// import 'package:flutter/material.dart';
// import 'package:seller_spot_stock/api/seller_sopt_error.dart';
// import 'package:seller_spot_stock/dao/slr_spt_keyword_fetch.dart';
// import 'package:seller_spot_stock/dao/slr_spt_promotion.dart';
// import 'package:seller_spot_stock/screens/promotion/promotion_list_screen_presenter.dart';
//
// import 'keyword_create_screen_presenter.dart';
//
//
// class KeyWord extends StatefulWidget {
//   @override
//   KeyWordViewState createState() {
//     return KeyWordViewState();
//   }
// }
//
// class KeyWordViewState extends State<KeyWord> implements GetKeyWordTagPresenterContract {
//   /// start create a list to store promotions by server
//   List<KeywordFetch> keywordTagList = new List();
//   /// end create a list to store promotions by server
//
//
//   GetKeyWordTagPresenter _presenter;
//   KeyWordViewState(){
//     _presenter = new GetKeyWordTagPresenter(this);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     _presenter.getKeyWordTagListFromServer();
//   }
//   final Map<String, IconData> _data = Map.fromIterables(
//       ['First', 'Second', 'Third'],
//       [Icons.filter_1, Icons.filter_2, Icons.filter_3]);
//   String _selectedType;
//   IconData _selectedIcon;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Keyword List'),
//         ),
//         body:
//             _data.isNotEmpty?
//         Container(
//           width: 600,
//           padding: EdgeInsets.all(10.0),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//                 items: _data.keys.map((String val) {
//                   return DropdownMenuItem<String>(
//                     value: val,
//                     child: Row(
//                       children: <Widget>[
//                         // Padding(
//                         //   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                         //   child: Icon(_data[val]),
//                         // ),
//                         Text(val),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 hint: Row(
//                   children: <Widget>[
//                     // Padding(
//                     //   padding: EdgeInsets.symmetric(horizontal: 12.0),
//                     //   child:
//                     //   Icon(_selectedIcon ?? _data.values.toList()[0]),
//                     // ),
//                     Text(_selectedType ?? _data.keys.toList()[0]),
//                   ],
//                 ),
//                 onChanged: (String val) {
//                   setState(() {
//                     _selectedType = val;
//                     _selectedIcon = _data[val];
//                   });
//                 }),
//           ),
//         ):
//                 CircularProgressIndicator()
//     );
//   }
//
//
//   @override
//   void onKeyWordTagError(ImageRecoError error) {
//     // TODO: implement onKeyWordTagError
//   }
//
//   @override
//   void onKeyWordTagSuccess(KeywordFetchList data) {
//     print("successfully collected keyword tag details");
//     keywordTagList.clear();
//     setState(() {
//       keywordTagList.addAll(data.keywordFetchList);
//     });
//
//     print(keywordTagList);
//   }
//
//
// }