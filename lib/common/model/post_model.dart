
class PostModel {
  String? title;
  String? subtitle;
  String? video_url;
  String? image_thumbnail;


  PostModel({
    this.title,
    this.subtitle,
    this.video_url,
    this.image_thumbnail,

  });

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    video_url = json['video_url'];
    image_thumbnail = json['image_thumbnail'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['video_url'] = video_url;
    data['image_thumbnail'] = image_thumbnail;

    return data;
  }
}
