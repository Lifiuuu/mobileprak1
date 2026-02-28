import 'dart:io';

void main() {
 Set<String> dataSet = {'a', 'b', 'c', 'd', 'e'};

  print('\n=== SEMUA DATA ===');
  int i = 1;
  for (String data in dataSet) {
    print('$i. $data');
    i++;
  }
  print('total data: ${dataSet.length}');

    
    //tambah duplicate
  stdout.write('Masukkan data yang akan ditambahkan (duplicate): ');
  String? duplicateValue = stdin.readLineSync();
  if (duplicateValue == null) {
    print('Input kosong.');
  } else {
    dataSet.add(duplicateValue);
    print('Data "$duplicateValue" berhasil ditambahkan.');
  }  
  

  //hapus data
  stdout.write('Masukkan data yang akan dihapus: ');
  String? value = stdin.readLineSync();
  if (value == null) {
    print('Input kosong.');
  } else {
    if (!dataSet.contains(value)) {
      print('Data "$value" tidak ditemukan dalam set.');
    } else {
      dataSet.remove(value);
      print('Data "$value" berhasil dihapus. ');
    }
  }

  //cek data tertentu
  stdout.write('Masukkan data yang akan dicek : ');
  String? checkValue = stdin.readLineSync();
  if (checkValue == null) {
    print('Input kosong.');
  } else {
    int idx = dataSet.toList().indexOf(checkValue);
    if (idx == -1) {
      print('Data "$checkValue" tidak ditemukan dalam set.');
    } else {
      print('Data ditemukan pada Index ${idx + 1}: ${dataSet.toList()[idx]}');
    }
  }
      
}