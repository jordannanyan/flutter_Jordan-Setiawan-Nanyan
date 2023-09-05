class BangunRuang {
  var panjang = 12;
  var lebar = 13;
  var tinggi = 14;

  volume() {
    print("Hitung volume Bangun Ruang");
    print(panjang * lebar * tinggi);
  }
}

class Kubus extends BangunRuang {
  var sisi = 5;

  @override
  volume() {
    print("Hitung volume Kubus");
    print(sisi * sisi);
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    print("Hitung volume Balok");
    print(panjang * lebar * tinggi);
  }
}

void main() {
  var bangun = BangunRuang();
  bangun.volume();
  var bangunKubus = Kubus();
  bangunKubus.volume();
  var bangunBalok = Balok();
  bangunBalok.volume();
}
