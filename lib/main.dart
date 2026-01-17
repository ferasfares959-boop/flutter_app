import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: SearchByPhonePage()
    );
  }
}

class SearchByPhonePage extends StatelessWidget {
  const SearchByPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: Colors.blue, elevation: 0,),
      body: Padding(padding: const
      EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'ادخل الرقم هنا',
                suffixIcon: const
                Icon(Icons.download, color: Colors.blue,),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const
                  BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, height: 50,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
                onPressed: () {},
                child: const Text('بحث برقم هاتف',
                    style: TextStyle(fontSize: 18, color: Colors.white,)
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.call),
      label: 'بحث بالرقم',),
    BottomNavigationBarItem(icon: Icon(Icons.book),label: 'دليل',),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'الاعدادات',),
    BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'المزيد',),
    ],
    )
    ,
    );
  }
}
