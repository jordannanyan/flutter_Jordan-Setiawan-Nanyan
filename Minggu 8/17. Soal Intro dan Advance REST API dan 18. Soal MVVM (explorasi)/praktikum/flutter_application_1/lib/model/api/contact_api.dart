import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/contact_model.dart';

class ContactAPI {
  static final dio = Dio(); // Create a shared Dio instance for your API calls

  static Future<List<Contact>> getContacts() async {
    final response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    if (response.statusCode == 200) {
      List<Contact> contacts = (response.data as List)
          .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
          .toList();
      return contacts;
    } else {
      throw Exception('Gagal Mengambil Contact');
    }
  }

  static Future<String?> postContact(Contact contactData) async {
    final response = await dio.post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        'id': contactData.id,
        'name': contactData.name,
        'phone': contactData.phone,
      },
    );

    if (response.statusCode == 201) {
      return response.statusMessage;
    } else {
      throw Exception('Gagal Membuat Contact');
    }
  }

  static Future<String?> putContact(Contact contactData) async {
    final response = await dio.put(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/${contactData.id}',
      data: {
        'name': contactData.name,
        'phone': contactData.phone,
      },
    );

    if (response.statusCode == 200) {
      return response.statusMessage;
    } else {
      throw Exception('Gagal update contact');
    }
  }

  static Future<String?> deleteContact(int contactId) async {
    final response = await dio.delete(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$contactId',
    );

    if (response.statusCode == 200) {
      return response.statusMessage;
    } else {
      throw Exception('Gagal menghapus kontak');
    }
  }
}
