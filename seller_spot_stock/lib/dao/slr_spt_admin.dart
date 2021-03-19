
class AdminLoginList {
  List<AdminLogin> adminLoginList = new List();

  List<AdminLogin> parseFromServerResponse(Map json) {

    adminLoginList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //
      AdminLogin item = AdminLogin.fromJson(results);

      adminLoginList.add(item);

    }
    return adminLoginList;
  }
}


class AdminLogin {
  String adminId;
  String userName;
  String password;
  String roles;

  AdminLogin({this.adminId, this.userName, this.password, this.roles});

  AdminLogin.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    userName = json['userName'];
    password = json['password'];
    roles = json['roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminId'] = this.adminId;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['roles'] = this.roles;
    return data;
  }
}