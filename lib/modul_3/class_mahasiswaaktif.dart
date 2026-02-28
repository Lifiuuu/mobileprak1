import 'dart:io';
import 'class_object.dart';

class MahasiswaAktif extends Mahasiswa {
  String? status;

  MahasiswaAktif(String? nama, String? nim, String? jurusan, this.status)
    : super() {
    this.nama = nama;
    this.nim = nim;
    this.jurusan = jurusan;
  }
  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Status: ${status ?? 'Belum diisi'}');
  }
}
  void main() {
    print("masukkan nama mahasiswa: ");
    String? nama = stdin.readLineSync();
    print("masukkan nim mahasiswa: ");
    String? nim = int.tryParse(stdin.readLineSync() ?? '')?.toString();
    print("masukkan jurusan mahasiswa: ");
    String? jurusan = stdin.readLineSync();
    print("masukkan status mahasiswa: ");
    String? status = stdin.readLineSync();
    MahasiswaAktif mahasiswaAktif = MahasiswaAktif(nama, nim, jurusan, status);
    mahasiswaAktif.tampilkanInfo();
  }
