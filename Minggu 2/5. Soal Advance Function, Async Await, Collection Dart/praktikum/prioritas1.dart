void main() {
  List<int> data = [1, 2, 3];
  int kaliAngka = 5;
  print(data);
  kali(data, kaliAngka);
}

Future<void> kali(List<int> listData, int pengali) async {
  for (var i = 0; i < listData.length; i++) {
    await Future.delayed(Duration(seconds: 1), () {
      int temp;
      temp = listData[0] * pengali;
      print("Mengubah Data Menjadi $temp");
      listData.removeAt(0);
      listData.add(temp);
    });
  }
  print(listData);
}
