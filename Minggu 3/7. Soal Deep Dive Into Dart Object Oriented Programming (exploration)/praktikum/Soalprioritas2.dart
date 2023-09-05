class Matematika {
  hasil() {}
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 17;
  int y = 15;
  List angkaPerkali = [];

  int nilaiFaktorTerbesar() {
    while (y != 0) {
      var temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }

  @override
  hasil() {
    var i = (x * y) ~/ nilaiFaktorTerbesar();
    print("Kelipatan Persekutuan Terkecil adalah $i");
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  var x = 17;
  var y = 15;

  @override
  hasil() {
    while (y != 0) {
      var temp = y;
      y = x % y;
      x = temp;
    }
    print("Faktor persekutuan terbesar adalah $x");
  }
}

void main() {
  FaktorPersekutuanTerbesar k1 = FaktorPersekutuanTerbesar();
  KelipatanPersekutuanTerkecil k2 = KelipatanPersekutuanTerkecil();

  k1.hasil();
  k2.hasil();
}
