void main() {
  List<double> daftarNilai = [7, 5, 3, 5, 2, 1];
  double mean = 0;

  print("Menghitung rata-rata");
  hitungRata(daftarNilai, mean);
}

void hitungRata(List<double> nilai, double rata) {
  for (var i = 0; i < nilai.length; i++) {
    rata = rata + nilai[i];
  }
  rata = rata / nilai.length;
  if (rata % 1 != 0.0) {
    if ((rata % 1) > 0.5) {
      rata = rata + (1 - (rata % 1));
    } else {
      rata = rata - (rata % 1);
    }
  }
  print("Rata-rata daftar nilai adalah $rata");
}
