class Hewan {
  var berat = 30;
}

class Mobil {
  Hewan h1 = Hewan();
  var kapasitas = 300;
  List muatan = [];

  void tambahMuatan(int berat) {
    if (berat < kapasitas) {
      muatan.add(berat);
      print("Muatan Ditambah");
      print(muatan);
    } else {
      print("Muatan Tidak Ditamabh");
    }
  }
}

void main() {
  Hewan hewan = Hewan();
  Mobil mobil = Mobil();

  mobil.tambahMuatan(hewan.berat);
}
