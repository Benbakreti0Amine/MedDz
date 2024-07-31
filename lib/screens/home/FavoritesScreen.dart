import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Meddz/BLOC/bloc/doctor_bloc.dart';
import 'package:Meddz/BLOC/bloc/doctor_event.dart';
import 'package:Meddz/BLOC/bloc/doctor_state.dart';
import 'package:Meddz/models/doctor/get_doctor_model.dart';

class FavoriteDoctorsScreen extends StatefulWidget {
  const FavoriteDoctorsScreen({super.key});

  @override
  State<FavoriteDoctorsScreen> createState() => _FavoriteDoctorsScreenState();
}

class _FavoriteDoctorsScreenState extends State<FavoriteDoctorsScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch the LoadFavoriteDoctors event when the screen is initialized
    context.read<DoctorBloc>().add(LoadFavoriteDoctors());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Doctors'),
      ),
      body: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state is FavoriteDoctorsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavoritedDoctorsLoaded) {
            return ListView.builder(
              itemCount: state.favdoctors.length,
              itemBuilder: (context, index) {
                final doctor = state.favdoctors[index];
                return ListTile(
                  title: Text(doctor.name), // Assuming GetDoctorModel has a name property
                  subtitle: Text(doctor.specialization), // Assuming GetDoctorModel has a specialization property
                );
              },
            );
          } else if (state is FavoriteDoctorsError) {
            return Center(child: Text('Failed to load favorite doctors: ${state.message}'));
          } else {
            return Center(child: Text('No favorite doctors available'));
          }
        },
      ),
    );
  }
}
