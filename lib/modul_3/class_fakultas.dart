import 'dart:io';
import 'class_object.dart';
import 'mixins/kontak.dart';
import 'mixins/sertifikasi.dart';

class Fakultas extends Mahasiswa with Sertifikasi, Kontak {
  String? kode;
  String? dekan;

  void tampilkanInfoFakultas() {
    print('\n=== INFO FAKULTAS ===');
    print('Nama Fakultas: ${nama ?? 'Belum diisi'}');
    print('Kode: ${kode ?? 'Belum diisi'}');
    print('Dekan: ${dekan ?? 'Belum diisi'}');
    tampilkanKontak();
    tampilkanSertifikat();
  }
}

void main() {
  Fakultas fakultas = Fakultas();
  
  stdout.write('Masukkan Nama Fakultas: ');
  fakultas.nama = stdin.readLineSync();
  
  stdout.write('Masukkan Kode Fakultas: ');
  fakultas.kode = stdin.readLineSync();
  
  stdout.write('Masukkan Nama Dekan: ');
  fakultas.dekan = stdin.readLineSync();
  
  stdout.write('Masukkan Nomor Telepon: ');
  String? telepon = stdin.readLineSync();
  
  stdout.write('Masukkan Email: ');
  String? email = stdin.readLineSync();
  
  fakultas.setKontak(email ?? '', telepon ?? '');
  
  stdout.write('Masukkan Sertifikasi: ');
  String? sertifikat = stdin.readLineSync();
  
  if (sertifikat != null && sertifikat.isNotEmpty) {
    fakultas.tambahSertifikat(sertifikat);
  }
  
  fakultas.tampilkanInfoFakultas();
}