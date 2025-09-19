import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

import 'entities/entities.dart';
class FireBaseUserRepo implements UserRepository{
  final FirebaseAuth _auth;
  final userCollection = FirebaseFirestore.instance.collection('users');
  FireBaseUserRepo({ FirebaseAuth? firebaseAuth }) : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setUserData(MyUser myUser) async{
    try{
      await userCollection.doc(myUser.userId).set(myUser.toEntity().toDocument());
    }catch(e){
      // log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      // log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async{
    await _auth.signOut();
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: myUser.email, password: password);
    myUser.userId = userCredential.user!.uid;
    return myUser;
    }catch(e){
      // log(e.toString());
      rethrow;
    }
  }

  @override
  // TODO: implement user
  Stream<MyUser?> get user {
    return _auth.authStateChanges().flatMap((user) async*{
      if(user ==null){
        yield MyUser.empty;
      }else{
        yield await userCollection.doc(user.uid).get().then((doc) => MyUser.fromEntity(MyUserEntity.fromDocument(doc.data()!)));
      }
    });
  }

}