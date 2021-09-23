part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {
  const UsersEvent();
}

class LoadUser extends UsersEvent {
  final String username;

  const LoadUser(this.username);
}
