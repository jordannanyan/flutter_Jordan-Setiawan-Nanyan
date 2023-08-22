import 'dart:io';

void main() {
  print("Hitung Luas dan Keliling Persegi/Persegi Panjang");
  print("Masukan Panjang");
  int? panjang = int.parse(stdin.readLineSync()!);
  print("Masukan Lebar");
  int? lebar = int.parse(stdin.readLineSync()!);

  int? luasPersegi = panjang * lebar;
  int? kelilingPersegi = (panjang + lebar) * 2;

  print("Luas Bangun Adalah $luasPersegi");
  print("Keliling Bangun Adalah $kelilingPersegi");

  print("");

  print("Hitung Luas dan Keliling Lingkaran");
  print("Masukan Radius");
  double? radius = double.parse(stdin.readLineSync()!);
  const pi = 3.14;

  double? kelilingLingkaran = 2 * pi * radius;
  double? luasLingkaran = pi * (radius * radius);

  print("Luas Bangun Adalah $luasLingkaran");
  print("Keliling Bangun Adalah $kelilingLingkaran");
}
