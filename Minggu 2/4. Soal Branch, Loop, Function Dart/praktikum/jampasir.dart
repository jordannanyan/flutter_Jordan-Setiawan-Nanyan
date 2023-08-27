import 'dart:io';

void main() {
  //pengulangan for untuk menuliskan bintang
  for (var i = 11; i > 0;) {
    var j = 12 - i;
    //menambahkan spasi agar bintang membentuk piramid terbalik
    stdout.write(" " * j);

    //menuliskan bintangnya sesuai dengan nilai i
    print("* " * i);
    i = i - 2;
  }

  //pengulangan for untuk menuliskan bintang
  for (var i = 1; i < 12;) {
    var j = 12 - i;
    //menambahkan spasi agar bintang membentuk piramid
    stdout.write(" " * j);

    //menuliskan bintangnya sesuai dengan nilai i
    print("* " * i);
    i = i + 2;
  }
}
