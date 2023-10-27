import 'package:flutter/material.dart';
import 'package:open_ai_demo/screen/result.dart';
import 'package:open_ai_demo/services/recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _kameraController = TextEditingController();
  final TextEditingController _penyimpananController = TextEditingController();
  bool isLoading = false;
  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });
    try {
      final result = await RecommendationService.getRecommendations(
        harga: _hargaController.value.text,
        kamera: _kameraController.value.text,
        penyimpanan: _penyimpananController.value.text,
      );
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text("Gagal Mengirim Request. Tolong Coba Lagi"),
      );
      _showSnackBar(snackBar);
    }
  }

  void _showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Rekomendasi HP"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  "Rekomendasi HP menggunakan AI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Masukan harga HP yang diinginkan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _hargaController,
                  decoration: const InputDecoration(
                    hintText: '0000000000',
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;
                    if (isInvalid) {
                      return 'Tolong Masukan Jumlah Yang Benar';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Masukan kualitas kamera HP yang diinginkan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _kameraController,
                  decoration: const InputDecoration(
                    hintText: 'Masukan Mega Pixel',
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;
                    if (isInvalid) {
                      return 'Tolong Masukan Angka Yang Benar';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Masukan ukuran penyimpanan HP yang diinginkan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _penyimpananController,
                  decoration: const InputDecoration(
                    hintText: 'Masukan angka (satuan GB)',
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;
                    if (isInvalid) {
                      return 'Tolong Masukan Angka Yang Benar';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: const Center(
                          child: Text(
                            "Dapatkan Rekomendasi",
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
