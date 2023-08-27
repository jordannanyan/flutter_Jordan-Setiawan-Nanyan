void main() {
  //deklarasi variabel angka dan bool untuk mengecek bilangan prima
  double angka = 11;
  bool isTrue = true;

  //perulangan for untuk mengecek apakah angka ini bilangan prima
  for (var i = 2; i <= angka / i; i++) {
    // disini angka akandi modulus dengan nilai perulangan nya, jika hasil modulus 0 maka bukan bilangan prima
    if (angka % i == 0) {
      isTrue = false;
    }
  }

  //print apakah angka bilangan prima atau tidal
  if (isTrue) {
    print("angka $angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}
