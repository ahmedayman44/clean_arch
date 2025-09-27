part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSucess extends UserState {
  final UserEntity user;

  UserSucess({required this.user});
}

final class UserFailure extends UserState {
  final String errorMessage;

  UserFailure({required this.errorMessage});
}
