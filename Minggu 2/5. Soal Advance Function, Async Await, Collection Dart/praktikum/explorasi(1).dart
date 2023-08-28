void main() {
  List<String> daftar = [
    "amuse",
    "tommy kaira",
    "spoon",
    "HKS",
    "litchfield",
    "amuse",
    "HKS"
  ];
  Set daftarUnik;

  daftarUnik = daftar.toSet();

  daftar.clear();
  daftarUnik.forEach((element) {
    daftar.add(element);
  });

  print(daftar);
}
