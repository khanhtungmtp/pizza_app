import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';
part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBlocBloc extends Bloc<AuthenticationBlocEvent, AuthenticationState> {
 final UserRepository userRepository;
 late final StreamSubscription<MyUser?> _userSubscription;

 AuthenticationBlocBloc({
   required this.userRepository
 }) : super(const AuthenticationState.unknown()) {
   _userSubscription = userRepository.user.listen((onData){
     add(AuthenticationUserChanged(onData));
   });

    on<AuthenticationUserChanged>((event, emit) {
      if(event.user != MyUser.empty){
       emit(AuthenticationState.authenticated(event.user!));
      }else {
        emit(AuthenticationState.unauthenticated());
      }
    });
  }
}
