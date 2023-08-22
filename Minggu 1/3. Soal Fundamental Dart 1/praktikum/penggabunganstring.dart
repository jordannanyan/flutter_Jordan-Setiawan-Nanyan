import 'dart:io';

void main() {
  print("Program Soal Proiritas 2");
  print("");
  stdout.write("Masukan Kata Pertama : ");
  String? kataSatu = stdin.readLineSync();
  stdout.write("Masukan Kata Kedua : ");
  String? kataDua = stdin.readLineSync();
  stdout.write("Masukan Kata Ketiga : ");
  String? kataTiga = stdin.readLineSync();

  print("$kataSatu $kataDua $kataTiga");
  print("");

  const pi = 3.14;
  stdout.write("Masukan Radius Tabung : ");
  double radius = double.parse(stdin.readLineSync()!);
  stdout.write("Masukan Tinggi Tabung : ");
  double tinggi = double.parse(stdin.readLineSync()!);
  double volume = (pi * radius * radius) * tinggi;

  stdout.write("Volume radius adalah sebesar $volume");
}
