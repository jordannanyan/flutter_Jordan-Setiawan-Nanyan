import 'dart:io';

void main() {
  //pengulangan for untuk menuliskan bintang
  for (var i = 1; i < 16;) {
    var j = 17 - i;
    //menambahkan spasi agar bintang membentuk piramid
    stdout.write(" " * j);

    //menuliskan bintangnya sesuai dengan nilai i
    print("* " * i);
    i = i + 2;
  }
}
