import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  final List<Map<String, String>> mahasiswa;

  const ListViewExample({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Mahasiswa')),
      body: ListView.builder(
        itemCount: mahasiswa.length,
        itemBuilder: (context, index) {
          final m = mahasiswa[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(m['nama'] ?? ''),
            subtitle: Text('NIM: ${m['nim']} - Kelas: ${m['kelas']}'),
          );
        },
      ),
    );
  }
}
