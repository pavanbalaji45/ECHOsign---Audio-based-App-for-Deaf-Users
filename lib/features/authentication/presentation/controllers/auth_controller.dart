import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Box authBox = Hive.box('authBox');
  var currentUser = Rxn<User>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSession();
  }

  /// Sign Up
  Future<void> signUp(String name, String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);
      currentUser.value = userCredential.user;
      _saveSession();
      isLoading.value = false;
      Get.offAllNamed('/main-page');
      Get.snackbar('Success', 'Account created successfully');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  /// Sign In
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser.value = userCredential.user;
      _saveSession();
      isLoading.value = false;
      Get.snackbar('Success', 'Logged in successfully');
      Get.offAllNamed('/main-page');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  /// Sign Out
  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _auth.signOut();
      currentUser.value = null;
      authBox.delete('user');
      isLoading.value = false;
      Get.offAllNamed('/on-boarding');
      Get.snackbar('Success', 'Logged out successfully');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      isLoading.value = false;
      Get.snackbar('Success', 'Password reset link sent to your email');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  /// Load Session
  void _loadSession() {
    final userData = authBox.get('user');
    if (userData != null) {
      currentUser.value = _auth.currentUser;
    }
  }

  /// Save Session
  void _saveSession() {
    if (currentUser.value != null) {
      authBox.put('user', {
        'uid': currentUser.value!.uid,
        'email': currentUser.value!.email,
      });
    }
  }
}
