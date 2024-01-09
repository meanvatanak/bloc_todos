part of 'auth_cubit.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = User.empty,
  });

  const AuthState.unknown() : this._(status: AuthStatus.unknown, user: null);

  // Authenticated state
  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  // Unauthenticated state
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated, user: null);

  final AuthStatus status;
  final User? user;

  @override
  List<Object?> get props => [status, user];
}
