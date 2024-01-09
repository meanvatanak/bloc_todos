import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String phone;
  final String gender;
  final String image;
  final String email;
  final String token;

  const User({
    required this.id,
    required this.username,
    required this.phone,
    required this.gender,
    required this.image,
    required this.email,
    required this.token,
  });

  static const empty = User(
    id: 0,
    username: '',
    phone: '',
    gender: '',
    image: '',
    email: '',
    token: '',
  );

  @override
  List<Object?> get props => [id, username, phone, gender, image, email, token];
}
