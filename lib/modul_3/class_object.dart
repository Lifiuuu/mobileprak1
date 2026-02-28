import 'dart:io';

class Mahasiswa {
  String? nama;
  String? nim;
  String? jurusan;


  void tampilkanInfo() {
    print('Nama: ${nama ?? 'Belum diisi'}');
    print('NIM: ${nim ?? 'Belum diisi'}');
    print('Jurusan: ${jurusan ?? 'Belum diisi'}');
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa();
  print("masukkan nama mahasiswa: ");
  mahasiswa.nama = stdin.readLineSync();
  print("masukkan nim mahasiswa: ");
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '')?.toString();
  print("masukkan jurusan mahasiswa: ");
  mahasiswa.jurusan = stdin.readLineSync();
  mahasiswa.tampilkanInfo();
}

