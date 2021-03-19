class PromotionList {
  List<Promotion> promotionList = new List();

  List<Promotion> parseFromServerResponse(Map json) {

    promotionList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //
      Promotion item = Promotion.fromJson(results);

      promotionList.add(item);

    }
    return promotionList;
  }
 }



class Promotion {
  String promotionId;
  String promotionName;
  String promotionStartDate;
  String promotionEndDate;
  String promotionDetails;
  String promotionAmount;

  Promotion(
      {this.promotionId,
        this.promotionName,
        this.promotionStartDate,
        this.promotionEndDate,
        this.promotionDetails,
        this.promotionAmount});

  Promotion.fromJson(Map<String, dynamic> json) {
    promotionId = json['promotionId'];
    promotionName = json['promotionName'];
    promotionStartDate = json['promotionStartDate'];
    promotionEndDate = json['promotionEndDate'];
    promotionDetails = json['promotionDetails'];
    promotionAmount = json['promotionAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotionId'] = this.promotionId;
    data['promotionName'] = this.promotionName;
    data['promotionStartDate'] = this.promotionStartDate;
    data['promotionEndDate'] = this.promotionEndDate;
    data['promotionDetails'] = this.promotionDetails;
    data['promotionAmount'] = this.promotionAmount;
    return data;
  }
}
