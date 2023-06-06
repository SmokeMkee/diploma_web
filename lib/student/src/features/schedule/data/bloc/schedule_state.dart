part of 'schedule_bloc.dart';

abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleError extends ScheduleState {
  ScheduleError({required this.message});

  final String message;
}

class ScheduleData extends ScheduleState {
  ScheduleData({required this.listSchedule});

  final List<Schedule> listSchedule;
}
