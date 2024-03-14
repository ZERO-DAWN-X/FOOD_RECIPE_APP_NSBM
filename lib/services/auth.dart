import 'package:firebase_auth/firebase_auth.dart';
import '../models/UserModel.dart';

class AuthServices{

  //FireBase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a User From User UID
  UserModel? _userModel (User? user){
    return user !=null ? UserModel(uid: user.uid):null;
  }

  //Stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userModel);
  }

  
  //Sign in Anonymous
  Future signInAnonymously() async {

    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userModel(user);
    }
    catch(err){
      print(err.toString());
      return null;
    }

  }

  //Register with email and password

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userModel(user);
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }

  //Sign in using email and pasword

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userModel(user);
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }

  //Sign in Gmail


  //Sing out

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }

}