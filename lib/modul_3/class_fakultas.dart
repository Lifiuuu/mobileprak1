

class Fakultas extends Mahasiswa with Pengalaman, Sertifikasi, Kontak {
  String? kode;
  String? dekan;

  void tampilkanInfoFakultas() {
    print('\n=== INFO FAKULTAS ===');
    print('Nama Fakultas: ${nama ?? 'Belum diisi'}');
    print('Kode: ${kode ?? 'Belum diisi'}');
    print('Dekan: ${dekan ?? 'Belum diisi'}');
    tampilkanKontak();
    print('Pengalaman Berdiri: $tahunPengalaman tahun');
    tampilkanSertifikat();
  }
}