

import '../../core/api/end_ponits.dart';

class GetUserModel {
  final String username;
  final String phone;
  final String email;
  final String profilePic;

  GetUserModel(
      {
      required this.username,
      required this.phone,
      required this.email,
      required this.profilePic,
      });
  factory GetUserModel.fromJson(Map<String, dynamic> jsonData) {
    return GetUserModel(
        username: jsonData['user'][ApiKey.name],
        phone: jsonData['user'][ApiKey.firstname],
        email: jsonData['user'][ApiKey.email],
        profilePic: jsonData['user'][ApiKey.pic],
       );
  }
}
//