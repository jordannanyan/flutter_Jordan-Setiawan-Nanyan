Future<void> main() async {
  int bilangan = 5;
  int hasilFaktorial = 1;

  for (var j = 1; j <= bilangan; j++) {
    await Future.delayed(Duration(seconds: 1), () {
      hasilFaktorial = hasilFaktorial * j;
      print("Perkalian ke-$j");
    });
  }
  await Future.delayed(Duration(seconds: 1), () {
    print("Hasil Faktorial Bilangan $bilangan adalah $hasilFaktorial");
  });
}
