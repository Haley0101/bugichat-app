
class CarrersModel {
  String? company_info_name;
  String? company_info_title;

  String? company_info_work;
  String? company_info_position;
  String? company_info_career;
  String? company_info_curriculum;
  String? company_info_first;
  String? company_info_money;
  String? company_info_city;
  String? company_info_time;
  String? company_info_people;
  String? company_info_url;

  String? user_info_type;
  String? user_info_docs;
  String? user_info_startDate;
  String? user_info_endDete;


  CarrersModel({
    this.company_info_name,
    this.company_info_title,

    this.company_info_work,
    this.company_info_position,
    this.company_info_career,
    this.company_info_curriculum,
    this.company_info_first,
    this.company_info_money,
    this.company_info_city,
    this.company_info_time,
    this.company_info_people,
    this.company_info_url,

    this.user_info_type,
    this.user_info_docs,
    this.user_info_startDate,
    this.user_info_endDete,

  });

  CarrersModel.fromJson(Map<String, dynamic> json) {
    company_info_name = json['company_info_name'];
    company_info_title = json['company_info_title'];

    company_info_work = json['company_info_work'];
    company_info_position = json['company_info_position'];
    company_info_career = json['company_info_career'];
    company_info_curriculum = json['company_info_curriculum'];
    company_info_first = json['company_info_first'];
    company_info_money = json['company_info_money'];
    company_info_city = json['company_info_city'];
    company_info_time = json['company_info_time'];
    company_info_people = json['company_info_people'];
    company_info_url = json['company_info_url'];

    user_info_type = json['user_info_type'];
    user_info_docs = json['user_info_docs'];
    user_info_startDate = json['user_info_startDate'];
    user_info_endDete = json['user_info_endDete'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_info_name'] = company_info_name;
    data['company_info_title'] = company_info_title;

    data['company_info_work'] = company_info_work;
    data['company_info_position'] = company_info_position;
    data['company_info_career'] = company_info_career;
    data['company_info_curriculum'] = company_info_curriculum;
    data['company_info_first'] = company_info_first;
    data['company_info_money'] = company_info_money;
    data['company_info_city'] = company_info_city;
    data['company_info_time'] = company_info_time;
    data['company_info_people'] = company_info_people;
    data['company_info_url'] = company_info_url;

    data['user_info_type'] = user_info_type;
    data['user_info_docs'] = user_info_docs;
    data['user_info_startDate'] = user_info_startDate;
    data['user_info_endDete'] = user_info_endDete;

    return data;
  }
}
