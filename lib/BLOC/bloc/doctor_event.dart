import 'package:Meddz/models/doctor/get_doctor_model.dart';
import 'package:equatable/equatable.dart';

abstract class DoctorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDoctors extends DoctorEvent {}

class LoadDoctorsFromLocal extends DoctorEvent {}

//The equatable package helps by providing value equality, which means two objects are considered equal
//if their properties are equal. This is particularly useful in state management with BLoC,
// where you need to compare states and events to determine whether an update is necessary.

class LoadFavoriteDoctors extends DoctorEvent {}

class ToggleFavoriteDoctor extends DoctorEvent {
  final GetDoctorModel doctor;

  ToggleFavoriteDoctor({required this.doctor});

  @override
  List<Object?> get props => [doctor];
}