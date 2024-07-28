import 'package:Meddz/BLOC/bloc/doctor_event.dart';
import 'package:Meddz/BLOC/bloc/doctor_state.dart';
import 'package:Meddz/core/api/api_consumer.dart';
import 'package:Meddz/core/api/end_ponits.dart';
import 'package:Meddz/core/errors/exceptions.dart';
import 'package:Meddz/models/doctor/get_doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final ApiConsumer api;

  DoctorBloc(this.api) : super(DoctorInitial()) {
    on<LoadDoctors>(_onLoadDoctors);
  }

  Future<void> _onLoadDoctors(LoadDoctors event, Emitter<DoctorState> emit) async {
    emit(DoctorLoading());
    try {
      final response = await api.get(EndPoint.getDoctors); // Update with the correct endpoint
      final List<dynamic> doctorsJson = response as List<dynamic>; // Assuming the response is a list
      final doctors = doctorsJson.map((json) => GetDoctorModel.fromJson(json)).toList();
      emit(DoctorLoaded(doctors: doctors));
    } on ServerException catch (e) {
      emit(DoctorError(message: e.errModel.errorMessage));
    }
  }
}
