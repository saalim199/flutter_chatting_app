import 'package:chatting_app/screens/home_page.dart';
import 'package:chatting_app/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get user => _auth.currentUser;

  void loading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> login(String email, String password) async {
    loading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomePage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading(false);
  }

  Future<void> register(String name, String email, String password) async {
    loading(true);
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'uid': _auth.currentUser!.uid,
        'name': name,
        'email': email,
      }, SetOptions(merge: true));
      Get.offAll(HomePage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading(false);
  }

  Future<void> signOut() async {
    loading(true);
    try {
      await _auth.signOut();
      Get.offAll(LoginPage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading(false);
  }

  //IMPLEMETATION OF FORGOT PASSWORD
}
