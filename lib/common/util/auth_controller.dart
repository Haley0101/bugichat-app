import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class AuthController {
  final _authentication = FirebaseAuth.instance;
  Future<String?> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      String? pushToken = await getPushToken();
      if (pushToken != null) {
        updatePushToken(email: email, pushToken: pushToken);
      }
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var idToken = await user.getIdToken();
        updateIdToken(email: email, idToken: idToken.toString());
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('idToken', idToken.toString());
      } else {
        return 'not have Email';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'not have Email';
      } else if (e.code == 'wrong-password') {
        return 'please check your password';
      } else {
        return e.code.toString();
      }
    }
    return null;
  }

  static Future<void> saveLocalStorage(UserCredential userCredential) async {}

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('idToken');
    prefs.remove('email');
    prefs.remove('password');

    Get.offAllNamed("/sign_in");
  }

  static Future<String?> getPushToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  Future<void> updatePushToken({required String email, required String pushToken}) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    String id = querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'pushToken': pushToken,
    });
  }

  Future<void> updateIdToken({required String email, required String idToken}) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    String id = querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'idToken': idToken,
    });
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    var userUid = String.fromCharCodes(Iterable.generate(20, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
    final firebaseInstance = FirebaseFirestore.instance;
    final CollectionReference userCollection = firebaseInstance.collection("users");

    final key = encrypt.Key.fromUtf8('FarmfaAppoonDeveloperAFKLeeAndMe');
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    // data에 'password': encrypted.base64, 추가
    data = {...data, 'password': encrypted.base64, 'uid': userUid, 'pushToken': '', 'idToken': '', "createDate": DateTime.now().toString()};

    try {
      await _authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCollection.doc(userUid).set(data);
    } catch (e) {
      Get.snackbar('에러', e.toString(), backgroundColor: Colors.white);
      debugPrint(e.toString());
      return false;
    }
    return true;
  }

  deleteAccount({
    required String uid,
  }) async {
    final firebaseInstance = FirebaseFirestore.instance;
    final CollectionReference userCollection = firebaseInstance.collection("users");

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.delete();
      userCollection.doc(uid).delete();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('idToken');
      prefs.remove('email');
      prefs.remove('password');

      Get.offAllNamed("/sign_in");
    }
  }

  updatePassword(String password) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updatePassword(password);
    }
  }
}
