import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/gambar_pages/gambar_screen.dart';
import 'package:flutter_application_2/provider/form_model.dart';
import 'package:flutter_application_2/theme/theme_color.dart';
import 'package:flutter_application_2/widget/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences loginData;

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: const Text(
          'Halaman Login',
          style: TextStyle(color: lightgreyColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextField(
              controller: usernameController,
              labelText: 'Masukan Username',
              hintText: 'Username',
              errorText: 'Username Salah',
              obscureText: false,
              isNameValid: true,
              onChanged: (val) {
                formData.updateUsername(val);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InputTextField(
              controller: passwordController,
              labelText: 'Masukan Passeord',
              hintText: 'Password',
              errorText: 'Password Salah',
              obscureText: true,
              isNameValid: true,
              onChanged: (val) {
                formData.updatePassword(val);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(darkpurpleColor),
                ),
                onPressed: () {
                  String username = formData.formData.username;
                  if (username.isNotEmpty) {
                    loginData.setBool('login', false);
                    loginData.setString('username', username);
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListGambar(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: lightpurpleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
