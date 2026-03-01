mixin Pengalaman {
  int tahunPengalaman = 0;

  void tambahPengalaman(int tahun) {
    tahunPengalaman += tahun;
    print('Pengalaman ditambah: $tahun tahun. Total: $tahunPengalaman tahun');
  }

  void setTahunMulai(int tahunMulai) {
    final currentYear = DateTime.now().year;
    if (tahunMulai > currentYear) {
      print('Tahun mulai tidak valid. Mengatur pengalaman ke 0.');
      tahunPengalaman = 0;
      return;
    }
    tahunPengalaman = currentYear - tahunMulai;
    print('Pengalaman dihitung dari tahun mulai $tahunMulai: $tahunPengalaman tahun');
  }
}