void main() {
  List daftarBilangan = [10, 40, 50];
  double hasilFaktorial = 1;

  //perulangan untuk tiap bilangan
  for (var i = 0; i < daftarBilangan.length; i++) {
    var bilangan = daftarBilangan[i];
    print("Hasil faktorial $bilangan adalah");
    //menuliskan hasil perulangan untuk faktor bilangan
    for (var j = 1; j <= bilangan; j++) {
      hasilFaktorial = hasilFaktorial * j;
    }
    print(hasilFaktorial);
  }
}
