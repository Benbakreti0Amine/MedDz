
import 'package:equatable/equatable.dart';

import '../../models/doctor/get_doctor_model.dart';

abstract class DoctorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<GetDoctorModel> doctors;

  DoctorLoaded({required this.doctors});

  @override
  List<Object?> get props => [doctors];
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError({required this.message});

  @override
  List<Object?> get props => [message];
}
