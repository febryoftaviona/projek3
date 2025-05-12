import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  final kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) => value!.isEmpty ? 'Masukkan nama' : null,
              ),
              TextFormField(
                controller: nimController,
                decoration: InputDecoration(labelText: 'NIM'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Masukkan NIM' : null,
              ),
              TextFormField(
                controller: kelasController,
                decoration: InputDecoration(labelText: 'Kelas'),
                validator: (value) => value!.isEmpty ? 'Masukkan kelas' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'nama': namaController.text,
                      'nim': nimController.text,
                      'kelas': kelasController.text,
                    });
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
