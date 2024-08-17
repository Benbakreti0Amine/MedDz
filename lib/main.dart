import 'package:Meddz/database/database_helper.dart';
import 'package:Meddz/BLOC/bloc/doctor_bloc.dart';
import 'package:Meddz/screens/auth/sign_in_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cache/cachehelper.dart';
import 'core/api/dio_consumer.dart';
import 'BLOC/cubit/user_cubit.dart';
import 'static/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  final DatabaseHelper dbHelper = DatabaseHelper();
  await dbHelper.recreateDatabase();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<DoctorBloc>(
          create: (context) => DoctorBloc(DioConsumer(dio: Dio())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SignInScreen(),
    );
  }
}
