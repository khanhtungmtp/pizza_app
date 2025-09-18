
import '../entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUser({required this.userId, required this.email, required this.name, required this.hasActiveCart});
  static final empty = MyUser(userId: '', email: '', name: '', hasActiveCart: true);

  MyUserEntity toEntity() => MyUserEntity(userId: userId, email: email, name: name, hasActiveCart: hasActiveCart);

  static MyUser fromEntity(MyUserEntity entity) => MyUser(userId: entity.userId, email: entity.email, name: entity.name, hasActiveCart: entity.hasActiveCart);

  @override
  String toString() {
    // TODO: implement toString
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }
}