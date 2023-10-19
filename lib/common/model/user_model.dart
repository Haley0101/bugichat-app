class UserModel {
  String? email;
  String? name;
  String? uid;
  String? phoneNumber;

  UserModel({this.email, this.name, this.phoneNumber, this.uid});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['uid'] = uid;
    return data;
  }
}
