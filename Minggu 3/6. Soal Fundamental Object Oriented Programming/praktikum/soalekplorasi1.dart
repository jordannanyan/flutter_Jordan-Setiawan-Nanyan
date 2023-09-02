class Buku {
  var id;
  var judul;
  var penerbit;
  var harga;
  var kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class TokoBuku {
  List idBuku = [];
  List judulBuku = [];
  List penerbitBuku = [];
  List hargaBuku = [];
  List kategoriBuku = [];

  void tambahBuku(
      int id, String judul, String penerbit, int harga, String kategori) {
    idBuku.add(id);
    judulBuku.add(judul);
    penerbitBuku.add(penerbit);
    hargaBuku.add(harga);
    kategoriBuku.add(kategori);
  }

  void dapatkanBuku() {
    print(idBuku);
    print(judulBuku);
    print(penerbitBuku);
    print(hargaBuku);
    print(kategoriBuku);
  }

  void hapusBuku(int a) {
    idBuku.removeAt(a);
    judulBuku.removeAt(a);
    penerbitBuku.removeAt(a);
    hargaBuku.removeAt(a);
    kategoriBuku.removeAt(a);
  }
}

void main() {
  Buku buku1 = Buku(1, 'Bintang', 'Gramedia', 50000, 'Fiksi');
  Buku buku2 = Buku(2, 'Sejarah', 'Gramedia', 50000, 'Edukasi');
  Buku buku3 = Buku(3, 'Cinta', 'Gramedia', 50000, 'Novel');
  Buku buku4 = Buku(4, 'Rumah', 'Gramedia', 50000, 'Fiksi');
  Buku buku5 = Buku(5, 'Nyata', 'Gramedia', 50000, 'Kisah Nyata');

  TokoBuku tokoBuku = TokoBuku();

  tokoBuku.tambahBuku(
      buku1.id, buku1.judul, buku1.penerbit, buku1.harga, buku1.kategori);
  tokoBuku.tambahBuku(
      buku2.id, buku2.judul, buku2.penerbit, buku2.harga, buku2.kategori);
  tokoBuku.tambahBuku(
      buku3.id, buku3.judul, buku3.penerbit, buku3.harga, buku3.kategori);
  tokoBuku.tambahBuku(
      buku4.id, buku4.judul, buku4.penerbit, buku4.harga, buku4.kategori);

  print("Data Buku");
  tokoBuku.dapatkanBuku();
  print("Buku dihapus");
  tokoBuku.hapusBuku(1);
  print("Data Buku Baru");
  tokoBuku.dapatkanBuku();

  print("Tambah Buku");
  tokoBuku.tambahBuku(
      buku5.id, buku5.judul, buku5.penerbit, buku5.harga, buku5.kategori);

  print("Data Buku Baru Setelah Ditambah");
  tokoBuku.dapatkanBuku();
}
