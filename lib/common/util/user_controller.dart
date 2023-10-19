import 'package:bugichat/common/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  UserModel? userInfo;

  Future<UserModel?> getUserInfo({
    bool isGetAll = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? idToken = prefs.getString('idToken');
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('idToken', isEqualTo: idToken).get();
    String id = querySnapshot.docs.first.id;

    var userServerInfo = FirebaseFirestore.instance.collection('users').doc(id);
    await userServerInfo.get().then((value) {
      userInfo = isGetAll
          ? UserModel(
        name: value.data()!['name'],
        phoneNumber: value.data()!['phoneNumber'],
        email: value.data()!['email'],
        uid: value.data()!['uid'],
      )
          : UserModel(
        name: value.data()!['name'],
        phoneNumber: value.data()!['phoneNumber'],
        email: value.data()!['email'],
        uid: value.data()!['uid'],
      );
      return userInfo;
    });
    return userInfo;
  }

  Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    String? idToken = prefs.getString('idToken');
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('idToken', isEqualTo: idToken).get();
    String id = querySnapshot.docs.first.id;

    var userServerInfo = await FirebaseFirestore.instance.collection('users').doc(id).get();
    return userServerInfo.data()!['uid'];
  }

  

  bool checkUser() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
