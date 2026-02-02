import 'package:get/get.dart';
import '../../database/db_helper.dart';

class SearchController extends GetxController {
  final RxString phoneNumber = ''.obs;
  final RxBool isSearching = false.obs;

  void updatePhoneNumber(String value) {
    phoneNumber.value = value.trim();
  }

  Future<Map<String, dynamic>?> search() async {
    final q = phoneNumber.value.trim();
    if (q.isEmpty) return null;

    isSearching.value = true;
    try {
      final db = await DBHelper.getDatabase();
      final result = await db.query(
        DBHelper.CONTACT_TABLE,
        where: 'phone = ?',
        whereArgs: [q],
        limit: 1,
      );

      if (result.isNotEmpty) return result.first;
      return null;
    } finally {
      isSearching.value = false;
    }
  }
}