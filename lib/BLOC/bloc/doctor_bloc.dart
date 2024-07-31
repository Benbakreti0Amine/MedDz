import 'package:Meddz/BLOC/bloc/doctor_event.dart';
import 'package:Meddz/BLOC/bloc/doctor_state.dart';
import 'package:Meddz/core/api/api_consumer.dart';
import 'package:Meddz/core/api/end_ponits.dart';
import 'package:Meddz/core/errors/exceptions.dart';
import 'package:Meddz/models/doctor/get_doctor_model.dart';
import 'package:Meddz/models/doctor/get_favorites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final ApiConsumer api;

  DoctorBloc(this.api) : super(DoctorInitial()) {
    on<LoadDoctors>(_onLoadDoctors);
    on<LoadFavoriteDoctors>(_onLoadFavoriteDoctors);
  }

  Future<void> _onLoadDoctors(
      LoadDoctors event, Emitter<DoctorState> emit) async {
    emit(DoctorLoading());
    try {
      final response = await api.get(EndPoint.getDoctors);
      final List<dynamic> doctorsJson = response as List<dynamic>;
      final doctors =
          doctorsJson.map((json) => GetDoctorModel.fromJson(json)).toList();
      emit(DoctorLoaded(doctors: doctors));
    } on ServerException catch (e) {
      emit(DoctorError(message: e.errModel.errorMessage));
    }
  }

  Future<void> _onLoadFavoriteDoctors(
      LoadFavoriteDoctors event, Emitter<DoctorState> emit) async {
    emit(FavoriteDoctorsLoading());
    try {
      try {
        final response = await api.get(EndPoint.getFavoriteDoctors);
        print('API Response: $response');
        final List<dynamic> favoritesJson = response as List<dynamic>;
        print('Favorites JSON: $favoritesJson');
        final favoriteDoctorIds = favoritesJson
    .map((json) {
      final doctorId = json['doctor'] as int?;
      if (doctorId == null) {
        print('Doctor ID is null for json: $json');
        return -1; // or some default value
      }
      return doctorId;
    })
    .where((id) => id != -1) // Remove invalid IDs
    .toList();

        // Fetch full details for each favorite doctor
        try {
          final doctorDetailsFutures = favoriteDoctorIds
              .map((id) => api.get('${EndPoint.getDoctors}$id/'))
              .toList();
          final doctorDetailsResponses =
              await Future.wait(doctorDetailsFutures);

          final favoriteDoctors = doctorDetailsResponses
              .map((response) => GetDoctorModel.fromJson(response))
              .toList();

          emit(FavoritedDoctorsLoaded(favdoctors: favoriteDoctors));
        } catch (e) {
          // Handle errors while fetching doctor details
          emit(FavoriteDoctorsError(
              message: 'Failed to fetch doctor details: ${e.toString()}'));
        }
      } catch (e) {
        // Handle errors while fetching favorite doctor IDs
        emit(FavoriteDoctorsError(
            message: 'Failed to fetch favorite doctor IDs: ${e.toString()}'));
      }
    } on ServerException catch (e) {
      emit(FavoriteDoctorsError(message: e.errModel.errorMessage));
    } catch (e) {
      // Handle any other errors
      emit(FavoriteDoctorsError(
          message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}





//   Future<void> _onAddFavoriteDoctor(AddFavoriteDoctor event, Emitter<FavoriteDoctorState> emit) async {
//     try {
//       final response = await api.post(
//         EndPoint.addFavoriteDoctor,
//         body: {'doctor': event.doctorId},
//       );
//       if (response['status'] == 'success') {
//         final state = this.state;
//         if (state is FavoriteDoctorLoaded) {
//           final updatedFavorites = List<int>.from(state.favoriteDoctorIds)..add(event.doctorId);
//           emit(FavoriteDoctorLoaded(updatedFavorites));
//         }
//       }
//     } on ServerException catch (e) {
//       emit(FavoriteDoctorError(e.errModel.errorMessage));
//     }
//   }

//   Future<void> _onRemoveFavoriteDoctor(RemoveFavoriteDoctor event, Emitter<FavoriteDoctorState> emit) async {
//     try {
//       final response = await api.delete('${EndPoint.removeFavoriteDoctor}${event.doctorId}/');
//       if (response['status'] == 'success') {
//         final state = this.state;
//         if (state is FavoriteDoctorLoaded) {
//           final updatedFavorites = List<int>.from(state.favoriteDoctorIds)..remove(event.doctorId);
//           emit(FavoriteDoctorLoaded(updatedFavorites));
//         }
//       }
//     } on ServerException catch (e) {
//       emit(FavoriteDoctorError(e.errModel.errorMessage));
//     }
//   }
// }
