mixin Kontak {
  String? email;
  String? noTelepon;

  void setKontak(String email, String noTelepon) {
    this.email = email;
    this.noTelepon = noTelepon;
  }

  void tampilkanKontak() {
    print('Email: ${email ?? 'Belum diisi'}');
    print('No Telepon: ${noTelepon ?? 'Belum diisi'}');
  }
}