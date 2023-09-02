class Kalkulator {
  void penjumlahan(int a, int b) {
    print("Hasil Perhitungan Adalah");
    print(a + b);
  }

  void pengurangan(int a, int b) {
    print("Hasil Perhitungan Adalah");
    print(a - b);
  }

  void perkalian(int a, int b) {
    print("Hasil Perhitungan Adalah");
    print(a * b);
  }

  void pembagian(int a, int b) {
    print("Hasil Perhitungan Adalah");
    print(a / b);
  }
}

class Course {
  var judul;
  var deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  var nama = 'Jordan';
  var kelas = 'Flutter A';
  List<String> daftarCourse = [];

  void tambahCourse(String a) {
    daftarCourse.add(a);
  }

  void hapusCourse(int a) {
    daftarCourse.removeAt(a);
  }

  void lihatCourse() {
    print(nama);
    print(kelas);
    print(daftarCourse);
  }
}

void main() {
  Kalkulator kalkulator = Kalkulator();
  Course course1 = Course("Course 1", "Mengajarkan Course 1");
  Course course2 = Course("Course 2", "Mengajarkan Course 2");
  Course course3 = Course("Course 3", "Mengajarkan Course 3");
  Course course4 = Course("Course 4", "Mengajarkan Course 4");
  Course course5 = Course("Course 5", "Mengajarkan Course 5");
  Student student = Student();

  kalkulator.penjumlahan(5, 5);
  kalkulator.pengurangan(5, 5);
  kalkulator.perkalian(5, 5);
  kalkulator.pembagian(5, 5);

  student.tambahCourse(course1.judul);
  student.tambahCourse(course2.judul);
  student.tambahCourse(course3.judul);
  student.tambahCourse(course4.judul);
  student.tambahCourse(course5.judul);

  student.lihatCourse();

  student.hapusCourse(2);

  student.lihatCourse();
}
