class UserModel {

  String? id;
  String? name;
  ProfileImageUserModel? profileImage;
  String? instagram;

  UserModel({this.id, this.name, this.profileImage, this.instagram});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      new UserModel(
        id: json['id'] ?? '',
        name: json['name'] ?? 'Назва',
        profileImage: json['profile_image'] == null ? null : ProfileImageUserModel.fromJson(json['profile_image']),
        instagram: json['instagram_username'] == null ?  'instagram' : json['instagram_username']
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
