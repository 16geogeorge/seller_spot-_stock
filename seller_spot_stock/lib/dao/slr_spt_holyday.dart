
class HolidayList {
  List<Holiday> holidayList = new List();

  List<Holiday> parseFromServerResponse(Map json) {

    holidayList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //
      Holiday item = Holiday.fromJson(results);

      holidayList.add(item);

    }
    return holidayList;
  }
}



class Holiday {
  String holidayId;
  String holidayName;
  String holidayDescription;
  String holidayDate;
  String holidaySeason;
  String holidayDeleted;
  String holidayUpdated;

  Holiday(
      {this.holidayId,
        this.holidayName,
        this.holidayDescription,
        this.holidayDate,
        this.holidaySeason,
        this.holidayDeleted,
        this.holidayUpdated});

  Holiday.fromJson(Map<String, dynamic> json) {
    holidayId = json['holidayId'];
    holidayName = json['holidayName'];
    holidayDescription = json['holidayDescription'];
    holidayDate = json['holidayDate'];
    holidaySeason = json['holidaySeason'];
    holidayDeleted = json['holidayDeleted'];
    holidayUpdated = json['holidayUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holidayId'] = this.holidayId;
    data['holidayName'] = this.holidayName;
    data['holidayDescription'] = this.holidayDescription;
    data['holidayDate'] = this.holidayDate;
    data['holidaySeason'] = this.holidaySeason;
    data['holidayDeleted'] = this.holidayDeleted;
    data['holidayUpdated'] = this.holidayUpdated;
    return data;
  }
}