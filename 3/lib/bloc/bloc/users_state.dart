part of 'users_bloc.dart';

@immutable
abstract class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {}

class UserLoading extends UsersState {}

class UserLoaded extends UsersState {
  final Users users;

  const UserLoaded(this.users);
}

class UserFail extends UsersState {}
