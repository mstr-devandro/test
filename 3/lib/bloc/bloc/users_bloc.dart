import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_flutter/model/users_model.dart';
import 'package:test_flutter/repo/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is LoadUser) {
      yield UserLoading();
      try {
        final Users users = await UsersRepository().searchUser(event.username);
        yield UserLoaded(users);
      } catch (e) {
        print(e);
        yield UserFail();
      }
    }
  }
}
