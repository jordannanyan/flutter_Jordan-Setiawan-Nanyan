import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/login_page/loginscreen.dart';
import 'package:flutter_application_2/provider/form_model.dart';
import 'package:flutter_application_2/widget/image_sheet_widget.dart';
import 'package:flutter_application_2/model/image_list_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListGambar extends StatefulWidget {
  const ListGambar({super.key});

  @override
  State<ListGambar> createState() => _ListGambarState();
}

class _ListGambarState extends State<ListGambar> {
  final List<ImageList> items = [
    ImageList(imagePath: 'assets/photo1.jpeg', imageName: 'Foto Pertama'),
    ImageList(imagePath: 'assets/photo2.jpg', imageName: 'Foto Kedua'),
    ImageList(imagePath: 'assets/photo3.jpg', imageName: 'Foto Ketiga'),
    ImageList(imagePath: 'assets/photo4.jpg', imageName: 'Foto Keempat'),
  ];
  late SharedPreferences loginData;
  String name = "";

  @override
  void initState() {
    super.initState();
    dataLogin();
  }

  void dataLogin() async {
    FormDataProvider formData =
        Provider.of<FormDataProvider>(context, listen: false);
    loginData = await SharedPreferences.getInstance();
    formData.updateUsername(loginData.getString('username').toString());
  }

  @override
  Widget build(BuildContext context) {
    FormDataProvider formData =
        Provider.of<FormDataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Gallery',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            ListTile(
              title: const Text(
                "Gambar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                "Contact",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/contact',
                );
              },
            ),
            ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                loginData.setBool('login', false);
                loginData.remove('username');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Color(0xFF000000), width: 2),
                  ),
                ),
                child: Text(formData.formData.username),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: GestureDetector(
                      child: Image(
                        image: AssetImage(items[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => ImageBottomSheet(
                            imagePath: items[index].imagePath,
                            imageName: items[index].imageName,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
