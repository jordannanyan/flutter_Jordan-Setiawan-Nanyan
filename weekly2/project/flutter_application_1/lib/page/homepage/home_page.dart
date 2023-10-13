import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Information_dialog.dart';
import 'package:flutter_application_1/page/contactus_page/contact_page.dart';
import 'package:flutter_application_1/page/loginpage/loginpage.dart';
import 'package:flutter_application_1/theme/themecolor.dart';
import 'package:flutter_application_1/theme/themetext.dart';
import 'package:flutter_application_1/widget/AboutUs.dart';
import 'package:flutter_application_1/widget/TextForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _email = "";
  String _message = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  List<String> dataPadang = [
    'Ayam Rendang',
    'Sapi Rendang',
    'Ayam Bakaran',
    'Ayam Gulai',
    'Sapi Gulai',
    'Ayam Goreng',
    'Ikan Goreng'
  ];
  List<String> dataDeskripsi = [
    'Ayam dengan rasa gurih manis yang tercamur dengan bumbu rendang yang spesial',
    'Sapi dengan rasa gurih manis yang tercamur dengan bumbu rendang yang spesial',
    'Ayam dengan rasa manis yang tercampur dengan rasa smokey dari proses pembakaran',
    'Ayam dengan rasa manis yang sudah menjadi ciri khas dari masakan gulai padang',
    'Sapi dengan rasa manis yang sudah menjadi ciri khas dari masakan gulai padang',
    'Ayam dengan rasa Gurih yang memang favorit banyak orang, seluruh Indonesia',
    'Ikan dengan rasa Gurih yang memang favorit banyak orang, seluruh Indonesia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi Saya',
          style: TextStyles.textHeader,
        ),
        centerTitle: true,
        backgroundColor: colorBlack,
      ),
      drawer: Drawer(
        backgroundColor: colorLightGrey,
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 38,
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Icon(Icons.phone),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ContactScreen()));
              },
            ),
            const ListTile(
              title: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(Icons.people),
            ),
            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Icon(Icons.login),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: colorLightGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage('assets/celebration.png'),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Aplikasi code competence dua saya untuk tugas flutter yang merupakan hasil kerja keras saya dari mempelajari flutter selama 8 minggu ini di Alterra, berikut adalah hasil pengerjaan tugas saya yaitu form dengan tombol submit yang mengeluarkan alert dialog berisikan data form tersebut',
                      style: TextStyles.textSubHeader,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Contact us',
                style: TextStyles.textHeader,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Hubungi kami dengan mengisi form ini!',
                style: TextStyles.textSubHeader,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormWidget(
                      textController: _usernameController,
                      labelText: 'Username',
                      errorText: 'Username tidak boleh kosong',
                      onSavedValue: (val) {
                        _username = val.toString();
                        val = "";
                        _usernameController.clear();
                      },
                      lines: 1,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormWidget(
                      textController: _emailController,
                      labelText: 'Email',
                      errorText: 'Email tidak boleh kosong',
                      onSavedValue: (val) {
                        _email = val.toString();
                        val = "";
                        _emailController.clear();
                      },
                      lines: 1,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormWidget(
                      textController: _messageController,
                      labelText: 'Message',
                      errorText: 'Message tidak boleh kosong',
                      onSavedValue: (val) {
                        _message = val.toString();
                        val = "";
                        _messageController.clear();
                      },
                      lines: 5,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          colorRed,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          informationDialog(
                              context, _username, _email, _message);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              AboutUsScreen(
                dataPadang: dataPadang,
                dataDeskripsi: dataDeskripsi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
