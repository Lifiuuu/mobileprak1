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
  dosen.nama = 'Dr. Budi Santoso';
  dosen.nip = '123456789';
  dosen.jurusan = 'Teknik Informatika';
  dosen.setKontak('budi.santoso@university.edu', '081234567890');
  dosen.tambahPengalaman(10);
  dosen.tambahSertifikat('Sertifikasi Pengajaran');
  dosen.tampilkanInfoDosen();
}