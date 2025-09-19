
part of 'authentication_bloc_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final MyUser? user;
  final AuthenticationStatus status;
  // contructor ẩn
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user
  });
  // Constructor unknown
  const AuthenticationState.unknown() : this._();
  // Constructor authenticated
  const AuthenticationState.authenticated(MyUser myuser): this._(status: AuthenticationStatus.authenticated, user: myuser);
 // Constructor unauthenticated
  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
