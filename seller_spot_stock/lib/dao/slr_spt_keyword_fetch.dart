class KeywordFetchList {
  List<KeywordFetch> keywordFetchList = new List();

  List<KeywordFetch> parseFromServerResponse(Map json) {

    keywordFetchList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //

      KeywordFetch item = KeywordFetch.fromJson(results);

      keywordFetchList.add(item);

    }
    return keywordFetchList;
  }
}


class KeywordFetch {
  String keywordTagId;
  String keywordTagName;

  KeywordFetch({this.keywordTagId, this.keywordTagName});

  KeywordFetch.fromJson(Map<String, dynamic> json) {
    keywordTagId = json['keywordTagId'];
    keywordTagName = json['keywordTagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keywordTagId'] = this.keywordTagId;
    data['keywordTagName'] = this.keywordTagName;
    return data;
  }
}

