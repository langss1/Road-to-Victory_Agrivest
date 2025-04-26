import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var nama = ''.obs;
  var email = ''.obs;
  var photoUrl = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        email.value = user.email ?? '';

        DocumentSnapshot<Map<String, dynamic>> doc =
            await _firestore.collection('investor').doc(user.uid).get();

        if (doc.exists) {
          nama.value = doc.data()?['nama'] ?? 'No Name';
          photoUrl.value = doc.data()?['photoUrl'] ?? '';
        } else {
          nama.value = 'User not found';
        }
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

  void logout() async {
    await _auth.signOut();
    await GetStorage().erase();
    Get.offAllNamed('/login-investor');
  }
}
