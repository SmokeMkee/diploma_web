import 'package:dio/dio.dart';
import 'package:diploma_web/student/src/features/profile/data/dto/profile_model.dart';
import 'package:diploma_web/student/src/features/profile/data/repo/repo_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RepoProfile repo;

  ProfileBloc({required this.repo}) : super(ProfileInitial()) {
    on<FetchInfoProfile>(fetchData);
    on<UpdateInfoProfile>(updateData);
  }
  Profile? prof;
  Future<void> fetchData(
    FetchInfoProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try{
      emit(ProfileLoading());
      final response = await repo.fetch();
      prof = response;
      emit(
        ProfileData(data: response),
      );
    }catch(e){
      print(e);
      emit(ProfileError(message: 'error message'));
    }

  }

  Future<void> updateData(
      UpdateInfoProfile event,
      Emitter<ProfileState> emit,
      ) async {
    try{
      emit(ProfileLoading());
      final response = await repo.updateInfo(event.profile);
      prof = response;
      emit(
        ProfileData(data: response),
      );
    }catch(e){
      emit(ProfileError(message: 'SomethingError'));
    }

  }
}
