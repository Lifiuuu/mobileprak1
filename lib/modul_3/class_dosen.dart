import 'dart:io';
import 'class_object.dart';
import 'mixins/kontak.dart';
import 'mixins/pengalaman.dart';
import 'mixins/sertifikasi.dart';

class Dosen extends Mahasiswa with Pengalaman, Sertifikasi, Kontak {
  String? nip;

  void tampilkanInfoDosen() {
    print('\n=== INFO DOSEN ===');
    print('Nama: ${nama ?? 'Belum diisi'}');
    print('NIP: ${nip ?? 'Belum diisi'}');
    print('Jurusan: ${jurusan ?? 'Belum diisi'}');
    tampilkanKontak();
    print('Pengalaman: $tahunPengalaman tahun');
    tampilkanSertifikat();
  }
}

void main() {
  Dosen dosen = Dosen();

  stdout.write('Masukkan Nama Dosen: ');
  dosen.nama = stdin.readLineSync();

  stdout.write('Masukkan NIP: ');
  dosen.nip = stdin.readLineSync();

  stdout.write('Masukkan Jurusan: ');
  dosen.jurusan = stdin.readLineSync();

  stdout.write('Masukkan Nomor Telepon: ');
  String? telepon = stdin.readLineSync();

  stdout.write('Masukkan Email: ');
  String? email = stdin.readLineSync();

  dosen.setKontak(email ?? '', telepon ?? '');

  stdout.write('Masukkan Tahun Mulai Kerja (YYYY): ');
  String? tms = stdin.readLineSync();
  if (tms != null && tms.isNotEmpty) {
    int? tahunMulai = int.tryParse(tms);
    if (tahunMulai != null) {
      dosen.setTahunMulai(tahunMulai);
    } else {
      print('Input tahun tidak valid. Pengalaman diset 0.');
    }
  } else {
    print('Tidak ada input tahun mulai. Pengalaman diset 0.');
  }

  stdout.write('Masukkan Sertifikasi (kosong jika tidak ada): ');
  String? sertifikat = stdin.readLineSync();
  if (sertifikat != null && sertifikat.isNotEmpty) {
    dosen.tambahSertifikat(sertifikat);
  }

  dosen.tampilkanInfoDosen();
}