import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  void Register(String email, String pass, String name, String phone, Function onSuccess) {
    _fireAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
           _createUser(user.user!.uid, name, phone, onSuccess);
    }).catchError((err) {});
  }

  _createUser(String userid, String name, String phone, Function onSuccess) {
    Map<String, String> userinfo = {'name': name, 'phone': phone};
    DatabaseReference? dbRef = FirebaseDatabase.instance.ref().child('userinfo');
    dbRef.child(userid).push().set(userinfo).then((userinfo){
      onSuccess();
    }).catchError((err) {});
  }
}