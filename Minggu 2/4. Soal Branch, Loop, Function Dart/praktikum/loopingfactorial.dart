void main() {
  List daftarBilangan = [10, 40, 50];

  //perulangan untuk tiap bilangan
  for (var i = 0; i < daftarBilangan.length; i++) {
    int j = 1;
    var bilangan = daftarBilangan[i];
    print("Hasil faktorial $bilangan adalah");
    //menuliskan hasil perulangan untuk faktorialnya
    while (j < daftarBilangan[i]) {
      if (daftarBilangan[i] % j == 0.0) {
        print(j);
      }
      j++;
    }
    print("");
  }
}
