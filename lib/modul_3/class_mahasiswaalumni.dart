import 'dart:io';
import 'class_object.dart';

class MahasiswaAlumni extends Mahasiswa {
  String? tahunLulus;

  MahasiswaAlumni(String? nama, String? nim, String? jurusan, this.tahunLulus)
    : super() {
    this.nama = nama;
    this.nim = nim;
    this.jurusan = jurusan;
  }
  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}');
  }
}

  void main() {
    print("masukkan nama mahasiswa: ");
    String? nama = stdin.readLineSync();
    print("masukkan nim mahasiswa: ");
    String? nim = int.tryParse(stdin.readLineSync() ?? '')?.toString();
    print("masukkan jurusan mahasiswa: ");
    String? jurusan = stdin.readLineSync();
    print("masukkan tahun lulus mahasiswa: ");
    String? tahunLulus = stdin.readLineSync();
    MahasiswaAlumni mahasiswaAlumni = MahasiswaAlumni(nama, nim, jurusan, tahunLulus);
    mahasiswaAlumni.tampilkanInfo();
  }