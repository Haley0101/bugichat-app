
class AcceptModel {
  String? user_accountNumber;
  String? user_name;
  String? user_phoneNumber;
  String? user_rank;
  String? user_roleName;

  AcceptModel({
    this.user_accountNumber,
    this.user_name,
    this.user_phoneNumber,
    this.user_rank,
    this.user_roleName,

  });

  AcceptModel.fromJson(Map<String, dynamic> json) {
    user_accountNumber = json['user_accountNumber'];
    user_name = json['user_name'];
    user_phoneNumber = json['user_phoneNumber'];
    user_rank = json['user_rank'];
    user_roleName = json['user_roleName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_accountNumber'] = user_accountNumber;
    data['user_name'] = user_name;
    data['user_phoneNumber'] = user_phoneNumber;
    data['user_rank'] = user_rank;
    data['user_roleName'] = user_roleName;

    return data;
  }
}
