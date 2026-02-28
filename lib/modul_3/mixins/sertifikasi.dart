mixin Sertifikasi {
  List<String> sertifikat = [];

  void tambahSertifikat(String nama) {
    sertifikat.add(nama);
    print('Sertifikat ditambah: $nama');
  }

  void tampilkanSertifikat() {
    print('Sertifikat: ${sertifikat.join(', ')}');
  }
}