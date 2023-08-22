void main() {
  print("Program ngecek kata palindrom");
  print("");
  String kataOriginal = "makan";
  String kebalikanKata = kataOriginal.split('').reversed.join();

  if (kataOriginal == kebalikanKata) {
    print("Kata $kataOriginal adalah palindrom");
  } else {
    print("Kata ini bukanlah suatu palindrom");
  }
}
