import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App - Agna',  // Question 1
      debugShowCheckedModeBanner: false,
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = "";
  bool loading = false;

  // ============================
  //  Lab 1 — getData()
  //     (untuk sekarang di-comment sesuai instruksi Step 3)
  // ============================

  /*
  Future<String> getData() async {
    String path = "https://www.googleapis.com/books/v1/volumes/PA7uDwAAQBAJ";

    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Failed to load data");
    }
  }
  */


  //  LAB 2 — STEP 1: Tambahkan 3 method async
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  //  LAB 2 — STEP 2: Tambahkan method count()
  Future<int> count() async {
    int total = 0;

    total += await returnOneAsync();   // 3 detik
    total += await returnTwoAsync();   // 3 detik
    total += await returnThreeAsync(); // 3 detik

    return total; 
  }

  // ============================
  //  UI
  // ============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 2 - Sequential Async"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (loading) const CircularProgressIndicator(),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: SelectableText(result),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                // ============================
                //  LAB 2 — STEP 3
                // Hapus kode lama, ganti dengan count()
                // ============================
                onPressed: () async {
                  setState(() {
                    loading = true;
                    result = "";
                  });

                  int value = await count(); // total 9 detik

                  setState(() {
                    result = "Result: $value"; // hasil = 6
                    loading = false;
                  });
                },
                child: const Text("Count (9 seconds)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
