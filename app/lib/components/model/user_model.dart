class UserModel {
  
  String? id;
  String? name;
  List<ProfileImageUserModel>? profileImage;

  UserModel({this.id, this.name, this.profileImage});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      new UserModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        profileImage: json['profile_image'] == null ? null : List<ProfileImageUserModel>.from(json['profile_image'].map((model)=> ProfileImageUserModel.fromJson(model))),
      );
}

class ProfileImageUserModel {
  String? medium;
  String? large;
  String? small;

  ProfileImageUserModel({this.large, this.medium, this.small});

  factory ProfileImageUserModel.fromJson(Map<String, dynamic> json) =>
      new ProfileImageUserModel(
        small: json['small'] ?? '',
        medium: json['medium'] ?? '',
        large: json['large'] ?? '',
      );
}
