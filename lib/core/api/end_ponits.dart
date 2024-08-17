class EndPoint {
  // static String baseUrl = "http://127.0.0.1:8000/";
  static String baseUrl = "http://localhost:8000/";
  // static String baseUrl = "http://192.168.11.197:8000/";
  static String signIn = "users/login/";
  static String signUp = "users/listcreateuser/";
  static String forgetpass = "users/password-reset-request/";
  static String resetpass = "users/password-reset-confirm/";

  static String getDoctors = "doctor/doctors/";
  static String getFavoriteDoctors =
      "doctor/favorite-doctors/";
  static String addFavoriteDoctor =
      "doctor/favorite-doctors/";
  static String removeFavoriteDoctor =
      "doctor/favorite-doctors/delete/";

  static String getUser(dynamic id) {
    return "users/list/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "errorMessage";
  static String email = "email";
  static String password = "password";
  static String newPassword = "new_password";
  static String otp = "otp";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "name";
  static String firstname = "firstname";
  static String lastname = "lastname";
  static String location = "location";
  static String pic = "profilePic";
  static String degree = "degree";
  static String specialization = "specialization";
  static String beginOfWork = "begin_of_work";
  static String experienceYears = "experience_years";
  static String rating = "rating";
  static String reviewsCount = "reviews_count";
  static String availableDays = "available_days";
  static String availableHours = "available_hours";
  static String bio = "bio";
  static String highlights = "highlights";
  static String profilePicture = "profile_picture";
}
