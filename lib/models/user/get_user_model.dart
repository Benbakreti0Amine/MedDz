
class GetUserModel {
  final int id;
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;

  GetUserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> jsonData) {
    return GetUserModel(
      id: jsonData['id'],
      username: jsonData['username'],
      password: jsonData['password'],
      email: jsonData['email'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      isActive: jsonData['is_active'],
    );
  }
}
