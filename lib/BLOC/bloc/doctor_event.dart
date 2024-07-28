
import 'package:equatable/equatable.dart';

abstract class DoctorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDoctors extends DoctorEvent {}

//The equatable package helps by providing value equality, which means two objects are considered equal 
//if their properties are equal. This is particularly useful in state management with BLoC,
// where you need to compare states and events to determine whether an update is necessary.