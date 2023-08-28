void main() {
  Set isiDaftar;
  List Data = [];
  Map<String, int> jumlahData = {};
  var jumlah = 0;
  List<String> daftar = [
    "js",
    "js",
    "js",
    "golang",
    "python",
    "js",
    "js",
    "golang",
    "rust"
  ];

  isiDaftar = daftar.toSet();

  isiDaftar.forEach((element) {
    Data.add(element);
  });

  for (var i = 0; i < Data.length; i++) {
    for (var j = 0; j < daftar.length; j++) {
      if (Data[i] == daftar[j]) {
        jumlah = jumlah + 1;
      }
    }
    final masukData = <String, int>{Data[i]: jumlah};
    jumlahData.addEntries(masukData.entries);
    jumlah = 0;
  }

  print(jumlahData);
}
