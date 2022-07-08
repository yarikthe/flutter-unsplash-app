import 'package:app/components/model/user_model.dart';

class ImageModel {
  String? id;
  List<UrlsImageModel>? urls;
  int? likes;
  String? description;
  UserModel? author;

  ImageModel({this.description, this.id, this.likes, this.urls, this.author});

  factory ImageModel.fromJson(Map<String, dynamic> json) => new ImageModel(
      id: json['id'],
      urls: json['urls'] == null
          ? null
          : List<UrlsImageModel>.from(
              json['urls'].map((model) => UrlsImageModel.fromJson(model))),
      likes: json['likes'] ?? 0,
      description: json['description'] ?? '',
      author: json['user'] == null ? null : UserModel.fromJson(json['user']));
}

class UrlsImageModel {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? small_s3;

  UrlsImageModel(
      {this.full,
      this.raw,
      this.regular,
      this.small,
      this.small_s3,
      this.thumb});

  factory UrlsImageModel.fromJson(Map<String, dynamic> json) =>
      new UrlsImageModel(
        full: json['full'] ?? '',
        raw: json['raw'] ?? '',
        regular: json['regular'] ?? '',
        small: json['small'] ?? '',
        small_s3: json['small_s3'] ?? '',
        thumb: json['thumb'] ?? '',
      );
}
