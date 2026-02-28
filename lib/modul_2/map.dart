import 'dart:io';
void main() {
//   Map<String, String> data = {
//     'Adel': '08123456789',
//     'Alisya': '08198765432',
//     'Vale': '08134567890',
//   };
//   print('Data: $data');

//   //tambah data
// data['Dina'] = '08123456780';
// print('Data setelah ditambahkan: $data');

// //mengakses data berdasar key
// print('Nomor telepon Adel: ${data['Adel']}');


Map<String, String> data = {};

	// Contoh: input single terlebih dahulu
	print('\n=== INPUT DATA MAHASISWA ===');
	stdout.write('Masukkan NIM: ');
	String? singleNim = stdin.readLineSync();
	stdout.write('Masukkan Nama: ');
	String? singleNama = stdin.readLineSync();
	stdout.write('Masukkan Jurusan: ');
	String? singleJurusan = stdin.readLineSync();
	stdout.write('Masukkan IPK: ');
	String? singleIpk = stdin.readLineSync();

	Map<String, String> single = {
		'nim': singleNim ?? '',
		'nama': singleNama ?? '',
		'jurusan': singleJurusan ?? '',
		'ipk': singleIpk ?? ''
	};
	print('\nData Mahasiswa: $single');

	// Tambahkan contoh single ke data utama jika ingin disimpan
	if (singleNim != null && singleNim.trim().isNotEmpty) {
		data[singleNim.trim()] = '${singleNama ?? ''}, ${singleJurusan ?? ''}, ${singleIpk ?? ''}';
	}

	// Contoh: input multiple
	print('\n=== INPUT MULTIPLE MAHASISWA ===');
	stdout.write('Masukkan jumlah mahasiswa: ');
	String? jumlahStr = stdin.readLineSync();
	int jumlah = int.tryParse(jumlahStr ?? '') ?? 0;
	for (int i = 1; i <= jumlah; i++) {
		print('\n--- Mahasiswa ke-$i ---');
		_inputAndAdd(data);
	}

	// Menu operasi
	while (true) {
		print('\n=== MENU OPERASI ===');
		print('1. Tambah data');
		print('2. Ubah data');
		print('3. Hapus data');
		print('4. Cek data berdasar key');
		print('5. Hitung jumlah data');
		print('6. Tampilkan semua key');
		print('7. Tampilkan semua value');
		print('8. Tampilkan semua data');
		print('9. Keluar');
		stdout.write('Pilih (1-9): ');
		String? pilih = stdin.readLineSync();

		switch (pilih) {
			case '1':
				_inputAndAdd(data);
				break;
			case '2':
				_ubahData(data);
				break;
			case '3':
				_hapusData(data);
				break;
			case '4':
				_cekData(data);
				break;
			case '5':
				print('Jumlah data: ${data.length}');
				break;
			case '6':
				print('Semua key: ${data.keys.toList()}');
				break;
			case '7':
				print('Semua value: ${data.values.toList()}');
				break;
			case '8':
				print('Semua data:');
				data.forEach((k, v) => print(' - $k : $v'));
				break;
			case '9':
				print('Keluar. Terima kasih.');
				return;
			default:
				print('Pilihan tidak dikenal. Coba lagi.');
		}
	}
}

void _inputAndAdd(Map<String, String> data) {
	stdout.write('Masukkan NIM: ');
	String? nim = stdin.readLineSync();
	if (nim == null || nim.trim().isEmpty) {
		print('NIM tidak boleh kosong. Batal.');
		return;
	}
	stdout.write('Masukkan Nama: ');
	String? nama = stdin.readLineSync();
	stdout.write('Masukkan Jurusan: ');
	String? jurusan = stdin.readLineSync();
	stdout.write('Masukkan IPK: ');
	String? ipk = stdin.readLineSync();

	data[nim.trim()] = '${nama ?? ''}, ${jurusan ?? ''}, ${ipk ?? ''}';
	print('Data tersimpan untuk NIM ${nim.trim()}');
}

void _ubahData(Map<String, String> data) {
	stdout.write('Masukkan NIM yang akan diubah: ');
	String? nim = stdin.readLineSync();
	if (nim == null || !data.containsKey(nim)) {
		print('Data dengan NIM tersebut tidak ditemukan.');
		return;
	}
	print('Data sekarang: ${data[nim]}');
	stdout.write('Masukkan Nama baru (kosong = tidak diubah): ');
	String? nama = stdin.readLineSync();
	stdout.write('Masukkan Jurusan baru (kosong = tidak diubah): ');
	String? jurusan = stdin.readLineSync();
	stdout.write('Masukkan IPK baru (kosong = tidak diubah): ');
	String? ipk = stdin.readLineSync();

	// Parse existing pieces if present
	List<String> parts = data[nim]!.split(',').map((s) => s.trim()).toList();
	String curNama = parts.isNotEmpty ? parts[0] : '';
	String curJurusan = parts.length > 1 ? parts[1] : '';
	String curIpk = parts.length > 2 ? parts[2] : '';

	String newNama = (nama != null && nama.trim().isNotEmpty) ? nama.trim() : curNama;
	String newJurusan = (jurusan != null && jurusan.trim().isNotEmpty) ? jurusan.trim() : curJurusan;
	String newIpk = (ipk != null && ipk.trim().isNotEmpty) ? ipk.trim() : curIpk;

	data[nim] = '$newNama, $newJurusan, $newIpk';
	print('Data berhasil diubah.');
}

void _hapusData(Map<String, String> data) {
	stdout.write('Masukkan NIM yang akan dihapus: ');
	String? nim = stdin.readLineSync();
	if (nim == null || !data.containsKey(nim)) {
		print('Data dengan NIM tersebut tidak ditemukan.');
		return;
	}
	data.remove(nim);
	print('Data dengan NIM $nim telah dihapus.');
}

void _cekData(Map<String, String> data) {
	stdout.write('Masukkan NIM yang ingin dicek: ');
	String? nim = stdin.readLineSync();
	if (nim == null) {
		print('Input kosong.');
		return;
	}
	if (data.containsKey(nim)) {
		print('Ditemukan: $nim -> ${data[nim]}');
	} else {
		print('Tidak ditemukan data untuk NIM $nim');
	}
}

