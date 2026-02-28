import 'dart:io';
void main() {
  // List<String> names = ['Alfa', 'Beta', 'Charlie'];
  // print('Names: $names');

  // //menambah data ke list
  // names.add('Delta');
  // print('nama setelah ditambah: $names');

  // //mengambil index tertentu
  // print('elemen pertama: ${names[0]}');
  // print('jumlah elemen: ${names[1]}');

  // //mengubah data pada index tertentu
  // names[1] = 'Charlie';
  // print('nama setelah diubah: $names');

  // //menghapus data dari list
  // names.remove('Charlie');
  // print('nama setelah dihapus: $names');

  // //hitung jumlah elemen dalam list
  // print('jumlah elemen: ${names.length}');

  // //looping melalui list
  // print('menampilkan setiap elemen:');
  // for (String name in names) {
  //   print(name);
  // }

  //membuat list kosong
  List<String> dataList = [];
  print('data list kosong: $dataList');

  //mengambil jumlah data dari pengguna
  int count = 0;
  while (count <= 0) {
    stdout.write('masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('input tidak valid. masukkan angka yang benar.');
    }
  }

  //memasukkan data ke dalam list menggunakan for loop
  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  //menampilkan data dalam list
  print('data list');
  print(dataList);

   // menu operasi: tampil / ubah / hapus berdasarkan index
  while (true) {
    print('\n=== MENU ===');
    print('1. Tampil berdasarkan index tertentu');
    print('2. Ubah berdasarkan index tertentu');
    print('3. Hapus berdasarkan index tertentu');
    print('4. Tampilkan hasil akhir dan keluar');
    stdout.write('Pilih opsi (1-4): ');
    String? choice = stdin.readLineSync();
    if (choice == null) continue;

    if (choice == '1') {
      stdout.write('Masukkan index (mulai dari 0): ');
      String? idxStr = stdin.readLineSync();
      try {
        int idx = int.parse(idxStr!);
        if (idx < 0 || idx >= dataList.length) {
          print('Index di luar jangkauan. Rentang: 0..${dataList.length - 1}');
        } else {
          print('Index $idx: ${dataList[idx]}');
        }
      } catch (e) {
        print('Input index tidak valid. Masukkan angka.');
      }
    } else if (choice == '2') {
      stdout.write('Masukkan index yang akan diubah (mulai dari 0): ');
      String? idxStr = stdin.readLineSync();
      try {
        int idx = int.parse(idxStr!);
        if (idx < 0 || idx >= dataList.length) {
          print('Index di luar jangkauan. Rentang: 0..${dataList.length - 1}');
        } else {
          stdout.write('Masukkan nilai baru untuk index $idx: ');
          String? newVal = stdin.readLineSync();
          if (newVal != null) {
            dataList[idx] = newVal;
            print('Data setelah diubah: $dataList');
          } else {
            print('Input kosong. Tidak ada perubahan.');
          }
        }
      } catch (e) {
        print('Input index tidak valid. Masukkan angka.');
      }
    } else if (choice == '3') {
      stdout.write('Masukkan index yang akan dihapus (mulai dari 0): ');
      String? idxStr = stdin.readLineSync();
      try {
        int idx = int.parse(idxStr!);
        if (idx < 0 || idx >= dataList.length) {
          print('Index di luar jangkauan. Rentang: 0..${dataList.length - 1}');
        } else {
          String removed = dataList.removeAt(idx);
          print('Data "$removed" di index $idx dihapus. Saat ini: $dataList');
        }
      } catch (e) {
        print('Input index tidak valid. Masukkan angka.');
      }
    } else if (choice == '4') {
      // tampilkan hasil akhir dalam format contoh
      print('\n=== SEMUA DATA ===');
      for (int i = 0; i < dataList.length; i++) {
        print('Index $i: ${dataList[i]}');
      }
      break;
    } else {
      print('Pilihan tidak valid. Masukkan 1-4.');
    }
  }
}