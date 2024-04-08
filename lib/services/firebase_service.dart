import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addReview(String foodId, int newReview) async {
    try {
      await _firestore.collection('foods').doc(foodId).update({
        'review': newReview,
      });
    } catch (e) {
      print('Error adding review: $e');
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getFoodStream(String foodId) {
    return _firestore.collection('foods').doc(foodId).snapshots();
  }
}
