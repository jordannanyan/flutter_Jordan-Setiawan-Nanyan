import 'dart:io';

void main() {
  //memasukan angka
  stdout.write("Masukan Angka : ");
  int kali = int.parse(stdin.readLineSync()!);

  //perulangan untuk menuliskan angka vertikal pada ujung kiri
  for (var i = 1; i <= kali; i++) {
    stdout.write("$i   ");
    //perulangan untuk penulisan angka horizontal hasil perkalian
    for (var j = 2; j <= kali; j++) {
      var hasil = j * i;
      stdout.write("$hasil   ");
    }
    print(" ");
  }
}
