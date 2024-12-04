import 'package:coffe_app/app/start/cubit/start_app_cubit.dart';
import 'package:coffe_app/app_wrapper.dart';
import 'package:coffe_app/core/database/hive_db.dart';
import 'package:coffe_app/core/router/app_router.dart';
import 'package:coffe_app/core/themes/light_theme.dart';
import 'package:coffe_app/logic_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

HiveDB hiveDB = HiveDB();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* init the local DB
  await hiveDB.initDB();
  //* Router
  AppRouter appRouter = AppRouter();
  //* Cubit Observer
  Bloc.observer = MyBlocObserver();
  runApp(MoviesApp(
    appRouter: appRouter,
  ));
}

class MoviesApp extends StatelessWidget {
  final AppRouter appRouter;
  const MoviesApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartAppCubit()..startApp(),
        ),
      ],
      child: MaterialApp(
        title: 'Coffee App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGeneratedRoutes,
        theme: LightTheme.setLightMode(),
        home: const AppWrapper(),
      ),
    );
  }
}
