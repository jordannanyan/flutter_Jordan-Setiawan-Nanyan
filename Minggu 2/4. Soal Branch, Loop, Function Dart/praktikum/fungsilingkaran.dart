void main() {
  print("Hitung keliling dan luas lingkaran");
  print("");

  hitungLingkaran(12);
}

void hitungLingkaran(double radius) {
  print("Radius lingkaran adalah $radius");
  const pi = 3.14;

  double? kelilingLingkaran = 2 * pi * radius;
  double? luasLingkaran = pi * (radius * radius);

  print("Keliling lingkaran ini adalah $kelilingLingkaran");
  print("Luas lingkaran ini adalah $luasLingkaran");
}
