import 'dart:io';

void main() {
  print("Program Mencari Faktor Bilangan");
  print("");

  stdout.write("Masukan Angka : ");
  double angkaPertama = double.parse(stdin.readLineSync()!);

  print("Hasil faktornya adalah");

  int i = 1;
  while (i < angkaPertama) {
    if (angkaPertama % i == 0.0) {
      print(i);
    }
    i++;
  }
}
