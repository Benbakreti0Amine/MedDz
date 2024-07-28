import '../../core/api/end_ponits.dart';

class GetDoctorModel {
  final int id;
  final String name;
  final String lastname;
  final String? profilePicture;
  final String degree;
  final String specialization;
  final String beginOfWork;
  final int experienceYears;
  final double rating;
  final int reviewsCount;
  final Map<String, String> availableDays;
  final Map<String, String> availableHours;
  final String bio;
  final String highlights;

  GetDoctorModel({
    required this.id,
    required this.name,
    required this.lastname,
    this.profilePicture,
    required this.degree,
    required this.specialization,
    required this.beginOfWork,
    required this.experienceYears,
    required this.rating,
    required this.reviewsCount,
    required this.availableDays,
    required this.availableHours,
    required this.bio,
    required this.highlights,
  });

  factory GetDoctorModel.fromJson(Map<String, dynamic> jsonData) {
    return GetDoctorModel(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
      lastname: jsonData[ApiKey.lastname],
      profilePicture: jsonData[ApiKey.profilePicture],
      degree: jsonData[ApiKey.degree],
      specialization: jsonData[ApiKey.specialization],
      beginOfWork: jsonData[ApiKey.beginOfWork],
      experienceYears: jsonData[ApiKey.experienceYears],
      rating: jsonData[ApiKey.rating],
      reviewsCount: jsonData[ApiKey.reviewsCount],
      availableDays: Map<String, String>.from(jsonData[ApiKey.availableDays]),
      availableHours: Map<String, String>.from(jsonData[ApiKey.availableHours]),
      bio: jsonData[ApiKey.bio],
      highlights: jsonData[ApiKey.highlights],
    );
  }
}