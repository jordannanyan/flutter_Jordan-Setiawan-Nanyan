void main() {
  List<List<String>> listPertama = [];
  Map<String, String> mapList = {};

  List<String> isiSatu = ["Hiu-Putih", "Jordan"];
  List<String> isiDua = ["Alamat", "Nama"];

  listPertama.add(isiSatu);
  listPertama.add(isiDua);

  for (var i = 0; i < listPertama.length; i++) {
    final masukData = <String, String>{listPertama[1][i]: listPertama[0][i]};
    mapList.addEntries(masukData.entries);
  }

  print("Data List adalah $listPertama");
  print("Data Map adalah $mapList");
}
