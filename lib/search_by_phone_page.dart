import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page/result_page.dart';

class SearchByPhonePage extends StatelessWidget {
  SearchByPhonePage({super.key});

  final SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بحث برقم الهاتف')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'ادخل الرقم هنا',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.updatePhoneNumber,
            ),
            const SizedBox(height: 16),

            Obx(() => ElevatedButton(
              onPressed: controller.isSearching.value
                  ? null
                  : () async {
                      final result = await controller.search();
                      if (result != null) {
                        Get.to(() => ResultPage(
                          name: result['name'],
                          phone: result['phone'],
                        ));
                      } else {
                        Get.snackbar(
                          'غير موجود',
                          'الرقم غير موجود',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
              child: controller.isSearching.value
                  ? const CircularProgressIndicator()
                  : const Text('بحث'),
            )),
          ],
        ),
      ),
    );
  }
}