mixin Pengalaman {
  int tahunPengalaman = 0;

  void tambahPengalaman(int tahun) {
    tahunPengalaman += tahun;
    print('Pengalaman ditambah: $tahun tahun. Total: $tahunPengalaman tahun');
  }
}