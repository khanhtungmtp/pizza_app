class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUserEntity(
      {required this.userId, required this.email, required this.name, required this.hasActiveCart});

  Map<String, Object?> toDocument(){
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> document){
    return MyUserEntity(
      userId: document['userId'],
      email: document['email'],
      name: document['name'],
      hasActiveCart: document['hasActiveCart'],
    );
  }
}