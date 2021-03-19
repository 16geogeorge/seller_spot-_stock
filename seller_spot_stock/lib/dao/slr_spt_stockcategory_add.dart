class StockCategoryPostList {
  List<StockCategoryPost> stockCategoryPostList = new List();

  List<StockCategoryPost> parseFromServerResponse(Map json) {

    stockCategoryPostList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //

      StockCategoryPost item = StockCategoryPost.fromJson(results);

      stockCategoryPostList.add(item);

    }
    return stockCategoryPostList;
  }
}


class StockCategoryPost {
  String stockcategoryid;
  String category;
  String categorydiscription;

  StockCategoryPost(
      {this.stockcategoryid, this.category, this.categorydiscription});

  StockCategoryPost.fromJson(Map<String, dynamic> json) {
    stockcategoryid = json['stockcategoryid'];
    category = json['category'];
    categorydiscription = json['categorydiscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockcategoryid'] = this.stockcategoryid;
    data['category'] = this.category;
    data['categorydiscription'] = this.categorydiscription;
    return data;
  }
}