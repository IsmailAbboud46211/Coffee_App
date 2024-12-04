part of 'start_app_cubit.dart';

@immutable
sealed class StartAppState {}

final class StartAppInitial extends StartAppState {}

final class SkiepedOnBording extends StartAppState {}

final class ShowOnBording extends StartAppState {}
