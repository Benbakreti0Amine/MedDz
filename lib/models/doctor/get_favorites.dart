
class FavoriteDoctorModel {
  final int doctorId;

  FavoriteDoctorModel({
    required this.doctorId,
  });

  factory FavoriteDoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return FavoriteDoctorModel(
      doctorId: jsonData['doctor'],
    );
  }
}
